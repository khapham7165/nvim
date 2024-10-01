local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>pe', builtin.git_files, { desc = 'Find git files' })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Live grep' })
