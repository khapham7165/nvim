------ disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
----
------ optionally enable 24-bit colour
vim.opt.termguicolors = true
------ OR setup with some options
require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  sort = {
    sorter = "case_sensitive"
  },
  view = {
    side = "right",
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 45,
        height = 45,
        row = 1,
        col = 1
      }
    }
  },
  renderer = {
    group_empty = true
  },
  filters = {
    enable = false
  }
})
