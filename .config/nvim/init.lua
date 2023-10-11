-- Config file based off kickstart.nvim

-- [ VIM SETTINGS ]
-- <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.o.hlsearch = false
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

require("plugins")
require("lsp")
require("nvimcmp")
require("keybindings")

-- [ CONFIGURING PLUGINS ]
require("which-key").setup()
require("Comment").setup()
require("nvim-tree").setup()
require("ibl").setup()

-- onedark
require('onedark').setup {
  style = 'warm',
  priority = 500,
  config = function()
    vim.cmd.colorscheme('onedark')
  end,
}
require('onedark').load()

-- lualine
require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "auto",
    component_separators = "|",
    section_separators = "",
  },
})

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

-- telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'c', 'cpp', 'lua', 'python', 'rust', 'typescript', 'vimdoc', 'vim', 'java', 'c_sharp', 'groovy', },
  ignore_install = {},
  auto_install = false,
  sync_install = false,
  modules = {},
  highlight = { enable = true },
  indent = { enable = true },
}

-- neorg
require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {
      config = {
        folds = false,
      }
    },
    ["core.itero"] = {},
    ["core.qol.toc"] = {},
    ["core.journal"] = {
      config = {
        journal_folder = "~/norg/journal/",
        strategy = "flat",
      }
    },
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/norg/notes/",
        },
      }
    }
  }
}
