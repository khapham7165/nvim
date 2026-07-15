local cmp = require('cmp')
local luasnip = require('luasnip')

local function go_to_definition()
  local ts_clients = vim.lsp.get_clients({
    bufnr = 0,
    name = 'ts_ls'
  })

  -- TypeScript's regular definition request often stops at an import binding.
  if #ts_clients > 0 and vim.fn.exists(':LspTypescriptGoToSourceDefinition') == 2 then
    vim.cmd('LspTypescriptGoToSourceDefinition')
    return
  end

  vim.lsp.buf.definition()
end

local function go_to_definition_in_split()
  vim.cmd('vsplit')
  go_to_definition()
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = cmp.config.sources({{
    name = 'nvim_lsp'
  }, {
    name = 'luasnip'
  }, {
    name = 'dotenv'
  }, {
    name = 'path'
  }}, {{
    name = 'buffer'
  }}),
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({
      select = false
    })
  }),
  window = {
    completion = cmp.config.window.bordered({
      border = 'rounded'
    }),
    documentation = cmp.config.window.bordered({
      border = 'rounded'
    })
  }
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded'
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded'
})

local function set_lsp_keymaps(bufnr)
  local opts = {
    silent = true,
    buffer = bufnr
  }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, {
    desc = 'Go to [D]eclaration'
  }))
  vim.keymap.set('n', 'gd', go_to_definition, vim.tbl_extend('force', opts, {
    desc = 'Go to [d]efinition'
  }))
  vim.keymap.set('n', 'gld', go_to_definition_in_split, vim.tbl_extend('force', opts, {
    desc = '[d] Go to definition in vertical split'
  }))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, {
    desc = 'Show hover information'
  }))
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, vim.tbl_extend('force', opts, {
    desc = 'Show signature help'
  }))
  vim.keymap.set('n', '<leader>l', '<nop>', vim.tbl_extend('force', opts, {
    desc = '[l] LSP commands'
  }))
  vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, vim.tbl_extend('force', opts, {
    desc = '[D] Go to type definition'
  }))
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, vim.tbl_extend('force', opts, {
    desc = '[r] Rename symbol'
  }))
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, {
    desc = '[a] Code actions'
  }))
  vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.format({
      async = true
    })
  end, vim.tbl_extend('force', opts, {
    desc = '[f] Format document'
  }))
end

local eslint_fix_group = vim.api.nvim_create_augroup('EslintFixOnSave', {
  clear = true
})
local format_group = vim.api.nvim_create_augroup('LspFormatOnSave', {
  clear = true
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspConfig', {
    clear = true
  }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    set_lsp_keymaps(args.buf)

    if client.name == 'eslint' then
      vim.api.nvim_clear_autocmds({
        group = eslint_fix_group,
        buffer = args.buf
      })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = eslint_fix_group,
        buffer = args.buf,
        callback = function()
          if vim.fn.exists(':LspEslintFixAll') == 2 then
            vim.cmd('LspEslintFixAll')
          end
        end
      })
    end

    if client.name == 'lua_ls' or client.name == 'intelephense' then
      vim.api.nvim_clear_autocmds({
        group = format_group,
        buffer = args.buf
      })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = format_group,
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({
            async = false,
            bufnr = args.buf,
            id = client.id
          })
        end
      })
    end
  end
})

vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true)
      }
    }
  }
})

vim.lsp.config('stylelint_lsp', {
  filetypes = {'css', 'scss', 'less'},
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true,
      validateOnType = true
    }
  }
})

vim.lsp.config('cssls', {
  filetypes = {'css', 'less'}
})

local tailwind_config_files = {'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs',
                               'tailwind.config.ts'}

local function has_tailwind_dependency(root_dir)
  local package_json = io.open(root_dir .. '/package.json', 'r')
  if not package_json then
    return false
  end

  local content = package_json:read('*a')
  package_json:close()
  return content:match('"tailwindcss"') ~= nil
end

vim.lsp.config('tailwindcss', {
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, tailwind_config_files)
    if not root then
      local package_root = vim.fs.root(bufnr, {'package.json'})
      if package_root and has_tailwind_dependency(package_root) then
        root = package_root
      end
    end

    if root then
      on_dir(root)
    end
  end
})

vim.lsp.config('intelephense', {
  settings = {
    intelephense = {
      files = {
        maxSize = 5000000
      },
      diagnostics = {
        enable = true
      },
      format = {
        enable = true
      }
    }
  }
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls', 'ts_ls', 'eslint', 'stylelint_lsp', 'cssmodules_ls', 'tailwindcss', 'somesass_ls',
                      'intelephense', 'cssls', 'pyright', 'stimulus_ls', 'html'},
  automatic_enable = true
})
