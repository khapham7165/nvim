vim.cmd.colorscheme "catppuccin"
vim.opt.expandtab = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 19
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank({
      higroup = 'IncSearch',
      timeout = 100
    })
  end
})
vim.opt.display = "lastline"
