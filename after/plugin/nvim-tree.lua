-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
local api = require('nvim-tree.api')

vim.keymap.set('n', '<C-n>', api.fs.create, { desc = 'Create new file in nvim-tree' })
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- OR setup with some options
require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
