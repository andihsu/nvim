-- Neovim plugins configuratioon for packer.nvim

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

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use  { 
    "clpi/cyu.lua",
    config = function()
        vim.g.cayu_style = "night" 
        vim.g.cayu_italic_functions = true
        vim.g.cayu_sidebars = {} 
    end
  }
-- Plugins
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 
        'nvim-tree/nvim-web-devicons', 
        opt = true, 
    }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
        'nvim-tree/nvim-web-devicons',
    }
  }
  use "christoomey/vim-tmux-navigator"
  use "nvim-treesitter/nvim-treesitter"
  use "p00f/nvim-ts-rainbow"
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  use "numToStr/Comment.nvim"
  use "windwp/nvim-autopairs"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path"
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 
      "akinsho/bufferline.nvim",
      tag = "*",
      requires = "nvim-tree/nvim-web-devicons"
  }
  use "nvim-tree/nvim-web-devicons"
  use 'voldikss/vim-floaterm'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
