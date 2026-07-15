-- Setup in your configuration
require('telescope').setup {
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

require('telescope').load_extension('media_files')
vim.keymap.set('n', '<leader>pi', require('telescope').extensions.media_files.media_files, {
  desc = '[i] Image preview'
})
