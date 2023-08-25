-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup()

vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>', { desc = 'Nvim-[t]ree [t]oggle' })
vim.keymap.set('n', 'to', ':NvimTreeOpen<CR>', { desc = 'Nvim-[t]ree [o]pen' })
vim.keymap.set('n', 'tc', ':NvimTreeClose<CR>', { desc = 'Nvim-[t]ree [c]lose' })
