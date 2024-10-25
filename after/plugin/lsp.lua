local lspconfig = require('lspconfig')
local cmp = require('cmp')

-- CMP (Completion) setup
cmp.setup({
  sources = {

    { name = 'cody' },
    { name = 'nvim_lsp' },
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<Tab>'] = cmp.mapping.select_next_item(),
    ["<c-a>"] = cmp.mapping.complete {
      -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      config = {
        sources = {
          { name = "cody" },
        },
      },
    },
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
})

-- Function to set up common LSP keybindings
local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = "Go to declaration" }))
  vim.api.nvim_set_keymap('n', 'gd', ':lua GoToDefinitionInFloat()<CR>',
    { noremap = true, silent = true, desc = 'Go to definition' })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = "Show hover information" }))
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = "Go to implementation" }))
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
    vim.tbl_extend('force', opts, { desc = "Show signature help" }))
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
    vim.tbl_extend('force', opts, { desc = "Go to type definition" }))
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = "Rename symbol" }))
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = "Show references" }))
  vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = "Code actions" }))
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, vim.tbl_extend('force', opts, { desc = "Format document" }))
end

-- Mason setup
local handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["eslint"] = function()
    lspconfig.eslint.setup({
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })
  end,
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    })
  end,
  ["stylelint_lsp"] = function()
    lspconfig.stylelint_lsp.setup({
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
        if filetype == 'typescriptreact' or filetype == 'typescript' then
          client.stop()
        end
      end,
      settings = {
        stylelintplus = {
          autoFixOnSave = true,
          autoFixOnFormat = true,
          validateOnType = true,
        }
      },
      filetypes = { "css", "scss", "less" },
    })
  end,
  ["cssls"] = function()
    lspconfig.cssls.setup({
      filetypes = { "css", "less" }
    })
  end
}
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'ts_ls', 'eslint', 'stylelint_lsp', 'cssmodules_ls', 'tailwindcss', 'somesass_ls', 'intelephense', 'cssls', 'pyright' },
  handlers = handlers,
  on_attach = on_attach,
})

-- LSP server setups





-- Set up auto-formatting for Lua files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
