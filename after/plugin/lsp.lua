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
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ["<c-a>"] = cmp.mapping.complete {
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
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = "Go to definition" }))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = "Show hover information" }))
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = "Go to implementation" }))
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
    vim.tbl_extend('force', opts, { desc = "Show signature help" }))
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder,
    vim.tbl_extend('force', opts, { desc = "Add workspace folder" }))
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
    vim.tbl_extend('force', opts, { desc = "Remove workspace folder" }))
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, vim.tbl_extend('force', opts, { desc = "List workspace folders" }))
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
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'ts_ls', 'eslint', 'stylelint_lsp', 'cssmodules_ls', 'tailwindcss' },
})

-- LSP server setups
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

lspconfig.ts_ls.setup({
  on_attach = on_attach,
})

lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

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

-- Set up autocommand to close language servers on Neovim exit
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local clients = vim.lsp.get_active_clients()
    for _, client in ipairs(clients) do
      client.stop()
    end
  end
})

-- Set up auto-formatting for Lua files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
