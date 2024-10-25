local bufferline = require('bufferline')
bufferline.setup({
  options = {
    diagnostics = 'nvim_lsp',
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' }
    },
    style_preset = bufferline.style_preset.no_italic,
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end
  }
})
