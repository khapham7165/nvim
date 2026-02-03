require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require'nvim-treesitter'.install {'typescript', 'javascript', 'tsx', 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown',
                                  'markdown_inline'}
