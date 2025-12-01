-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

local function ins_right_inactive(component)
  table.insert(config.inactive_sections.lualine_x, component)
end

local function ins_left_inactive(component)
  table.insert(config.inactive_sections.lualine_c, component)
end

ins_left {
  -- mode component
  function()
    local mode_texts = {
      n = "Normal",
      i = "Insert",
      v = "Visual",
      V = "Visual Line",
      ["^V"] = "Visual Block",
      c = "Command-line",
      s = "Select",
      S = "Select Line",
      ["^S"] = "Select Block",
      R = "Replace",
      Rv = "Virtual Replace",
      r = "Enter prompt for :",
      rm = "-- more --",
      ["r?"] = "Confirm replace",
      ["!"] = "Shell command"
    }

    return ' ' .. string.upper(mode_texts[vim.fn.mode()])
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.green,
      i = colors.blue,
      v = colors.yellow,
      [''] = colors.yellow,
      V = colors.yellow,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}
ins_left {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}
ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.cyan },
  },
}

ins_left {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = '󰐖 ', modified = '󱗜 ', removed = '󰍵 ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.blue },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  function()
    return '[KhaPK] ⌐■-■'
  end,
  color = { fg = colors.violet },
}

ins_right {
  -- Lsp server names.
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.bo.filetype
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
      return msg
    end
    local client_names = {}
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        table.insert(client_names, client.name)
      end
    end
    if #client_names == 0 then
      return msg
    else
      return table.concat(client_names, '|')
    end
  end,
  icon = ' ',
}

-- Add components to right sections

ins_right { 'filetype' }
ins_right { 'progress', color = { fg = colors.fg, gui = 'bold' } }
ins_right { 'location' }

-- Now don't forget to initialize lualine
lualine.setup(config)
