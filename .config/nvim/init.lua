-- Config file based off kickstart.nvim

-- [[ VIM SETTINGS ]]
-- <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- highlight search
vim.o.hlsearch = false
-- line number
vim.o.number = true
-- sync clipboard between system and neovim
vim.o.clipboard = 'unnamedplus'
-- save undo history
vim.o.undofile = true
-- searching : case insensitive search unless capitals are used
vim.o.ignorecase = true
vim.o.smartcase = true
-- sign column
vim.wo.signcolumn = 'yes'
-- update time
vim.o.updatetime = 250
vim.o.timeoutlen = 500
-- completion
vim.o.completeopt = 'menuone,noselect'
-- set tabstops
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
-- allow break Indent
vim.o.breakindent = true
-- enable mouse
vim.o.mouse = 'a'


-- [[ LAZY SETUP ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Auto-adjust tabstops, shiftwidth, and expandtab
  'tpope/vim-sleuth',

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

  -- {
  --   'neanias/everforest-nvim',
  --   priority = 1000,
  --   config = function ()
  --     vim.cmd.colorscheme('everforest')
  --   end
  -- },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark', -- TODO:Change the colour theme after choosing one.
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

require("lazy").setup(plugins, {})

-- autoformat
-- require('plugins.autoformat')


-- [[ CONFIGURING TELESCOPE ]]
require('conf.telescope-conf')

-- [[ CONFIGURING TREESITTER ]]
require('conf.treesitter-conf')

-- [[ CONFIGURING LSP ]]
require('conf.lsp-conf')

-- [[ CONFIGURING NVIM-CMP ]]
require('conf.nvim-cmp-conf')

-- [[ CONFIGURING ONEDARK ]]
require('conf.onedark-conf')

-- [[ CONFIGURING EVERFOREST ]]
-- require('conf.everforest-conf')

-- [[ CONFIGURING NVIM-TREE ]]
require('conf.nvim-tree-conf')

