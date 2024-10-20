local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = {
    {name = 'cody'},
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
   mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ["<c-a>"] = cmp.mapping.complete {
      config = {
        sources = {
          { name = "cody" },
        },
      },
    },
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }),
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls', 'ts_ls', 'eslint', 'stylelint_lsp', 'cssmodules_ls', 'tailwindcss'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
lspconfig.stylelint_lsp.setup({
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true,
      validateOnType = true,
    }
  },
  filetypes = { "css", "scss", "less" },
  on_attach = function(client, bufnr)
    local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
    if filetype == 'typescriptreact' or filetype == 'typescript' then
      client.stop()
    end
  end,
})

-- Ensure language server is closed when Neovim quits
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        local clients = vim.lsp.get_active_clients()
        for _, client in ipairs(clients) do
            client.stop()
        end
    end
})

