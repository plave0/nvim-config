local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)

  -- helper plugins
  use "nvim-lua/popup.nvim"
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons' -- required by nvimtree

  -- plugin plugins
  use "wbthomason/packer.nvim"

  -- color schemes
  use 'shaunsingh/nord.nvim'
  use 'navarasu/onedark.nvim'

  -- cmp
	use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lua"
	use 'saadparwaiz1/cmp_luasnip'
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lsp-signature-help"

  -- navigation
	use "nvim-telescope/telescope.nvim"
  use 'kyazdani42/nvim-tree.lua'

  -- git
	use 'lewis6991/gitsigns.nvim'

	-- snips
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

	-- lsp
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"
	use "nvim-treesitter/nvim-treesitter" -- better syntax highlight

  -- utilities
  use "mechatroner/rainbow_csv" -- csv tool

  -- qulity of life plugins
	use "windwp/nvim-autopairs"
  use 'folke/which-key.nvim'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
