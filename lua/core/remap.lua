vim.g.mapleader = " "

local builtin = require('telescope.builtin')

local function find_last_yank()
  local text = vim.fn.getreg('"')
  if text == '' then
    return
  end

  local pattern = '\\V' .. vim.fn.escape(text, '\\')
  vim.fn.search(pattern:gsub('\n', '\\n'))
end

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
  desc = '[w] Window commands'
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
  desc = '[g] Git commands'
}, -- Git
{
  mode = 'n',
  lhs = '<leader>ga',
  rhs = ':Octo actions<CR>',
  desc = '[a] Show all git actions'
}, {
  mode = 'n',
  lhs = '<leader>gH',
  rhs = ':DiffviewFileHistory %<CR>',
  desc = '[H] Show file git history'
}, {
  mode = 'n',
  lhs = '<leader>gh',
  rhs = ":'<,'>DiffviewFileHistory<CR>",
  desc = '[h] Show selected line history'
}, {
  mode = 'n',
  lhs = '<leader>gs',
  rhs = builtin.git_status,
  desc = '[s] Show git status'
}, -- Prefix: p (Project/Find)
{
  mode = 'n',
  lhs = '<leader>p',
  rhs = '<nop>',
  desc = '[p] Project/search commands'
}, {
  mode = 'n',
  lhs = '<leader>pf',
  rhs = builtin.treesitter,
  desc = '[f] Find in file structure'
}, {
  mode = 'n',
  lhs = '<leader>gd',
  rhs = ':DiffviewOpen<CR>',
  desc = '[d] Show diff',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>gD',
  rhs = ':DiffviewClose<CR>',
  desc = '[D] Close git diff',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>gb',
  rhs = ':Gitsigns blame_line<CR>',
  desc = '[b] Blame current line',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>gB',
  rhs = ':Gitsigns blame<CR>',
  desc = '[B] Blame entire file',
  opts = {
    noremap = true,
    silent = true
  }
}, -- Nvim-tree
{
  mode = 'n',
  lhs = '<leader>en',
  rhs = require('nvim-tree.api').fs.create,
  desc = '[n] Create new file'
}, {
  mode = 'n',
  lhs = '<leader>ee',
  rhs = ':NvimTreeToggle<CR>',
  desc = '[e] Toggle file explorer sidebar',
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
  desc = '[a] AI commands'
}, -- AI
{
  mode = 'n',
  lhs = '<leader>aa',
  rhs = ':CopilotChatToggle<CR>',
  desc = '[a] Toggle AI chat window',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'v',
  lhs = '<leader>aa',
  rhs = ':CopilotChat<CR>',
  desc = '[a] Chat with selected text',
  opts = {
    noremap = true,
    silent = true
  }
}, -- Prefix: b (Buffer)
{
  mode = 'n',
  lhs = '<leader>b',
  rhs = '<nop>',
  desc = '[b] Buffer commands'
}, -- Prefix: e (Explorer)
{
  mode = 'n',
  lhs = '<leader>e',
  rhs = '<nop>',
  desc = '[e] Explorer commands'
}, -- Prefix: f (Find)
{
  mode = 'n',
  lhs = '<leader>f',
  rhs = '<nop>',
  desc = '[f] Find/search commands'
}, -- Find last yanked text
{
  mode = 'n',
  lhs = '<leader>fy',
  rhs = find_last_yank,
  desc = '[y] Find last yanked text',
  opts = {
    noremap = true,
    silent = true
  }
}, -- Prefix: t (Tab)
{
  mode = 'n',
  lhs = '<leader>t',
  rhs = '<nop>',
  desc = '[t] Tab commands'
}, -- Tab shortcuts
{
  mode = 'n',
  lhs = '<leader>tt',
  rhs = ':tabnew<CR>',
  desc = '[t] Create new tab',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>tc',
  rhs = ':tabclose<CR>',
  desc = '[c] Close current tab',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>to',
  rhs = ':tabonly<CR>',
  desc = '[o] Close all other tabs',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>tn',
  rhs = ':tabnext<CR>',
  desc = '[n] Go to next tab',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>tp',
  rhs = ':tabprevious<CR>',
  desc = '[p] Go to previous tab',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>tr',
  rhs = ':tabmove +1<CR>',
  desc = '[r] Move tab right',
  opts = {
    noremap = true,
    silent = true
  }
}, {
  mode = 'n',
  lhs = '<leader>tl',
  rhs = ':tabmove -1<CR>',
  desc = '[l] Move tab left',
  opts = {
    noremap = true,
    silent = true
  }
}}

local function setup_keymaps()
  for _, keymap in ipairs(all_keymaps) do
    local opts = vim.tbl_extend('force', {
      desc = keymap.desc
    }, keymap.opts or {})
    vim.keymap.set(keymap.mode, keymap.lhs, keymap.rhs, opts)
  end
end

setup_keymaps()

-- Create user commands
vim.api.nvim_create_user_command('Q', 'quit', {
  desc = '[Q]uit Neovim'
})
vim.api.nvim_create_user_command('W', 'write', {
  desc = '[W]rite buffer'
})

-- Move to the next buffer
vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<CR>', {
  desc = '[b] Next buffer'
})

-- Move to the previous buffer
vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<CR>', {
  desc = '[b] Previous buffer'
})

-- Go to the buffer on the left
vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCyclePrev<CR>', {
  desc = '[h] Go to buffer left'
})

-- Go to the buffer on the right
vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCycleNext<CR>', {
  desc = '[l] Go to buffer right'
})

-- Pick a buffer to close
vim.keymap.set('n', '<leader>bc', '<cmd>BufferLinePickClose<CR>', {
  desc = '[c] Pick buffer to close'
})

-- Group actions that target all other buffers
vim.keymap.set('n', '<leader>bo', '<nop>', {
  desc = '[o] Other buffer commands'
})

-- Close the other buffers
vim.keymap.set('n', '<leader>boc', '<cmd>BufferLineCloseOthers<CR>', {
  desc = '[c] Close other buffers'
})
-- Close buffers on the right
vim.keymap.set('n', '<leader>bL', '<cmd>BufferLineCloseRight<CR>', {
  desc = '[L] Close buffers right'
})
-- Close buffers on the left
vim.keymap.set('n', '<leader>bH', '<cmd>BufferLineCloseLeft<CR>', {
  desc = '[H] Close buffers left'
})

-- Pick a buffer to go to
vim.keymap.set('n', '<leader>bb', '<cmd>BufferLinePick<CR>', {
  desc = '[b] Pick buffer'
})

-- Sort buffers by directory
vim.keymap.set('n', '<leader>bd', '<cmd>BufferLineSortByDirectory<CR>', {
  desc = '[d] Sort buffers by directory'
})

-- Sort buffers by file extension
vim.keymap.set('n', '<leader>bt', '<cmd>BufferLineSortByExtension<CR>', {
  desc = '[t] Sort buffers by file type'
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
  desc = '[p] Pin current buffer'
})

vim.keymap.set('n', '<leader>w+', '<cmd>resize +5<CR>', {
  silent = true,
  desc = '[+] Increase window height'
})
vim.keymap.set('n', '<leader>w-', '<cmd>resize -5<CR>', {
  silent = true,
  desc = '[-] Decrease window height'
})
vim.keymap.set('n', '<leader>w>', '<cmd>vertical resize +5<CR>', {
  silent = true,
  desc = '[>] Increase window width'
})
vim.keymap.set('n', '<leader>w<', '<cmd>vertical resize -5<CR>', {
  silent = true,
  desc = '[<] Decrease window width'
})

vim.keymap.set('n', 'gb1', '<cmd>BufferLineGoToBuffer 1<CR>', {
  silent = true,
  desc = 'Go to buffer [1]'
})
vim.keymap.set('n', 'gb2', '<cmd>BufferLineGoToBuffer 2<CR>', {
  silent = true,
  desc = 'Go to buffer [2]'
})
vim.keymap.set('n', 'gb3', '<cmd>BufferLineGoToBuffer 3<CR>', {
  silent = true,
  desc = 'Go to buffer [3]'
})
vim.keymap.set('n', '<leader>by', function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  vim.notify('Copied buffer path: ' .. path)
end, {
  silent = true,
  desc = '[y] Copy buffer path'
})
vim.keymap.set('n', '<leader>pa', builtin.find_files, {
  desc = '[a] Find all files'
})
vim.keymap.set('n', '<leader>pe', builtin.git_files, {
  desc = '[e] Explore git files'
})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {
  desc = '[g] Live grep'
})
vim.api.nvim_create_user_command('ViewImage', function(opts)
  if vim.fn.executable('chafa') ~= 1 then
    vim.notify('Image preview requires Chafa (`brew install chafa`)', vim.log.levels.ERROR)
    return
  end

  local path = opts.args ~= '' and vim.fn.expand(opts.args) or vim.api.nvim_buf_get_name(0)
  path = vim.fn.fnamemodify(path, ':p')
  if vim.fn.filereadable(path) ~= 1 then
    vim.notify('Image not found: ' .. path, vim.log.levels.ERROR)
    return
  end

  local width = math.max(20, math.floor(vim.o.columns * 0.8))
  local height = math.max(10, math.floor((vim.o.lines - vim.o.cmdheight) * 0.8))
  local bufnr = vim.api.nvim_create_buf(false, true)
  local winid = vim.api.nvim_open_win(bufnr, true, {
    relative = 'editor',
    style = 'minimal',
    border = 'rounded',
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2)
  })

  vim.bo[bufnr].bufhidden = 'wipe'
  vim.bo[bufnr].swapfile = false
  vim.fn.jobstart({
    'chafa',
    '--animate=off',
    '--center=on',
    '--format=symbols',
    '--size',
    string.format('%dx%d', width - 2, height - 2),
    path
  }, {
    term = true,
    on_exit = function(_, exit_code)
      if exit_code ~= 0 then
        vim.schedule(function()
          vim.notify('Chafa could not preview: ' .. path, vim.log.levels.ERROR)
        end)
      end
    end
  })

  local function close_preview()
    if vim.api.nvim_win_is_valid(winid) then
      vim.api.nvim_win_close(winid, true)
    end
  end
  vim.keymap.set('n', 'q', close_preview, {
    buffer = bufnr,
    silent = true,
    desc = '[q] Close image preview'
  })
  vim.keymap.set('n', '<Esc>', close_preview, {
    buffer = bufnr,
    silent = true,
    desc = '[Esc] Close image preview'
  })
end, {
  nargs = '?',
  complete = 'file',
  desc = 'Preview an image with Chafa'
})

vim.keymap.set('n', '<leader>pb', builtin.buffers, {
  desc = '[b] Find buffers'
})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {
  desc = '[h] Find help tags'
})
vim.keymap.set('n', '<leader>ps', builtin.grep_string, {
  desc = '[s] Find grep string'
})
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {
  desc = '[d] Find diagnostics'
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('JavascriptKeymaps', {
    clear = true
  }),
  pattern = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
  callback = function(args)
    vim.keymap.set('n', '<leader>cl', function()
      local word = vim.fn.expand('<cword>')
      local line = vim.api.nvim_win_get_cursor(0)[1]
      vim.api.nvim_buf_set_lines(args.buf, line, line, false, {
        string.format("console.log('%s :>> ', %s)", word, word)
      })
    end, {
      buffer = args.buf,
      desc = '[l] Log word under cursor'
    })
  end
})

vim.keymap.set('n', '<leader>fw', function()
  local word = vim.fn.expand('<cword>')
  vim.fn.setreg('"', word)
  vim.fn.search('\\V' .. vim.fn.escape(word, '\\'))
  vim.cmd('normal! zz')
end, {
  desc = '[w] Find word under cursor'
})
