local Plug = vim.fn["plug#"]

vim.call("plug#begin")


-- Requirements
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-lua/popup.nvim")
Plug("nvim-lua/plenary.nvim")


-- Pets roaming around (doesn't work currently due to hologram.nvim)
-- Plug("edluffy/hologram.nvim")
-- Plug("MunifTanjim/nui.nvim")
-- Plug("giusgad/pets.nvim")


-- Colorschemes
Plug("ellisonleao/gruvbox.nvim", { ["on"] = "colorscheme" })


-- LSP
Plug("neovim/nvim-lspconfig")
Plug("onsails/lspkind.nvim")
Plug("williamboman/mason.nvim")
Plug("ray-x/lsp_signature.nvim")
Plug("SmiteshP/nvim-navic")
Plug("j-hui/fidget.nvim")


-- Completion
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/cmp-nvim-lsp-document-symbol")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-buffer")
Plug("kdheepak/cmp-latex-symbols", { ["for"] = { "tex" } })
Plug("saadparwaiz1/cmp_luasnip")
Plug("hrsh7th/nvim-cmp")

-- UI
Plug("romgrk/barbar.nvim")
Plug("lukas-reineke/indent-blankline.nvim")
Plug("nvim-lualine/lualine.nvim")
Plug("petertriho/nvim-scrollbar")
Plug("gorbit99/codewindow.nvim")
Plug("tiagovla/scope.nvim")


-- Colors & Highlighting
Plug("nvim-zh/colorful-winsep.nvim")
Plug("norcalli/nvim-colorizer.lua")


-- Productivity
Plug("lewis6991/gitsigns.nvim")
Plug("tpope/vim-sleuth") ------ Indentation configuration
Plug("tpope/vim-surround") ---- Brackets and stuff
Plug("tpope/vim-repeat") ------ Repeat custom stuff with .
Plug("tpope/vim-fugitive", { ["on"] = "Git" }) ---- Git
Plug("tpope/vim-eunuch") ------ Unix helpers
Plug("hoschi/yode-nvim")


-- Telescope
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-file-browser.nvim")
Plug("nvim-telescope/telescope-live-grep-args.nvim")
Plug("nvim-telescope/telescope-dap.nvim")


-- Treesitter
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("nvim-treesitter/nvim-treesitter-context")


-- Utilities
Plug("numToStr/Comment.nvim")
Plug("akinsho/toggleterm.nvim")
Plug("mbbill/undotree")
Plug("untitled-ai/jupyter_ascending.vim", { ["for"] = { "python" } })
Plug("vimwiki/vimwiki", { ["on"] = { "VimwikiIndex", "VimwikiUISelect" } })
Plug("tpope/vim-dadbod", { ["on"] = { "DB", "DBUI", "DBUIToggle" } })
Plug("kristijanhusak/vim-dadbod-ui", { ["on"] = { "DB", "DBUI", "DBUIToggle" } })
Plug("ThePrimeagen/jvim.nvim", { ["for"] = "json" })
Plug("ellisonleao/carbon-now.nvim")


-- Snippets
Plug("L3MON4D3/LuaSnip")
Plug("rafamadriz/friendly-snippets")
Plug("iurimateus/luasnip-latex-snippets.nvim")
Plug("molleweide/LuaSnip-snippets.nvim")


-- Language Specific
-- Plug("fatih/vim-go", { ["for"] = { "go", "rapid", "gosum" } })
Plug("simrat39/rust-tools.nvim", { ["for"] = { "rust", "toml" } })


-- Debuggers
Plug("mfussenegger/nvim-dap")
Plug("leoluz/nvim-dap-go", { ["for"] = { "go", "rapid", "gosum" } })
Plug("mfussenegger/nvim-dap-python", { ["for"] = { "python" } })
Plug("rcarriga/nvim-dap-ui")
Plug("theHamsta/nvim-dap-virtual-text")

vim.call("plug#end")
