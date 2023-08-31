return {
  -- Auto-adjust tabstops, shiftwidth, and expandtab
  'tpope/vim-sleuth',

  -- JDTLS
  'mfussenegger/nvim-jdtls',

  -- LSP configuration & plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      -- Status updates for LSP
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
      -- Additional lua configuration for nvim
      'folke/neodev.nvim',
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Show pending keybinds
  { 'folke/which-key.nvim',  opts = {} },

  -- Git related signs
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Theme
  {
    'navarasu/onedark.nvim',
    priority = 500,
    config = function()
      vim.cmd.colorscheme('onedark')
    end,
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- Indentation guidelines
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '|',
      -- char = '┊',
      show_end_of_line = true,
      show_trailing_blankline_indent = false,
    },
  },

  -- Comment hotkey('v', 'gc')
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Native telescope sorter to improve performance, as suggested in the docs.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        -- only load if 'make' is available in the system
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  -- Intellisense
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    -- dependencies = { 'nvim-tree/nvim-web-devicons' }
  }
}
