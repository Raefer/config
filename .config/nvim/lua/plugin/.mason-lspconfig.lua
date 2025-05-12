require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls", -- sh
		"cssls", -- css, scss, less
		"jsonls", -- json, jsonc
		"lua_ls", -- lua
		"pyright", -- python
		"rust_analyzer", -- rust
	},
})

local function on_attach(_, bufnr)
	local builtin = require("telescope.builtin")
	local name = "LSP"

	vim.api.nvim_buf_create_user_command(
		bufnr,
		"Format",
		vim.lsp.buf.format,
		{ desc = "Format buffer (using vim api)" }
	)

	-- List
	Map("<leader>lr", name, "[L]ist [R]eferences", builtin.lsp_references, bufnr)
	Map("<leader>ld", name, "[L]ist [D]ocument symbols", builtin.lsp_document_symbols, bufnr)
	Map("<leader>lw", name, "[L]ist [W]orkspace symbols", builtin.lsp_dynamic_workspace_symbols, bufnr)

	-- Goto
	Map("<leader>gd", name, "[G]o to [D]efinitions", builtin.lsp_definitions, bufnr)
	Map("<leader>gc", name, "[G]o to de[C]laration", vim.lsp.buf.declaration, bufnr)
	Map("<leader>gi", name, "[G]o to [I]mplementation", builtin.lsp_implementations, bufnr)
	Map("<leader>gt", name, "[G]o to [T]ype definition", builtin.lsp_type_definitions, bufnr)

	-- Actions
	Map("<leader>r", name, "[R]ename]", vim.lsp.buf.rename, bufnr)
	Map("<leader>c", name, "[C]ode action", vim.lsp.buf.code_action, bufnr)

	-- Documentation
	Map("K", name, "Hover documentation", vim.lsp.buf.hover, bufnr)
	Map("<C-k>", name, "Signature documentation", vim.lsp.buf.signature_help, bufnr)

	-- Diagnostics
	Map("<leader>w", name, "Open floating diagnostic message", vim.diagnostic.open_float, bufnr)
	Map("<leader>q", name, "Open diagnostic list", vim.diagnostic.setloclist, bufnr)
end

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name

			-- TODO: Keep an eye on the official installation guide
			-- check if they've updated the vim.loop situation
			if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
				return
			end
		end
		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = false,
			},
		},
	},
})
