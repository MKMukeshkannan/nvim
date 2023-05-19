local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  
  use("nvim-lua/plenary.nvim")
  
  --color scheme
  use('morhetz/gruvbox')

  use("christoomey/vim-tmux-navigator")

  use("szw/vim-maximizer")

  use("tpope/vim-surround")
  use("inkarkat/vim-ReplaceWithRegister")
 
  use("nvim-tree/nvim-tree.lua") 
  use("nvim-tree/nvim-web-devicons")
  
  
  use("nvim-lualine/lualine.nvim")

  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  use("hrsh7th/nvim-cmp")  
  use("hrsh7th/cmp-buffer") 
  use("hrsh7th/cmp-path") 

  use("L3MON4D3/LuaSnip") 
  use("saadparwaiz1/cmp_luasnip") 
  use("rafamadriz/friendly-snippets") 

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  
  use("hrsh7th/cmp-nvim-lsp")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
