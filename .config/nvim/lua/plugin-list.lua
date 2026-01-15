return {
	{ -- completion / lsp
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- lsp
			{
				"mason-org/mason-lspconfig.nvim",
				opts = {},
				dependencies = {
					{ "mason-org/mason.nvim", opts = {} },
					"neovim/nvim-lspconfig",
				},
			},
			-- completion
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			-- snippets
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},

	{ -- highligihting
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{ -- search
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	{ -- file explorer
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{ -- formatter
		"stevearc/conform.nvim",
	},

	{ -- neorg
		"nvim-neorg/neorg",
		lazy = false,
		version = "*",
	},

	{ -- text formatter
		"preservim/vim-pencil",
	},

	{ -- highlight current paragraph
		"junegunn/limelight.vim",
	},

	{ -- table formatter
		"dhruvasagar/vim-table-mode",
	},

	-- { -- markdown
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- },

	{ -- latex
		"lervag/vimtex",
		lazy = false,
	},

    { -- lilypond
        "martineausimon/nvim-lilypond-suite"
    },

	{ -- theme
		"navarasu/onedark.nvim",
		priority = 1000,
		dependencies = {
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
	},

	{ -- misc: gitsigns
		"lewis6991/gitsigns.nvim",
	},

	{ -- misc: quick comment
		"numToStr/Comment.nvim",
		opts = {},
	},

	{ -- misc: indent guideline
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	{ -- misc: keybind reminder
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
				{ "<leader>t", group = " TeX" },
				{ "<leader>n", group = " Neorg" },
                { "<leader>p", group = " Pencil Mode" }
			},
		},
	},

	{ -- misc: todo highlighter
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ -- misc: color highlighter
		"brenoprata10/nvim-highlight-colors",
	},
}
