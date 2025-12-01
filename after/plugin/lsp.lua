local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

-- CMP (Completion) setup
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'luasnip' },
    { name = 'cody' },
    { name = 'nvim_lsp' },
    { name = 'dotenv' },
    { name = 'buffer' },
    { name = 'path' },
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
  window = {
    completion = cmp.config.window.bordered({
      border = 'rounded'
    }),
    documentation = cmp.config.window.bordered({
      border = 'rounded',
    }),
  },
})
-- Function to set up common LSP keybindings
local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = "Go to declaration" }))
  vim.keymap.set('n', 'gd', GoToDefinitionInFloat, vim.tbl_extend('force', opts, { desc = "Go to definition" }))

  vim.keymap.set('n', 'gld', '<C-w>v<C-]>',
    vim.tbl_extend('force', opts, { desc = 'Go to definition in vertical split' }))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = "Show hover information" }))
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {
      border = "rounded" -- You can use "single", "double", "rounded", "solid", "shadow"
    }
  )

  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = "Go to implementation" }))
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
    vim.tbl_extend('force', opts, { desc = "Show signature help" }))
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
    vim.tbl_extend('force', opts, { desc = "Go to type definition" }))
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = "Rename symbol" }))
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = "Show references" }))
  vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action,
    vim.tbl_extend('force', opts, { desc = "Code actions" }))
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, vim.tbl_extend('force', opts, { desc = "Format document" }))
end

local function lspconfigserver(server_name, config)
  config = config or {}
  lspconfig[server_name].setup(config)
end

-- Mason setup
local handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    lspconfigserver(server_name)
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["eslint"] = function()
    lspconfigserver('eslint', {
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
  end,

  ["tailwindcss"] = function()
    local function has_tailwind_config(root_dir)
      local tailwind_config_files = {
        'tailwind.config.js',
        'tailwind.config.cjs',
        'tailwind.config.mjs',
        'tailwind.config.ts'
      }

      for _, config_file in ipairs(tailwind_config_files) do
        local config_path = root_dir .. '/' .. config_file
        local f = io.open(config_path, "r")
        if f then
          f:close()
          return true
        end
      end

      -- Check for tailwind in package.json
      local package_json = root_dir .. '/package.json'
      local f = io.open(package_json, "r")
      if f then
        local content = f:read("*all")
        f:close()
        if content:match('"tailwindcss"') then
          return true
        end
      end

      return false
    end
    lspconfig.tailwindcss.setup({
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
      end,
      root_dir = function(fname)
        -- First use the default root directory detection
        local root = lspconfig.util.root_pattern(
          'tailwind.config.js',
          'tailwind.config.cjs',
          'tailwind.config.mjs',
          'tailwind.config.ts',
          'package.json'
        )(fname)

        -- If a root is found, check if it actually has Tailwind config
        if root and has_tailwind_config(root) then
          return root
        end
        return nil
      end,
    })
  end,

  ["intelephense"] = function()
    lspconfig.intelephense.setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        -- format on save
        vim.api.nvim_command("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = true})")
      end,
      settings = {
        intelephense = {
          files = {
            maxSize = 5000000, -- Increase file size limit if needed
          },
          diagnostics = {
            enable = true,
          },
          format = {
            enable = true,
          },
        },
      },
    }
  end,
}
require('mason').setup({})
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = { 'lua_ls', 'ts_ls', 'eslint', 'stylelint_lsp', 'cssmodules_ls', 'tailwindcss', 'somesass_ls', 'intelephense', 'cssls', 'pyright', 'stimulus_ls', 'html' },
  handlers = handlers,
  on_attach = on_attach,
})

-- Set up auto-formatting for Lua files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
