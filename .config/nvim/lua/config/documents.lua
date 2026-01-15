-- prose-mode

vim.opt.spelllang = "en"

vim.api.nvim_create_user_command("Prose", function()
	-- vim.api.nvim_command("Limelight")
	vim.opt.spell = true
end, { desc = "Enable prose mode for writing" })

vim.api.nvim_create_user_command("UnProse", function()
	-- vim.api.nvim_command("Limelight!")
	vim.opt.spell = false
end, { desc = "Disable prose mode for writing" })

-- vim-pencil

vim.g["pencil#wrapModeDefault"] = "hard"
vim.g["pencil#textwidth"] = 80
vim.g["pencil#conceallevel"] = 0

Map("<leader>pt", "Vim-Pencil", "[P]encil mode [T]oggle", "<cmd>TogglePencil<CR>")
Map("<leader>pf", "Vim-Pencil", "[P]encil mode [F]ormat", "gqap", nil, "n")
Map("<leader>pf", "Vim-Pencil", "[P]encil mode [F]ormat", "gq", nil, "v")

-- neorg

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

Map("<leader>nc", "Neorg", "[N]eorg toggle [C]onceal", function()
	local level = vim.api.nvim_get_option_value("conceallevel", { scope = "global" })
	level = level == 0 and 2 or 0
	vim.wo.conceallevel = level
end)

vim.wo.conceallevel = 2

-- -- markdown
--
-- -- https://github.com/MeanderingProgrammer/render-markdown.nvim
-- require("render-markdown").setup({
-- 	heading = {
-- 		backgrounds = {},
-- 		icons = { "◉ ", "◎ ", "○ " },
-- 	},
-- 	bullet = {
-- 		icons = { "•" },
-- 	},
-- 	anti_conceal = {
-- 		-- enabled = false,
-- 		-- disabled_modes = { "n", "c", "t" },
-- 	},
-- 	latex = {
-- 		enabled = false,
-- 	},
-- 	sign = {
-- 		enabled = false,
-- 	},
-- })

-- latex

Map("<leader>tt", "LaTeX", "[T]eX open [T]able of content", "<cmd>VimtexTocToggle<CR>")

Map("<leader>tr", "LaTeX", "[T]eX [R]efresh table of content", vim.fn["vimtex#toc#refresh"])

vim.g.vimtex_view_method = "zathura"
vim.g.tex_flavor = "latex"
-- vim.g.vimtex_quickfix_mode = 0 -- disable popup error window
-- :h g:vimtex_toc_config
vim.g.vimtex_toc_config = {
	name = "TeX TOC",
	resize = 0, -- off, else nvim will bug out
	refresh_always = 1, -- turn off for large project
	show_help = 0,
	split_width = 40,
	todo_sorted = 0,
	layer_status = { -- customize what stuff to show initially
		content = 1,
		label = 1,
		todo = 1,
		include = 1,
	},
}

-- disable concealer on enter
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.tex" },
	callback = function()
		vim.wo.conceallevel = 0
	end,
})

-- refresh toc on write
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.tex" },
	command = "call vimtex#toc#refresh()",
})

-- <leader>ll : toggle compiler
-- <leader>lc : cleanup auxilliary files
-- <leader>lv : sync pdf loc to tex loc
-- <C-LMB>    : sync tex loc to pdf loc
