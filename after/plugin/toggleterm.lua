require("toggleterm").setup()
local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

function _terminal_toggle()
  local term = Terminal:new({
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  })
  term:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, desc = "Toggle lazygit"})
vim.api.nvim_set_keymap("n", "<leader>pt", "<cmd>lua _terminal_toggle()<CR>", {noremap = true, silent = true, desc = "Toggle terminal"})
