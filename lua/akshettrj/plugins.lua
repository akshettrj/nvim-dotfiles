vim.fn["plug#begin"]()


-- Requirements
vim.cmd [[ Plug 'nvim-tree/nvim-web-devicons' ]]
vim.cmd [[ Plug 'nvim-lua/popup.nvim' ]]
vim.cmd [[ Plug 'nvim-lua/plenary.nvim' ]]


-- Colorschemes
vim.cmd [[ Plug 'ellisonleao/gruvbox.nvim' ]]


-- LSP
vim.cmd [[ Plug 'neovim/nvim-lspconfig' ]]
vim.cmd [[ Plug 'onsails/lspkind.nvim' ]]
vim.cmd [[ Plug 'ray-x/lsp_signature.nvim' ]]
vim.cmd [[ Plug 'SmiteshP/nvim-navic' ]]


-- Completion
vim.cmd [[ Plug 'hrsh7th/cmp-nvim-lsp' ]]
vim.cmd [[ Plug 'hrsh7th/cmp-nvim-lua' ]]
vim.cmd [[ Plug 'hrsh7th/cmp-nvim-lsp-document-symbol' ]]
vim.cmd [[ Plug 'hrsh7th/cmp-path' ]]
vim.cmd [[ Plug 'kdheepak/cmp-latex-symbols' ]]
vim.cmd [[ Plug 'saadparwaiz1/cmp_luasnip' ]]
vim.cmd [[ Plug 'hrsh7th/nvim-cmp' ]]

-- UI
vim.cmd [[ Plug 'romgrk/barbar.nvim' ]]
vim.cmd [[ Plug 'lukas-reineke/indent-blankline.nvim' ]]
vim.cmd [[ Plug 'nvim-lualine/lualine.nvim' ]]


-- Colors & Highlighting
vim.cmd [[ Plug 'nvim-zh/colorful-winsep.nvim' ]]
vim.cmd [[ Plug 'norcalli/nvim-colorizer.lua' ]]


-- Productivity
vim.cmd [[ Plug 'lewis6991/gitsigns.nvim' ]]
vim.cmd [[ Plug 'tpope/vim-sleuth' ]]
vim.cmd [[ Plug 'tpope/vim-surround' ]]
vim.cmd [[ Plug 'tpope/vim-repeat' ]]
vim.cmd [[ Plug 'tpope/vim-fugitive' ]]
vim.cmd [[ Plug 'tpope/vim-eunuch' ]]


-- Telescope
vim.cmd [[ Plug 'nvim-telescope/telescope.nvim' ]]
vim.cmd [[ Plug 'nvim-telescope/telescope-file-browser.nvim' ]]
vim.cmd [[ Plug 'nvim-telescope/telescope-live-grep-args.nvim' ]]


-- Treesitter
vim.cmd [[ Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } ]]
vim.cmd [[ Plug 'nvim-treesitter/nvim-treesitter-context' ]]


-- Utilities
vim.cmd [[ Plug 'numToStr/Comment.nvim' ]]
vim.cmd [[ Plug 'akinsho/toggleterm.nvim' ]]
vim.cmd [[ Plug 'mbbill/undotree' ]]
vim.cmd [[ Plug 'untitled-ai/jupyter_ascending.vim' ]]
vim.cmd [[ Plug 'vimwiki/vimwiki' ]]
vim.cmd [[ Plug 'tpope/vim-dadbod' ]]
vim.cmd [[ Plug 'kristijanhusak/vim-dadbod-ui' ]]


-- Snippets
vim.cmd [[ Plug 'L3MON4D3/LuaSnip' ]]
vim.cmd [[ Plug 'rafamadriz/friendly-snippets' ]]
vim.cmd [[ Plug 'iurimateus/luasnip-latex-snippets.nvim' ]]
vim.cmd [[ Plug 'molleweide/LuaSnip-snippets.nvim' ]]


-- Language Specific
vim.cmd [[ Plug 'fatih/vim-go', { 'for': [ 'go', 'rapid', 'gosum' ] } ]]

vim.fn["plug#end"]()
