-- Config file based off kickstart.nvim
-- PREREQUISITE : require manual installation of jdtls and add to the $PATH
-- PREREQUISITE : require manual installation of csharp_ls using dotnet

-- [[ VIM SETTINGS ]]
require('options')

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

require("lazy").setup('plugins')

-- [[ CONFIG ]]
require('config')

-- [[ CONFIGURING LSP ]]
require("lsp")

