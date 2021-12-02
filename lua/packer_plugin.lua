local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local use = require('packer').use
local util = require 'packer.util'

require('packer').init({
  ensure_dependecies = true,
  compile_path = util.join_paths(fn.stdpath('config'), 'packer_compiled.lua'),
  display = {
    open_fn = function() return util.float { border = "rounded" } end,
  }
})

return require('packer').startup(function()
  -- Packer can manage itself
  use { "wbthomason/packer.nvim" }

  use { "neovim/nvim-lspconfig" }
  use { "nvim-lua/lsp-status.nvim" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/cmp-emoji" }
  use { "hrsh7th/cmp-nvim-lsp-document-symbol" }
  use { "hrsh7th/cmp-path" }
  use { "David-Kunz/cmp-npm" }
  use { "tamago324/cmp-zsh" }
  use { "f3fora/cmp-spell" }
  use { "lukas-reineke/cmp-rg" }
  use { "hrsh7th/nvim-cmp" }
  use { "onsails/lspkind-nvim" }
  -- use { "akinsho/flutter-tools.nvim" }
  use { "kdheepak/cmp-latex-symbols" }
  use { "ray-x/cmp-treesitter" }
  use { "ray-x/lsp_signature.nvim" }

  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use {"nvim-treesitter/playground", run = ":TSUpdate"}
  use {"sheerun/vim-polyglot"}                 -- Better Syntax Highlight
  use {"kelwin/vim-smali"}                 -- Better Syntax Highlight


  -- Indentation
  use { "tpope/vim-sleuth" }
  use { "lukas-reineke/indent-blankline.nvim" }

  -- Color Schemes
  use {
    "ellisonleao/gruvbox.nvim",
    requires = {"rktjmp/lush.nvim"}
  }
  use { "Mofiqul/dracula.nvim", opt=true, cmd={"colorscheme"} }
  use { "tomasiser/vim-code-dark", opt=true, cmd={"colorscheme"} }
  -- use { "folke/lsp-colors.nvim" }

  -- Productivity
  use { "vimwiki/vimwiki" }
  use { "folke/which-key.nvim" }
  use { "rstacruz/vim-closer" }
  use { "untitled-ai/jupyter_ascending.vim" }
  use { "polarmutex/contextprint.nvim" }
  use { "tpope/vim-surround" }
  use { "tpope/vim-repeat" }
  -- use { "github/copilot.vim" }
  use { "L3MON4D3/LuaSnip" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "numToStr/Comment.nvim" }
  use { "tpope/vim-fugitive" }
  use { "norcalli/nvim-colorizer.lua" }
  use { "akinsho/bufferline.nvim" }
  use { "lewis6991/gitsigns.nvim" }
  use { "rafamadriz/friendly-snippets" }
  -- use { "itchyny/vim-cursorword" }
  -- use { "puremourning/vimspector" }

  -- Telescope
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-media-files.nvim" }
  use { "nvim-telescope/telescope-fzf-native.nvim" }
  use { "nvim-telescope/telescope-frecency.nvim" }
  use { "nvim-telescope/telescope-symbols.nvim" }

  use { "kyazdani42/nvim-web-devicons", opt=true }
  use { "nvim-lualine/lualine.nvim" }

  -- Vim In Browser
  -- use { "glacambre/firenvim", run = function() vim.fn['firenvim#install'](69) end }

  -- Misc

  -- use { "andweeb/presence.nvim" }

end)
