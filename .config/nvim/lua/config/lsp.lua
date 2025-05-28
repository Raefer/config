-- highlighting

-- :TSInstall to reinstall parsers
require("nvim-treesitter.configs").setup({
	-- Auto install parsers not listed below
	auto_install = false,
	ensure_installed = {
		"c",
		"cpp",
		"groovy",
		"java",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"nix",
		"norg",
		"python",
		"query",
		"rust",
		"vim",
		"vimdoc",
	},
	highlight = {
		enable = true,
		disable = {},
		-- Some languages depend on vim's regex highlighting for their indent rules.
		-- If some indenting tomfoolery is happening, add it to this list and disable indenting below.
		additional_vim_regex_highlighting = { "ruby" },
	},
	indent = {
		enable = true,
		disable = { "ruby" },
	},
})

-- keybinds

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local buf = event.buf
		local name = "LSP"
		local telescope_builtin = require("telescope.builtin")

		-- List
		Map("<leader>lr", name, "[L]ist [R]eferences", vim.lsp.buf.references, buf)
		Map("<leader>ld", name, "[L]ist [D]ocument symbols", telescope_builtin.lsp_document_symbols, buf)
		Map("<leader>lw", name, "[L]ist [W]orkspace symbols", telescope_builtin.lsp_dynamic_workspace_symbols, buf)

		-- Goto
		Map("<leader>gd", name, "[G]o to [D]efinitions", vim.lsp.buf.definition, buf)
		Map("<leader>gc", name, "[G]o to de[C]laration", vim.lsp.buf.declaration, buf)
		Map("<leader>gi", name, "[G]o to [I]mplementation", vim.lsp.buf.implementation, buf)
		Map("<leader>gt", name, "[G]o to [T]ype definition", vim.lsp.buf.type_definition, buf)

		-- Actions
		Map("<leader>r", name, "[R]ename", vim.lsp.buf.rename, buf)
		Map("<leader>c", name, "[C]ode action", vim.lsp.buf.code_action, buf)

		-- Documentation
		Map("K", name, "Hover documentation", vim.lsp.buf.hover, buf)
		Map("<C-k>", name, "Signature documentation", vim.lsp.buf.signature_help, buf)

		-- Diagnostics
		Map("<leader>w", name, "Open floating diagnostic message", vim.diagnostic.open_float, buf)
		Map("<leader>q", name, "Open diagnostic list", vim.diagnostic.setloclist, buf)
	end,
})

-- lspconfig

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig")["lua_ls"].setup({
	-- settings from https://lsp-zero.netlify.app/docs/guide/neovim-lua-ls.html
	capabilities = capabilities,
	settings = {
		Lua = {
			telemetry = {
				enable = false,
			},
		},
	},
	on_init = function(client)
		local join = vim.fs.joinpath
		local path = client.workspace_folders[1].name

		-- Don't do anything if there is project local config
		if vim.uv.fs_stat(join(path, ".luarc.json")) or vim.uv.fs_stat(join(path, ".luarc.jsonc")) then
			return
		end

		local nvim_settings = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					-- Make the server aware of Neovim runtime files
					vim.env.VIMRUNTIME,
					vim.fn.stdpath("config"),
				},
			},
		}

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, nvim_settings)
	end,
})

require("lspconfig")["texlab"].setup({
	capabilities = capabilities,
})

-- formatter

require("conform").setup({
	-- formatter needs to be manually downloaded
	formatters_by_ft = {
		lua = { "stylua" },
	},
	format_on_save = function(bufnr)
		-- local disable_filetypes = { c = true, cpp = true }
		local disable_filetypes = {}
		local lsp_format_opt
		if disable_filetypes[vim.bo[bufnr].filetype] then
			lsp_format_opt = "never"
		else
			lsp_format_opt = "fallback"
		end

		return {
			timeout_ms = 500,
			lsp_format = lsp_format_opt,
		}
	end,
})

local name = "Conform"

Map("<leader>f", name, "[F]ormat buffer", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, nil, { "n", "v" })

-- completion

local cmp = require("cmp")
local luasnip = require("luasnip")

-- settings from https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			select = true, -- whether an item needs to be selected to autocomplete
			behavior = cmp.ConfirmBehavior.Insert,
		}),
		-- ["<Tab>"] = cmp.mapping.select_next_item(),
		-- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		-- ["C-Space"] = cmp.mapping.complete(), -- in case the auto completion didn't trigger
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})
