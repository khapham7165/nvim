-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  use({ 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' })
  use 'wbthomason/packer.nvim'
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
  use 'lewis6991/gitsigns.nvim'
  use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua' }
  use 'nvim-lua/plenary.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'Mofiqul/dracula.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'akinsho/git-conflict.nvim', tag = "*" }
  use 'pwntester/octo.nvim'
  use 'sindrets/diffview.nvim'
  use 'karb94/neoscroll.nvim'
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      {
        's1n7ax/nvim-window-picker',
        version = '2.*',

      },
    },
  }
  use 'folke/which-key.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'tpope/vim-commentary'
  use 'gorbit99/codewindow.nvim'
  use 'metakirby5/codi.vim'
  use 'windwp/nvim-ts-autotag'
  use 'echasnovski/mini.nvim'
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
  use 'github/copilot.vim'
  use 'CopilotC-Nvim/CopilotChat.nvim'
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons",     -- keep this if you're using NvChad
  })
end)
