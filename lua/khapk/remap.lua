vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeCreate<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>e', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>E', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' }) vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', ':sp<CR><C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', ':sp<CR><C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', ':vs<CR><C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', ':vs<CR><C-w>h', { noremap = true, silent = true })
