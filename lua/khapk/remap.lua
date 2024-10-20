vim.g.mapleader = " "

-- LSP keymaps
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover information' })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Show references' })
vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { desc = 'Show signature help' })
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = 'Code actions' })

-- Window navigation
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = 'Scroll up' })
vim.keymap.set('n', '<leader>w', "<C-w>", { desc = 'Move window' })
vim.keymap.set('n', '<leader>wj', "<C-w>j", { noremap = true, silent = true, desc = 'Move to window bottom' })
vim.keymap.set('n', '<leader>wh', "<C-w>h", { noremap = true, silent = true, desc = 'Move to window left' })
vim.keymap.set('n', '<leader>wk', "<C-w>k", { noremap = true, silent = true, desc = 'Move to window top' })
vim.keymap.set('n', '<leader>wl', "<C-w>l", { noremap = true, silent = true, desc = 'Move to window right' })

-- Window splitting
vim.keymap.set('n', '<leader>wJ', ':sp<CR><C-w>j', { noremap = true, silent = true, desc = 'Split below' })
vim.keymap.set('n', '<leader>wK', ':sp<CR><C-w>k', { noremap = true, silent = true, desc = 'Split above' })
vim.keymap.set('n', '<leader>wL', ':vs<CR><C-w>l', { noremap = true, silent = true, desc = 'Split right' })
vim.keymap.set('n', '<leader>wH', ':vs<CR><C-w>h', { noremap = true, silent = true, desc = 'Split left' })

-- Git
vim.keymap.set('n', '<leader>ga', ':Octo actions<CR>', { desc = 'Show all git actions' })
vim.keymap.set('n', '<leader>gH', ':DiffviewFileHistory %', { desc = 'Show file history' })
vim.keymap.set('n', '<leader>gh', ":'<,'>DiffviewFileHistory", { desc = 'Show line history' })

-- Neotree
vim.keymap.set('n', '<leader>pF', ':Neotree float reveal<CR>', { noremap = true, silent = true, desc = 'Open Neotree float' })

-- Nvim-tree
vim.keymap.set('n', '<C-n>', require('nvim-tree.api').fs.create, { desc = 'Create new file' })
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Quit and save
vim.api.nvim_create_user_command('Q', 'quit', { desc = 'Quit Neovim' })
vim.api.nvim_create_user_command('W', 'write', { desc = 'Save buffer' })

-- Move lines
vim.keymap.set('n', '<M-k>', ':m-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('n', '<M-j>', ':m+<CR>==', { desc = 'Move line down' })
vim.keymap.set('v', '<M-Up>', ":m-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('v', '<M-Down>', ":m'>+<CR>gv=gv", { desc = 'Move selection down' })

-- Insert mode navigation
vim.keymap.set('i', '<Esc>[f', '<C-o>e', { desc = 'Move to end of word' })
vim.keymap.set('i', '<Esc>[b', '<C-o>b', { desc = 'Move to start of word' })
vim.keymap.set('i', '<D-Right>', '<C-o>$', { desc = 'Move to end of line' })
vim.keymap.set('i', '<D-Left>', '<C-o>0', { desc = 'Move to start of line' })

-- Normal mode navigation
vim.keymap.set('n', '<D-Down>', 'G', { desc = 'Move to end of buffer' })

-- Diagnostics
vim.keymap.set("n", "L", ':lua vim.diagnostic.open_float(0, {scope = "line"})<CR>', { desc = 'Show line diagnostics' })

-- Open git status command
vim.api.nvim_set_keymap('n', '<leader>gs', ':Neotree float git_status<CR>', { noremap = true, silent = true, desc = 'Show git status' })
vim.api.nvim_set_keymap('n', '<leader>gd', ':DiffviewOpen<CR>', { noremap = true, silent = true, desc = 'Show git diff' })
vim.api.nvim_set_keymap('n', '<leader>gD', ':DiffviewClose<CR>', { noremap = true, silent = true, desc = 'Close git diff' })

-- AI
vim.keymap.set('n', '<leader>ai', ':CodyToggle<CR>', { noremap = true, silent = true, desc = 'Toggle AI chat' })
vim.keymap.set('v', '<leader>ai', ':CodyToggle<CR>', { noremap = true, silent = true, desc = 'Toggle AI chat' })
vim.keymap.set('v', '<leader>ar', ':CodyTask refactor this<CR>', { noremap = true, silent = true, desc = 'AI refactor' })
vim.keymap.set('v', '<leader>ae', ':CodyExplain<CR>', { noremap = true, silent = true, desc = 'AI explain' })

-- Trigger blame mode
vim.api.nvim_set_keymap('n', '<leader>gb', ':Gitsigns blame_line<CR>', { noremap = true, silent = true, desc = "Blame line" })
vim.api.nvim_set_keymap('n', '<leader>gB', ':Gitsigns blame<CR>', { noremap = true, silent = true, desc = 'Blame file' })

