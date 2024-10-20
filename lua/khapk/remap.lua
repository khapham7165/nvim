vim.g.mapleader = " "

-- Window navigation
local window_nav_keymaps = {
  { mode = 'n', lhs = '<C-u>',      rhs = '<C-u>zz', noremap = true,      silent = true, desc = 'Scroll up' },
  { mode = 'n', lhs = '<leader>w',  rhs = '<C-w>',   desc = 'Move window' },
  { mode = 'n', lhs = '<leader>wj', rhs = '<C-w>j',  noremap = true,      silent = true, desc = 'Move to window bottom' },
  { mode = 'n', lhs = '<leader>wh', rhs = '<C-w>h',  noremap = true,      silent = true, desc = 'Move to window left' },
  { mode = 'n', lhs = '<leader>wk', rhs = '<C-w>k',  noremap = true,      silent = true, desc = 'Move to window top' },
  { mode = 'n', lhs = '<leader>wl', rhs = '<C-w>l',  noremap = true,      silent = true, desc = 'Move to window right' },
}

for _, keymap in ipairs(window_nav_keymaps) do
  vim.keymap.set(keymap.mode, keymap.lhs, keymap.rhs,
    { desc = keymap.desc, noremap = keymap.noremap, silent = keymap.silent })
end

-- Window splitting
-- Define a single table to store all keymaps
local all_keymaps = {
  -- Window navigation
  { mode = 'n', lhs = '<C-u>',      rhs = '<C-u>zz',                                                 desc = 'Scroll up',                         opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>w',  rhs = '<C-w>',                                                   desc = 'Move window' },
  { mode = 'n', lhs = '<leader>wj', rhs = '<C-w>j',                                                  desc = 'Move to window bottom',             opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>wh', rhs = '<C-w>h',                                                  desc = 'Move to window left',               opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>wk', rhs = '<C-w>k',                                                  desc = 'Move to window top',                opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>wl', rhs = '<C-w>l',                                                  desc = 'Move to window right',              opts = { noremap = true, silent = true } },

  -- Window splitting
  { mode = 'n', lhs = '<leader>wJ', rhs = ':sp<CR><C-w>j',                                           desc = 'Split below',                       opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>wK', rhs = ':sp<CR><C-w>k',                                           desc = 'Split above',                       opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>wL', rhs = ':vs<CR><C-w>l',                                           desc = 'Split right',                       opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>wH', rhs = ':vs<CR><C-w>h',                                           desc = 'Split left',                        opts = { noremap = true, silent = true } },

  -- Git
  { mode = 'n', lhs = '<leader>ga', rhs = ':Octo actions<CR>',                                       desc = 'Show all git actions' },
  { mode = 'n', lhs = '<leader>gH', rhs = ':DiffviewFileHistory %<CR>',                              desc = 'Show file history' },
  { mode = 'n', lhs = '<leader>gh', rhs = ":'<,'>DiffviewFileHistory<CR>",                           desc = 'Show line history' },
  { mode = 'n', lhs = '<leader>gs', rhs = ':Neotree float git_status<CR>',                           desc = 'Show git status' },
  { mode = 'n', lhs = '<leader>gd', rhs = ':DiffviewOpen<CR>',                                       desc = 'Show git diff',                     opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>gD', rhs = ':DiffviewClose<CR>',                                      desc = 'Close git diff',                    opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>gb', rhs = ':Gitsigns blame_line<CR>',                                desc = 'Blame line',                        opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>gB', rhs = ':Gitsigns blame<CR>',                                     desc = 'Blame file',                        opts = { noremap = true, silent = true } },

  -- Neotree and Nvim-tree
  { mode = 'n', lhs = '<leader>pF', rhs = ':Neotree float reveal<CR>',                               desc = 'Open Neotree float',                opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<C-n>',      rhs = require('nvim-tree.api').fs.create,                        desc = 'Create new file' },
  { mode = 'n', lhs = '<C-b>',      rhs = ':NvimTreeToggle<CR>',                                     desc = 'Toggle Nvim-tree',                  opts = { noremap = true, silent = true } },

  -- Move lines
  { mode = 'n', lhs = '<M-k>',      rhs = ':m-2<CR>==',                                              desc = 'Move line up' },
  { mode = 'n', lhs = '<M-j>',      rhs = ':m+<CR>==',                                               desc = 'Move line down' },
  { mode = 'v', lhs = '<M-Up>',     rhs = ":m-2<CR>gv=gv",                                           desc = 'Move selection up' },
  { mode = 'v', lhs = '<M-Down>',   rhs = ":m'>+<CR>gv=gv",                                          desc = 'Move selection down' },

  -- Insert mode navigation
  { mode = 'i', lhs = '<Esc>[f',    rhs = '<C-o>e',                                                  desc = 'Move to end of word' },
  { mode = 'i', lhs = '<Esc>[b',    rhs = '<C-o>b',                                                  desc = 'Move to start of word' },
  { mode = 'i', lhs = '<D-Right>',  rhs = '<C-o>$',                                                  desc = 'Move to end of line' },
  { mode = 'i', lhs = '<D-Left>',   rhs = '<C-o>0',                                                  desc = 'Move to start of line' },

  -- Normal mode navigation
  { mode = 'n', lhs = '<D-Down>',   rhs = 'G',                                                       desc = 'Move to end of buffer' },

  -- Diagnostics
  { mode = 'n', lhs = 'L',          rhs = ':lua vim.diagnostic.open_float(0, {scope = "line"})<CR>', desc = 'Show line diagnostics' },

  -- AI
  { mode = 'n', lhs = '<leader>at', rhs = ':CodyToggle<CR>',                                         desc = 'Toggle AI chat',                    opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>ai', rhs = ':CodyAsk ',                                               desc = 'Toggle AI ask',                     opts = { noremap = true, silent = true } },
  { mode = 'v', lhs = '<leader>ar', rhs = ':CodyTask refactor this<CR>',                             desc = 'AI refactor',                       opts = { noremap = true, silent = true } },
  { mode = 'v', lhs = '<leader>ae', rhs = ':CodyExplain<CR>',                                        desc = 'AI explain',                        opts = { noremap = true, silent = true } },

  -- Find last yanked text
  { mode = 'n', lhs = '<leader>yf', rhs = ':lua Find_last_yank()<CR>',                               desc = 'Find last yanked text',             opts = { noremap = true, silent = true } },

  -- Tab shortcuts
  { mode = 'n', lhs = '<leader>tt', rhs = ':tabnew<CR>',                                             desc = 'Create a new tab',                  opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>tc', rhs = ':tabclose<CR>',                                           desc = 'Close the current tab',             opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>to', rhs = ':tabonly<CR>',                                            desc = 'Close all other tabs',              opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>tn', rhs = ':tabnext<CR>',                                            desc = 'Go to the next tab',                opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>tp', rhs = ':tabprevious<CR>',                                        desc = 'Go to the previous tab',            opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>tr', rhs = ':tabmove +1<CR>',                                         desc = 'Move the current tab to the right', opts = { noremap = true, silent = true } },
  { mode = 'n', lhs = '<leader>tl', rhs = ':tabmove -1<CR>',                                         desc = 'Move the current tab to the left',  opts = { noremap = true, silent = true } },
}

-- Function to set up all keymaps
local function setup_keymaps()
  for _, keymap in ipairs(all_keymaps) do
    local opts = vim.tbl_extend('force', { desc = keymap.desc }, keymap.opts or {})
    vim.keymap.set(keymap.mode, keymap.lhs, keymap.rhs, opts)
  end
end

-- Set leader key
vim.g.mapleader = " "

-- Set up keymaps
setup_keymaps()

-- Define the Find_last_yank function
function Find_last_yank()
  local last_yank = vim.fn.getreg('"')
  if last_yank ~= "" then
    vim.cmd('/' .. vim.fn.escape(last_yank, '/'))
  end
end

-- Create user commands
vim.api.nvim_create_user_command('Q', 'quit', { desc = 'Quit Neovim' })
vim.api.nvim_create_user_command('W', 'write', { desc = 'Save buffer' })
