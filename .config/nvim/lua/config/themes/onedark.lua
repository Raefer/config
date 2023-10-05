require('onedark').setup {
    style = 'warm',
    priority = 500,
    config = function()
      vim.cmd.colorscheme('onedark')
    end,
}
require('onedark').load()

