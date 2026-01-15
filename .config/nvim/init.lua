-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nerd font
vim.g.have_nerd_font = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1

-- disable folding
vim.opt.foldenable = false

-- system
vim.opt.clipboard = "unnamedplus" -- clipboard
vim.opt.mouse = "a" -- mouse support
vim.opt.undofile = true -- undo history

-- update time
vim.opt.timeoutlen = 250
vim.opt.updatetime = 250

-- new split behavior
vim.opt.splitbelow = false
vim.opt.splitright = false

-- indentation
vim.opt.autoindent = true -- auto indent the next line
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- set the number of spaces for each step of indent
vim.opt.softtabstop = 4 -- set the amount of spaces to be affected with the <tab> or <bs> character
vim.opt.tabstop = 4 -- set the width of the <tab> character

-- search options
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- text rendering
vim.opt.breakindent = true -- keep the wrapped line visually indented
vim.opt.linebreak = true -- avoid wrapping a line in the middle of a word
vim.opt.scrolloff = 5 -- number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 5 -- number of columns to keep to the left and right of the cursor
vim.opt.wrap = true -- allow line wrapping

-- ui
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.inccommand = "split" -- incrementally show command effect
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false -- disable mode display, since the status line already displayed it
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true -- enable 24-bit color in the tui

-- Reload config
vim.api.nvim_create_user_command("Srcconfig", "source ~/.config/nvim/init.lua", {})

-- Open help to the right
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("help_window_right", {}),
	pattern = { "*.txt" },
	callback = function()
		if vim.o.filetype == "help" then
			vim.cmd.wincmd("L")
		end
	end,
})

--- Add a new mapping
---@param keys string Keymap
---@param name string
---@param desc string Description of the mapping
---@param func string|function Action
---@param bufr integer|nil If the mapping requires the current buffer, pass in bufnr, else, pass in nil
---@param mode string|string[]|nil Mode in which the mapping funciton, leave blank for normal mode
function Map(keys, name, desc, func, bufr, mode)
	mode = mode or "n" -- if the value is empty, use the default
	bufr = bufr or nil
	local description = " " .. name .. ": " .. desc

	vim.keymap.set(mode, keys, func, (bufr and { buffer = bufr, desc = description } or { desc = description }))
end

-- lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local plugin_list = require("plugin-list")

require("lazy").setup({
	spec = { plugin_list },
	install = { missing = true },
	-- checker = { enabled = true }, -- check updates for plugins
})

-- quickload config

-- Map("<leader>vsc", "Default", "[S]ource [C]onfig", "<cmd>source ~/.config/nvim/init.lua<CR>")

-- plugins

require("config")

vim.cmd([[
so ~/.config/nvim/legacy.vim
]])
