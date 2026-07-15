local api = vim.api
local from_entry = require('telescope.from_entry')
local Path = require('plenary.path')
local Previewer = require('telescope.previewers.previewer')
local previewers = require('telescope.previewers')

local M = {}

local image_extensions = {
  avif = true,
  bmp = true,
  gif = true,
  ico = true,
  jpeg = true,
  jpg = true,
  jxl = true,
  png = true,
  qoi = true,
  svg = true,
  tif = true,
  tiff = true,
  webp = true
}

local function entry_path(entry, cwd)
  local path = from_entry.path(entry, false, false)
  if not path or path == '' or path == '[No Name]' then
    return nil
  end

  if not Path:new(path):is_absolute() then
    path = vim.fs.joinpath(cwd, path)
  end

  return vim.fs.normalize(path)
end

local function is_image(entry, cwd)
  local path = entry_path(entry, cwd)
  if not path then
    return false
  end

  local extension = vim.fn.fnamemodify(path, ':e'):lower()
  return image_extensions[extension] == true
end

function M.new(opts)
  opts = opts or {}
  local cwd = vim.fs.normalize(opts.cwd or vim.uv.cwd())
  local active_previewer
  local text_previewer = previewers.vim_buffer_cat.new(opts)
  local image_previewer = previewers.new_termopen_previewer({
    title = 'Image Preview',
    dyn_title = function(_, entry)
      local path = entry_path(entry, cwd)
      return path and Path:new(path):normalize(cwd) or 'Image Preview'
    end,
    get_command = function(entry, status)
      local path = entry_path(entry, cwd)
      if not path then
        return
      end

      if vim.fn.executable('chafa') ~= 1 then
        return {'echo', 'Image preview requires Chafa (`brew install chafa`)'}
      end

      local winid = status.layout.preview and status.layout.preview.winid
      local width = winid and api.nvim_win_get_width(winid) or 80
      local height = winid and api.nvim_win_get_height(winid) or 24

      return {
        'chafa',
        '--animate=off',
        '--center=on',
        '--format=symbols',
        '--size',
        string.format('%dx%d', math.max(1, width - 2), math.max(1, height - 1)),
        path
      }
    end
  })

  active_previewer = text_previewer

  return Previewer:new({
    title = 'File Preview',
    dyn_title = function(_, entry)
      local path = entry_path(entry, cwd)
      return path and Path:new(path):normalize(cwd) or 'File Preview'
    end,
    preview_fn = function(_, entry, status)
      active_previewer = is_image(entry, cwd) and image_previewer or text_previewer
      active_previewer:preview(entry, status)
    end,
    teardown = function()
      text_previewer:teardown()
      image_previewer:teardown()
    end,
    send_input = function(_, input)
      active_previewer:send_input(input)
    end,
    scroll_fn = function(_, direction)
      active_previewer:scroll_fn(direction)
    end,
    scroll_horizontal_fn = function(_, direction)
      active_previewer:scroll_horizontal_fn(direction)
    end
  })
end

return M
