-- gitsigns

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

-- color highlighter

require("nvim-highlight-colors").setup({
	---@usage 'background'|'foreground'|'virtual'
	render = "background",

	---@usage 'inline'|'eol'|'eow'
	virtual_symbol_position = "inline",
	virtual_symbol = "■",
	virtual_symbol_prefix = "",
	virtual_symbol_suffix = "",

	enable_hex = true, -- hex colors, e.g. '#FF8C00'
	enable_short_hex = false, -- short hex colors e.g. '#fff'
	enable_rgb = true, -- rgb colors, e.g. 'rgb(0 0 0)'
	enable_hsl = true, -- hsl colors, e.g. 'hsl(150deg 30% 40%)'
	enable_var_usage = true, -- CSS variables, e.g. 'var(--testing-color)'
	enable_named_colors = false, -- named colors, e.g. 'green'
	enable_tailwind = false, -- tailwind colors, e.g. 'bg-blue-500'

	exclude_filetypes = {},
	exclude_buftypes = {},
})

-- todo highlighter

require("todo-comments").setup({
	config = {
		signs = true,
		sign_priority = 8,
		keywords = {
			FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#10B981" },
			default = { "Identifier", "#7C3AED" },
			test = { "Identifier", "#FF00FF" },
		},
		highlight = {
			multiline = true,
			before = "", -- "fg", "bg", ""
			keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg", ""
			after = "fg", -- "fg", "bg", ""
			comments_only = true,
		},
	},
})
