-- LSP

local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

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
		Map("<leader>r", name, "[R]ename]", vim.lsp.buf.rename, buf)
		Map("<leader>c", name, "[C]ode action", vim.lsp.buf.code_action, buf)

		-- Documentation
		Map("K", name, "Hover documentation", vim.lsp.buf.hover, buf)
		Map("<C-k>", name, "Signature documentation", vim.lsp.buf.signature_help, buf)

		-- Diagnostics
		Map("<leader>w", name, "Open floating diagnostic message", vim.diagnostic.open_float, buf)
		Map("<leader>q", name, "Open diagnostic list", vim.diagnostic.setloclist, buf)
	end,
})

local lspconfig = require("lspconfig")
-- lspconfig.language_server.setup({ })
require'lspconfig'.bashls.setup{}

-- CMP

local cmp = require("cmp")

local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- Autocompletion
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			select = false,
			behavior = cmp.ConfirmBehavior.Insert,
		}),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["C-Space"] = cmp.mapping.complete(), -- in case the auto completion didn't trigger
		-- Snippet behavior
		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})
