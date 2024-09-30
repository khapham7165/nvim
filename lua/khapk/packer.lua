-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {'lewis6991/gitsigns.nvim'}
  use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'norcalli/nvim-colorizer.lua' }
  use 'Mofiqul/dracula.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use {'akinsho/git-conflict.nvim', tag = "*"}
  use {
    'pwntester/octo.nvim',
  }
  use "sindrets/diffview.nvim"
end)
