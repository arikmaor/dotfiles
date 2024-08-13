local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'

  -- theme
  use {
    'morhetz/gruvbox',
    as = 'gruvbox',
    vim.cmd.colorscheme('gruvbox')
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- git integration
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'APZelos/blamer.nvim'

  -- comment out code
  use 'tpope/vim-commentary'

  -- editorconfig
  use 'editorconfig/editorconfig-vim'

  -- auto complete brackets
  use 'jiangmiao/auto-pairs'

  -- syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    {
      run = ':TSUpdate'
    }
  }

  -- text objects
  use 'vim-scripts/argtextobj.vim'
  use 'vim-scripts/ReplaceWithRegister'
  use 'michaeljsmith/vim-indent-object'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- file tree view
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }
  -- undo tree
  use 'mbbill/undotree'

  -- tmux integration
  use 'christoomey/vim-tmux-navigator'

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

