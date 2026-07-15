local chat = require("CopilotChat")
local select = require("CopilotChat.select")
chat.setup({
  window = {
    layout = 'float',
    width = 0.5,
    height = 0.8
  },
  prompts = {
    Explain = {
      prompt = 'Explain how it works.',
      mapping = '<leader>ae',
      description = '[e] Explain how the code works',
      selection = select.visual
    },
    Refactor = {
      prompt = 'Refactor this code.',
      mapping = '<leader>ar',
      description = '[r] Refactor the code',
      selection = select.visual
    },
    Optimize = {
      prompt = 'Optimize this code.',
      mapping = '<leader>ao',
      description = '[o] Optimize the code',
      selection = select.visual
    },
    NewChatWithSelection = {
      prompt = 'Chat about this code.',
      mapping = '<leader>ac',
      description = '[c] Chat about the code',
      selection = select.visual
    },
    Tests = {
      prompt = '/COPILOT_GENERATE Please generate tests for my code.',
      mapping = '<leader>at',
      description = '[t] Generate tests for the code',
      selection = select.visual
    },
    FixDiagnostic = {
      prompt = 'Please assist with the following diagnostic issue in file:',
      mapping = '<leader>ad',
      description = '[d] Fix diagnostic issue',
      selection = select.diagnostics
    }
  }
})
