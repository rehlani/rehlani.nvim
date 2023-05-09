vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-tree/nvim-web-devicons' }, { "kdheepak/lazygit.nvim" } }
  }

  use({
    'EdenEast/nightfox.nvim',
  })

  use { "catppuccin/nvim", as = "catppuccin" }

  use { 'davidscotson/sonokai-nvim',
    requires = { { 'rktjmp/lush.nvim' } }
  }
  use { "ellisonleao/gruvbox.nvim" }

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use('tpope/vim-fugitive')

  use {
    'kylechui/nvim-surround',
    tag = "*"
  }

  use { "nvim-telescope/telescope-file-browser.nvim" }

  use { "tyru/open-browser-github.vim", requires = { "tyru/open-browser.vim" } }

  use { "terrortylor/nvim-comment" }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { 'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use { 'ThePrimeagen/harpoon',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use { 'jay-babu/mason-null-ls.nvim' }

  use { 'MunifTanjim/prettier.nvim' }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    "johmsalas/text-case.nvim"
  }

  use {
    'mfussenegger/nvim-dap',
      opt = true,
    event = "BufReadPre",
    module = { "dap" },
    wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },

    requires = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "Pocco81/DAPInstall.nvim",
    "mfussenegger/nvim-dap-python",
    "nvim-telescope/telescope-dap.nvim",
    { "jbyuki/one-small-step-for-vimkind", module = "osv" },

    },
    config = function()
      require("config.dap").setup()
    end
  }

  use {'saadparwaiz1/cmp_luasnip'}


  use {'David-Kunz/jester'}

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
                               -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' }, -- Required
    }
  }

  use {
    'lewis6991/gitsigns.nvim',
  }
end)
