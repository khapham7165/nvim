vim.g.mapleader = " "

vim.keymap.set('n', '<leader>e', vim.diagnostic .goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>E', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' }) vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = 'Scroll down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = 'Scroll up' })
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true, desc = 'Save' })
vim.keymap.set('n', '<leader>pj', ':sp<CR><C-w>j', { noremap = true, silent = true, desc = 'Split below' })
vim.keymap.set('n', '<leader>pk', ':sp<CR><C-w>k', { noremap = true, silent = true, desc = 'Split above' })
vim.keymap.set('n', '<leader>pl', ':vs<CR><C-w>l', { noremap = true, silent = true, desc = 'Split right' })
vim.keymap.set('n', '<leader>ph', ':vs<CR><C-w>h', { noremap = true, silent = true, desc = 'Split left' })

vim.api.nvim_set_keymap('n', '<leader>ga', ':Octo actions<CR>', { desc = 'Show all git actions' })
vim.api.nvim_set_keymap('n', '<leader>gH', ':DiffviewFileHistory %', { desc = 'Show file history' })
vim.api.nvim_set_keymap('n', '<leader>gh', ":'<,'>DiffviewFileHistory", { desc = 'Show line history' })

vim.keymap.set('n', '<leader>pF', ':Neotree float reveal<CR>', { noremap = true, silent = true })
