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
