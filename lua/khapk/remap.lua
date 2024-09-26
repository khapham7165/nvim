vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeCreate<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':', { noremap = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

