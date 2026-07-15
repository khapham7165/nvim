local telescope = require('telescope')
local builtin = require('telescope.builtin')
local telescope_preview = require('core.telescope_preview')

telescope.setup {
  defaults = {
    borderchars = {
      prompt = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
      results = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
      preview = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"}
    },
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
      vertical = {
        width = 0.9,
        height = 0.9
      }
    }
  },
  extensions = {
    media_files = {
      filetypes = {"png", "jpg", "jpeg", "gif", "webp", "svg"},
      find_cmd = "rg"
    }
  }
}

telescope.load_extension('media_files')

vim.keymap.set('n', '<leader>pa', function()
  builtin.find_files({
    previewer = telescope_preview.new()
  })
end, {
  desc = '[a] Find all files'
})

vim.keymap.set('n', '<leader>pi', telescope.extensions.media_files.media_files, {
  desc = '[i] Image preview'
})
