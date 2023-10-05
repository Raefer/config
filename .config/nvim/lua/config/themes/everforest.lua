require('everforest').setup {
  version = false,
  lazy = false,
  priority = 500,
  config = function()
    vim.cmd.colorscheme('everforest')
  end,

  background = "medium",
}
require('everforest').load()
