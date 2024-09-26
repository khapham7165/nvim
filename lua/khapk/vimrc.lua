vim.opt.expandtab = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.wo.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 })
  end
})
