require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
	},
	-- pickers = {}, -- FIX: Probably some problem here, as live_grep and grep_string both aren't working
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")

local builtin = require("telescope.builtin")
local name = "Telescope"

-- Search
Map("<leader>/", name, "[/] Fuzzily search in current buffer", builtin.current_buffer_fuzzy_find)
Map("<leader>sb", name, "[S]earch existing [B]uffers", builtin.buffers)
Map("<leader>sd", name, "[S]earch [D]iagnostics", builtin.diagnostics)
Map("<leader>sf", name, "[S]earch [F]iles", builtin.find_files)
Map("<leader>sg", name, "[S]earch live [G]rep", builtin.live_grep)
Map("<leader>sh", name, "[S]earch [H]elp", builtin.help_tags)
Map("<leader>sr", name, "[S]earch [R]ecent files", builtin.oldfiles)
Map("<leader>st", name, "[S]earch [T]erm", function()
	builtin.grep_string({ search = vim.fn.input("Telescope Grep > ") })
end)
