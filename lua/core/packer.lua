-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'       -- Buffer completions
  use 'hrsh7th/cmp-path'         -- Path completions
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP completions
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use {
    'L3MON4D3/LuaSnip',
    requires = { 'saadparwaiz1/cmp_luasnip' }
  }
  use {
    'nvim-telescope/telescope.nvim',
    version = '*',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate'
  }
  use {
    "catppuccin/nvim",
    as = "catppuccin"
  }
  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x'
  })
  use 'wbthomason/packer.nvim'
  use { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' -- optional
    }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true
    }
  }
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'akinsho/git-conflict.nvim',
    tag = "*"
  }
  use 'pwntester/octo.nvim'
  use 'sindrets/diffview.nvim'
  use 'karb94/neoscroll.nvim'
  use 'folke/which-key.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'tpope/vim-commentary'
  use 'metakirby5/codi.vim'
  use 'windwp/nvim-ts-autotag'
  use 'echasnovski/mini.nvim'
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use {
    'github/copilot.vim',
    branch = 'release'
  }
  use {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main'
  }
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" -- optional dependency
    },
    after = "nvim-web-devicons"                                       -- keep this if you're using NvChad
  })
  use {
    'nvim-telescope/telescope-media-files.nvim',
    dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' }
  }
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'stevearc/dressing.nvim'
  use 'SergioRibera/cmp-dotenv'
  use {
    "ray-x/lsp_signature.nvim",
    branch = "master"
  }
end)
