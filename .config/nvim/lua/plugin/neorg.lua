require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
				},
				default_workspace = "notes",
			},
		},
	},
})

Map("<leader>tc", "Neorg", "[T]oggle [C]onceal", function()
	local level = vim.api.nvim_get_option_value("conceallevel", { scope = "global" })
	level = level == 0 and 2 or 0
	vim.wo.conceallevel = level
end)

vim.wo.conceallevel = 2
