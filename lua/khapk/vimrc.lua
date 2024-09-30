vim.opt.expandtab = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.wo.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 })
  end
})

vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {'class', 'function', 'method', '^if', '^while', '^for', '^object', '^table', 'block', 'arguments'}
vim.g.indent_blankline_char = '▏'
