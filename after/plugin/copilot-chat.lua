local chat = require("CopilotChat")
local select = require("CopilotChat.select")
chat.setup({
  window = {
    layout = 'float',
    width = 0.5,
    height = 0.8
  },
  prompts = {
    Explain              = {
      prompt = 'Explain how it works.',
      mapping = '<leader>ae',
      description = 'AI will explain how the code works.',
      selection = select.visual,
    },
    Refactor             = {
      prompt = 'Refactor this code.',
      mapping = '<leader>ar',
      description = 'AI will refactor the code.',
      selection = select.visual,
    },
    Optimize             = {
      prompt = 'Optimize this code.',
      mapping = '<leader>ao',
      description = 'AI will optimize the code.',
      selection = select.visual,
    },
    NewChatWithSelection = {
      prompt = 'Chat about this code.',
      mapping = '<leader>ac',
      description = 'AI will chat about the code.',
      selection = select.visual,
    },
    Tests                = {
      prompt = '/COPILOT_GENERATE Please generate tests for my code.',
      mapping = '<leader>at',
      description = 'AI will generate tests for the code.',
      selection = select.visual,
    },
    FixDiagnostic        = {
      prompt = 'Please assist with the following diagnostic issue in file:',
      mapping = '<leader>ad',
      description = 'AI will assist with the diagnostic issue.',
      selection = select.diagnostics,
    },
  }
})
