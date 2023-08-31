local g = vim.g
local o = vim.o
local wo = vim.wo

-- <space> as leader key
g.mapleader = ' '
g.maplocalleader = ' '
-- highlight search
o.hlsearch = false
-- line number
o.number = true
-- sync clipboard between system and neovim
o.clipboard = 'unnamedplus'
-- save undo history
o.undofile = true
-- searching : case insensitive search unless capitals are used
o.ignorecase = true
o.smartcase = true
-- sign column
wo.signcolumn = 'yes'
-- update time
o.updatetime = 250
o.timeoutlen = 500
-- completion
o.completeopt = 'menuone,noselect'
-- set tabstops
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
-- allow break Indent
o.breakindent = true
-- enable mouse
o.mouse = 'a'
