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
  use { "catppuccin/nvim", as = "catppuccin" }

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

  use("kshenoy/vim-signature")

  use {
    "leoluz/nvim-dap-go",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  }
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  
  use("hrsh7th/cmp-nvim-lsp")
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })
  use("onsails/lspkind.nvim")

  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  use("windwp/nvim-autopairs")
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) 

  use 'mfussenegger/nvim-dap'

  if packer_bootstrap then
    require("packer").sync()
  end
end)
