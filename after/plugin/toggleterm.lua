require('toggleterm').setup({})

local Terminal = require('toggleterm.terminal').Terminal

local function close_with_q(term)
  vim.keymap.set('n', 'q', '<cmd>close<CR>', {
    buffer = term.bufnr,
    silent = true,
    desc = '[q] Close terminal'
  })
end

local lazygit = Terminal:new({
  cmd = 'lazygit',
  dir = 'git_dir',
  direction = 'float',
  float_opts = {
    border = 'rounded'
  },
  on_open = function(term)
    close_with_q(term)
    vim.cmd('startinsert')
  end
})

local terminal = Terminal:new({
  dir = 'git_dir',
  direction = 'float',
  float_opts = {
    border = 'rounded'
  },
  on_open = function(term)
    close_with_q(term)
    vim.cmd('startinsert')
  end
})

vim.keymap.set('n', '<leader>gg', function()
  if vim.fn.executable('lazygit') ~= 1 then
    vim.notify('Lazygit is not installed (`brew install lazygit`)', vim.log.levels.ERROR)
    return
  end
  lazygit:toggle()
end, {
  silent = true,
  desc = '[g] Toggle Lazygit'
})

vim.keymap.set('n', '<leader>pt', function()
  terminal:toggle()
end, {
  silent = true,
  desc = '[t] Toggle terminal'
})
