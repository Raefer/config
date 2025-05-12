require("conform").setup({
	-- formatter needs to be manually downloaded via Mason
	formatters_by_ft = {
		-- lang = { formatter .. , stop_after_first = bool }
		bash = { "shfmt" },
		css = { "prettier" },
		json = { "jq" },
		lua = { "stylua" },
		python = { "ruff" },
		rust = { "rustfmt" }, -- installed via rustup
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
