return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = false,
				theme = "auto",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
		},
	},

	{
		"dhruvasagar/vim-table-mode",
	},

    {
        "preservim/vim-pencil",
    },

	{
		"numToStr/Comment.nvim",
		opts = {},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			preset = "modern",
			spec = {
				-- Telescope search function
				{ "<leader>s", group = " Search" },
				{ "<leader>l", group = " List" },
				{ "<leader>g", group = " Go to" },
			},
		},
	},

	{ -- plugin.nvim-tree
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- { -- plugin.mason-lspconfig
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim",
	-- 		"neovim/nvim-lspconfig",
	-- 		{ "j-hui/fidget.nvim", opts = {} },
	-- 	},
	-- },

	{ -- plugin.telescope
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	{ -- plugin.nvim-cmp
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
				dependencies = { "rafamadriz/friendly-snippets" },
			},
		},
	},

	{ -- plugin.treesitter
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{ -- plugin.conform
		"stevearc/conform.nvim",
	},

	{ -- plugin.neorg
		"nvim-neorg/neorg",
		lazy = false,
		version = "*",
	},

	{ -- plugin.todo-comments
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"brenoprata10/nvim-highlight-colors",
        opts = {
            ---@usage 'background'|'foreground'|'virtual'
            render = "background",

            ---@usage 'inline'|'eol'|'eow'
            virtual_symbol_position = "inline",
            virtual_symbol = "■",
            virtual_symbol_prefix = "",
            virtual_symbol_suffix = "",

            enable_hex = true,           -- hex colors, e.g. '#FF8C00'
            enable_short_hex = false,    -- short hex colors e.g. '#fff'
            enable_rgb = true,           -- rgb colors, e.g. 'rgb(0 0 0)'
            enable_hsl = true,           -- hsl colors, e.g. 'hsl(150deg 30% 40%)'
            enable_var_usage = true,     -- CSS variables, e.g. 'var(--testing-color)'
            enable_named_colors = false, -- named colors, e.g. 'green'
            enable_tailwind = false,     -- tailwind colors, e.g. 'bg-blue-500'

            exclude_filetypes = {},
            exclude_buftypes = {},
        },
	},

	{ -- theme.nightfox
		"EdenEast/nightfox.nvim",
		priority = 1000,
	},

	{ -- theme.onedark
		"navarasu/onedark.nvim",
		priority = 1000,
	},
}
