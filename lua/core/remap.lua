vim.g.mapleader = " "

local builtin = require('telescope.builtin')
-- Window navigation
local window_nav_keymaps = {{
  mode = 'n',
  lhs = '<C-u>',
  rhs = '<C-u>zz',
  noremap = true,
  silent = true,
  desc = 'Scroll [u]p'
}, {
  mode = 'n',
  lhs = '<leader>w',
  rhs = '<C-w>',
  desc = 'Move [w]indow'
}, {
  mode = 'n',
  lhs = '<leader>wj',
  rhs = '<C-w>j',
  noremap = true,
  silent = true,
  desc = '[j] Move to window bottom'
}, {
  mode = 'n',
  lhs = '<leader>wh',
  rhs = '<C-w>h',
  noremap = true,
  silent = true,
  desc = '[h] Move to window left'
}, {
  mode = 'n',
  lhs = '<leader>wk',
  rhs = '<C-w>k',
  noremap = true,
  silent = true,
  desc = '[k] Move to window top'
}, {
  mode = 'n',
  lhs = '<leader>wl',
  rhs = '<C-w>l',
  noremap = true,
  silent = true,
  desc = '[l] Move to window right'
}}

for _, keymap in ipairs(window_nav_keymaps) do
  vim.keymap.set(keymap.mode, keymap.lhs, keymap.rhs, {
    desc = keymap.desc,
    noremap = keymap.noremap,
    silent = keymap.silent
  })
end

-- Window splitting
-- Define a single table to store all keymaps
local all_keymaps = { -- Window navigation
{
  mode = 'n',
  lhs = '<C-u>',
  rhs = '<C-u>zz',
  desc = 'Scroll [u]p center cursor',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>w',
  rhs = '<C-w>',
  desc = '[w]indow commands'
}, {
  mode = 'n',
  lhs = '<leader>wj',
  rhs = '<C-w>j',
  desc = '[j] Move to window below',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>wh',
  rhs = '<C-w>h',
  desc = '[h] Move to window left',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>wk',
  rhs = '<C-w>k',
  desc = '[k] Move to window above',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>wl',
  rhs = '<C-w>l',
  desc = '[l] Move to window right',
  opts = {
    noremap = true,
    silent = true
  }
}, -- Window splitting
{
  mode = 'n',
  lhs = '<leader>wJ',
  rhs = ':sp<CR><C-w>j',
  desc = '[J] Split window below',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>wK',
  rhs = ':sp<CR><C-w>k',
  desc = '[K] Split window above',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>wL',
  rhs = ':vs<CR><C-w>l',
  desc = '[L] Split window right',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>wH',
  rhs = ':vs<CR><C-w>h',
  desc = '[H] Split window left',
  opts = {
    noremap = true,
    silent = true
  }
}, -- Prefix: g (Git)
{
  mode = 'n',
  lhs = '<leader>g',
  rhs = '<nop>',
  desc = '[g]it commands'
}, -- Git
{
  mode = 'n',
  lhs = '<leader>ga',
  rhs = ':Octo actions<CR>',
  desc = 'Show [a]ll git actions'
}, {
  mode = 'n',
  lhs = '<leader>gH',
  rhs = ':DiffviewFileHistory %<CR>',
  desc = 'Show file git [H]istory'
}, {
  mode = 'n',
  lhs = '<leader>gh',
  rhs = ":'<,'>DiffviewFileHistory<CR>",
  desc = 'Show selected line [h]istory'
}, {
  mode = 'n',
  lhs = '<leader>gs',
  rhs = builtin.git_status,
  desc = 'Show git [s]tatus'
}, -- Prefix: p (Project/Find)
{
  mode = 'n',
  lhs = '<leader>p',
  rhs = '<nop>',
  desc = '[p]roject/search commands'
}, {
  mode = 'n',
  lhs = '<leader>pf',
  rhs = builtin.treesitter,
  desc = 'Find in [f]ile structure'
}, {
  mode = 'n',
  lhs = '<leader>gd',
  rhs = ':DiffviewOpen<CR>',
  desc = 'Show [d]iff',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>gD',
  rhs = ':DiffviewClose<CR>',
  desc = 'Close git [D]iff',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>gb',
  rhs = ':Gitsigns blame_line<CR>',
  desc = '[b]lame current line',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>gB',
  rhs = ':Gitsigns blame<CR>',
  desc = '[B]lame entire file',
  opts = {
    noremap = true,
    silent = true
  }
}, -- Nvim-tree
{
  mode = 'n',
  lhs = '<leader>en',
  rhs = require('nvim-tree.api').fs.create,
  desc = 'Create [n]ew file'
}, {
  mode = 'n',
  lhs = '<leader>ee',
  rhs = ':NvimTreeToggle<CR>',
  desc = 'Toggle file [e]xplorer sidebar',
  opts = {
    noremap = true,
    silent = true
  }
}, -- Move lines
{
  mode = 'n',
  lhs = '<M-k>',
  rhs = ':m-2<CR>==',
  desc = 'Move line up'
}, {
  mode = 'n',
  lhs = '<M-j>',
  rhs = ':m+<CR>==',
  desc = 'Move line down'
}, {
  mode = 'v',
  lhs = '<M-Up>',
  rhs = ":m-2<CR>gv=gv",
  desc = '[Alt+↑] Move selection up'
}, {
  mode = 'v',
  lhs = '<M-Down>',
  rhs = ":m'>+<CR>gv=gv",
  desc = '[Alt+↓] Move selection down'
}, -- Insert mode navigation
{
  mode = 'i',
  lhs = '<A-Right>',
  rhs = '<C-o>w',
  desc = '[Alt+→] Jump to next word end'
}, {
  mode = 'i',
  lhs = '<A-Left>',
  rhs = '<C-o>b',
  desc = '[Alt+←] Jump to prev word start'
}, {
  mode = 'i',
  lhs = '<D-Right>',
  rhs = '<C-o>$',
  desc = '[Cmd+→] Jump to end of line'
}, {
  mode = 'i',
  lhs = '<D-Left>',
  rhs = '<C-o>0',
  desc = '[Cmd+←] Jump to start of line'
}, {
  mode = 'i',
  lhs = '<A-BS>',
  rhs = '<C-o>db',
  desc = '[Alt+Backspace] Delete word'
}, {
  mode = 'i',
  lhs = '<D-BS>',
  rhs = '<C-o>d0',
  desc = '[Cmd+Backspace] Delete to line start'
}, {
  mode = 'i',
  lhs = '<D-z>',
  rhs = '<C-o>u',
  desc = '[Cmd+z] Undo'
}, {
  mode = 'i',
  lhs = '<D-S-z>',
  rhs = '<C-o><C-r>',
  desc = '[Cmd+Shift+z] Redo'
}, {
  mode = 'i',
  lhs = '<D-c>',
  rhs = '<C-o>yy',
  desc = '[Cmd+c] Copy current line'
}, {
  mode = 'i',
  lhs = '<D-x>',
  rhs = '<C-o>dd',
  desc = '[Cmd+x] Cut current line'
}, -- Normal mode navigation
{
  mode = 'n',
  lhs = '<D-Down>',
  rhs = 'G',
  desc = '[Cmd+↓] Go to end of buffer'
}, -- Diagnostics
{
  mode = 'n',
  lhs = 'L',
  rhs = ':lua vim.diagnostic.open_float(0, {scope = "line", border = "rounded"})<CR>',
  desc = 'Show [L]ine diagnostics'
}, -- Prefix: a (AI)
{
  mode = 'n',
  lhs = '<leader>a',
  rhs = '<nop>',
  desc = '[a]I commands'
}, -- AI
{
  mode = 'n',
  lhs = '<leader>aa',
  rhs = ':CopilotChatToggle<CR>',
  desc = 'Toggle [a]I chat window',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'v',
  lhs = '<leader>aa',
  rhs = ':CopilotChat<CR>',
  desc = 'Ch[a]t with selected text',
  opts = {
    noremap = true,
    silent = true
  }
}, -- Prefix: b (Buffer)
{
  mode = 'n',
  lhs = '<leader>b',
  rhs = '<nop>',
  desc = '[b]uffer commands'
}, -- Prefix: e (Explorer)
{
  mode = 'n',
  lhs = '<leader>e',
  rhs = '<nop>',
  desc = '[e]xplorer commands'
}, -- Prefix: f (Find)
{
  mode = 'n',
  lhs = '<leader>f',
  rhs = '<nop>',
  desc = '[f]ind/search commands'
}, -- Find last yanked text
{
  mode = 'n',
  lhs = '<leader>fy',
  rhs = ':lua Find_last_yank()<CR>',
  desc = 'Find last [y]anked text',
  opts = {
    noremap = true,
    silent = true
  }
}, -- Prefix: m (Minimap)
{
  mode = 'n',
  lhs = '<leader>m',
  rhs = '<nop>',
  desc = '[m]inimap commands'
}, -- Prefix: t (Tab)
{
  mode = 'n',
  lhs = '<leader>t',
  rhs = '<nop>',
  desc = '[t]ab commands'
}, -- Tab shortcuts
{
  mode = 'n',
  lhs = '<leader>tt',
  rhs = ':tabnew<CR>',
  desc = 'Create new [t]ab',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>tc',
  rhs = ':tabclose<CR>',
  desc = '[c]lose current tab',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>to',
  rhs = ':tabonly<CR>',
  desc = 'Close all [o]ther tabs',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>tn',
  rhs = ':tabnext<CR>',
  desc = 'Go to [n]ext tab',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>tp',
  rhs = ':tabprevious<CR>',
  desc = 'Go to [p]revious tab',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>tr',
  rhs = ':tabmove +1<CR>',
  desc = 'Move tab [r]ight',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>tl',
  rhs = ':tabmove -1<CR>',
  desc = 'Move tab [l]eft',
  opts = {
    noremap = true,
    silent = true
  }
}}

-- Function to set up all keymaps
local function setup_keymaps()
  for _, keymap in ipairs(all_keymaps) do
    local opts = vim.tbl_extend('force', {
      desc = keymap.desc
    }, keymap.opts or {})
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
vim.api.nvim_create_user_command('Q', 'quit', {
  desc = '[Q]uit Neovim'
})
vim.api.nvim_create_user_command('W', 'write', {
  desc = '[W]rite buffer'
})

-- Move to the next buffer
vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<CR>', {
  desc = 'Next b]uffer'
})

-- Move to the previous buffer
vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<CR>', {
  desc = 'Previous [buffer'
})

-- Close the current buffer
vim.keymap.set('n', '<leader>bc', '<cmd>BufferLinePickClose<CR>', {
  desc = '[c]lose buffer'
})

-- Close the other buffers
vim.keymap.set('n', '<leader>boc', '<cmd>BufferLineCloseOthers<CR>', {
  desc = '[c]lose other buffers'
})
-- Close the right buffers
vim.keymap.set('n', '<leader>brc', '<cmd>BufferLineCloseRight<CR>', {
  desc = '[c]lose buffer to the right'
})
-- Close the other buffers
vim.keymap.set('n', '<leader>blc', '<cmd>BufferLineCloseLeft<CR>', {
  desc = '[c]lose buffer to the left'
})

-- Pick a buffer to go to
vim.keymap.set('n', '<leader>bb', '<cmd>BufferLinePick<CR>', {
  desc = 'Pick [b]uffer'
})

-- Sort buffers by directory
vim.keymap.set('n', '<leader>bd', '<cmd>BufferLineSortByDirectory<CR>', {
  desc = 'Sort buffer by [d]irectory'
})

-- Sort buffers by tab
vim.keymap.set('n', '<leader>bt', '<cmd>BufferLineSortByLanguage<CR>', {
  desc = 'Sort buffer by language [t]ype'
})

-- Move the current buffer to the left
vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineMovePrev<CR>', {
  desc = '[n] Move buffer left'
})

-- Move the current buffer to the right
vim.keymap.set('n', '<leader>bm', '<cmd>BufferLineMoveNext<CR>', {
  desc = '[m] Move buffer right'
})

-- Toggle the current buffer's pin
vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineTogglePin<CR>', {
  desc = '[p]in current buffer'
})

-- Function to resize window height
function resize_height(direction)
  local cmd = direction == "increase" and "resize +10" or "resize -10"
  vim.cmd(cmd)
end

-- Function to resize window width
function resize_width(direction)
  local cmd = direction == "increase" and "vertical resize +10" or "vertical resize -10"
  vim.cmd(cmd)
end

-- Map keys for resizing height
vim.api.nvim_set_keymap('n', '+', ':lua resize_height("decrease")<CR>', {
  noremap = true,
  silent = true
})
vim.api.nvim_set_keymap('n', '-', ':lua resize_height("increase")<CR>', {
  noremap = true,
  silent = true
})

-- Map keys for resizing width
vim.api.nvim_set_keymap('n', '>', ':lua resize_width("decrease")<CR>', {
  noremap = true,
  silent = true
})
vim.api.nvim_set_keymap('n', '<', ':lua resize_width("increase")<CR>', {
  noremap = true,
  silent = true
})

-- Enable continuous resizing when holding down the keys
vim.api.nvim_set_keymap('n', '<C-+>', ':lua resize_height("decrease")<CR>', {
  noremap = true,
  silent = true,
  expr = true
})
vim.api.nvim_set_keymap('n', '<C-->', ':lua resize_height("increase")<CR>', {
  noremap = true,
  silent = true,
  expr = true
})
vim.api.nvim_set_keymap('n', '<C->>', ':lua resize_width("decrease")<CR>', {
  noremap = true,
  silent = true,
  expr = true
})
vim.api.nvim_set_keymap('n', '<C-<>', ':lua resize_width("increase")<CR>', {
  noremap = true,
  silent = true,
  expr = true
})

function GoToDefinitionInFloat()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result, ctx, _)
    if err or not result or vim.tbl_isempty(result) then
      print("No definition found")
      return
    end

    if #result == 1 then
      vim.lsp.util.jump_to_location(result[1])
    else
      local items = {}
      local max_width = 0
      for i, res in ipairs(result) do
        local uri = res.uri or res.targetUri
        local range = res.range or res.targetRange
        local filename = vim.uri_to_fname(uri)
        local display_filename = vim.fn.fnamemodify(filename, ":~:.")
        local text = string.format("%d: %s", i, display_filename)
        table.insert(items, {
          text = text,
          location = res
        })
        max_width = math.max(max_width, #text)
      end

      local bufnr = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.tbl_map(function(item)
        return item.text
      end, items))
      vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)

      local width = math.max(max_width, 40)
      local height = math.max(#items, 2)
      local opts = {
        relative = 'cursor',
        width = width,
        height = height,
        col = 0,
        row = 1,
        style = 'minimal',
        border = 'rounded'
      }

      local win_id = vim.api.nvim_open_win(bufnr, true, opts)

      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<CR>', '', {
        noremap = true,
        silent = true,
        callback = function()
          local line = vim.fn.line('.') - 1
          local location = items[line + 1].location
          vim.api.nvim_win_close(win_id, true)
          vim.lsp.util.jump_to_location(location)
        end
      })

      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', '', {
        noremap = true,
        silent = true,
        callback = function()
          vim.api.nvim_win_close(win_id, true)
        end
      })

      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Esc>', '', {
        noremap = true,
        silent = true,
        callback = function()
          vim.api.nvim_win_close(win_id, true)
        end
      })
    end
  end)
end

vim.api.nvim_set_keymap('n', 'gb1', ':BufferLineGoToBuffer 1<CR>', {
  noremap = true,
  silent = true,
  desc = 'Go to buffer [1]'
})
vim.api.nvim_set_keymap('n', 'gb2', ':BufferLineGoToBuffer 2<CR>', {
  noremap = true,
  silent = true,
  desc = 'Go to buffer [2]'
})
vim.api.nvim_set_keymap('n', 'gb3', ':BufferLineGoToBuffer 3<CR>', {
  noremap = true,
  silent = true,
  desc = 'Go to buffer [3]'
})
function copy_current_buffer_path_to_clipboard()
  local current_buffer_path = vim.fn.expand('%') -- Get the full path of the current buffer
  vim.fn.setreg('+', current_buffer_path) -- Copy the path to the clipboard register
  print("Copied to clipboard: " .. current_buffer_path)
end

vim.api.nvim_set_keymap('n', '<leader>by', ':lua copy_current_buffer_path_to_clipboard()<CR>', {
  noremap = true,
  silent = true,
  desc = '[y]ank buffer path to clipboard'
})
vim.keymap.set('n', '<leader>pa', builtin.find_files, {
  desc = 'Find [a]ll files'
})
vim.keymap.set('n', '<leader>pe', builtin.git_files, {
  desc = '[e]xplore git files'
})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {
  desc = 'Live [g]rep'
})
vim.api.nvim_create_user_command('ViewImage', function(opts)
  vim.fn.system('kitty +kitten icat ' .. vim.fn.shellescape(opts.args))
end, {
  nargs = 1
})
vim.api.nvim_create_user_command('CheckTerm', function()
  print(vim.env.TERM)
end, {})

vim.keymap.set('n', '<leader>pb', builtin.buffers, {
  desc = 'Find [b]uffers'
})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {
  desc = 'Find [h]elp tags'
})
vim.keymap.set('n', '<leader>ps', builtin.grep_string, {
  desc = 'Find grep [s]tring'
})
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {
  desc = 'Find [d]iagnostics'
})
vim.keymap.set('n', '<C-l>', function()
  -- Get the word under cursor
  local word = vim.fn.expand('<cword>')
  -- Create the log line
  local log_text = string.format("console.log('%s :>> ', %s)", word, word)

  -- Get current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local current_line = cursor_pos[1]

  -- Insert the log in the next line
  vim.api.nvim_buf_set_lines(0, current_line, current_line, false, {log_text})

  -- Optional: Format the line (if you use a formatter)
  -- vim.cmd('normal! =_')
end, {
  noremap = true,
  desc = "Log word under cursor"
})
-- Copy and find word under cursor
vim.keymap.set('n', '<C-f>', function()
  -- Get the word under cursor
  local word = vim.fn.expand('<cword>')

  -- Yank the word to the unnamed register
  vim.fn.setreg('"', word)

  -- Enter command mode with the word pre-filled for searching
  vim.api.nvim_feedkeys('/' .. word .. '\13', 'n', false)
end, {
  noremap = true,
  desc = "Copy and find word under cursor"
})
