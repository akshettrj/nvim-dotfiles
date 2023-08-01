local Plug = vim.fn["plug#"]

vim.call("plug#begin")


-- Requirements
Plug("https://github.com/nvim-tree/nvim-web-devicons")
Plug("https://github.com/nvim-lua/popup.nvim")
Plug("https://github.com/nvim-lua/plenary.nvim")


-- Pets roaming around (doesn't work currently due to hologram.nvim)
-- Plug("https://github.com/edluffy/hologram.nvim")
-- Plug("https://github.com/MunifTanjim/nui.nvim")
-- Plug("https://github.com/giusgad/pets.nvim")


-- Colorschemes
Plug("https://github.com/ellisonleao/gruvbox.nvim", { ["on"] = "colorscheme" })
Plug("https://github.com/olimorris/onedarkpro.nvim")


-- LSP and formatter
Plug("https://github.com/neovim/nvim-lspconfig")
Plug("https://github.com/onsails/lspkind.nvim")
Plug("https://github.com/williamboman/mason.nvim")
Plug("https://github.com/ray-x/lsp_signature.nvim")
Plug("https://github.com/SmiteshP/nvim-navic")
Plug("https://github.com/j-hui/fidget.nvim", { ["tag"] = "legacy" })
Plug("https://github.com/amirali/yapf.nvim", { ["for"] = { "python" } })


-- Completion
Plug("https://github.com/hrsh7th/cmp-nvim-lsp")
Plug("https://github.com/hrsh7th/cmp-nvim-lua")
Plug("https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol")
Plug("https://github.com/hrsh7th/cmp-path")
Plug("https://github.com/hrsh7th/cmp-buffer")
Plug("https://github.com/kdheepak/cmp-latex-symbols", { ["for"] = { "tex" } })
Plug("https://github.com/saadparwaiz1/cmp_luasnip")
Plug("https://github.com/hrsh7th/nvim-cmp")

-- UI
Plug("https://github.com/romgrk/barbar.nvim")
Plug("https://github.com/lukas-reineke/indent-blankline.nvim")
Plug("https://github.com/nvim-lualine/lualine.nvim")
Plug("https://github.com/petertriho/nvim-scrollbar")
Plug("https://github.com/gorbit99/codewindow.nvim")
Plug("https://github.com/tiagovla/scope.nvim")


-- Colors & Highlighting
Plug("https://github.com/nvim-zh/colorful-winsep.nvim")
Plug("https://github.com/norcalli/nvim-colorizer.lua")


-- Productivity
Plug("https://github.com/lewis6991/gitsigns.nvim")
Plug("https://github.com/tpope/vim-sleuth") ------ Indentation configuration
Plug("https://github.com/tpope/vim-surround") ---- Brackets and stuff
Plug("https://github.com/tpope/vim-repeat") ------ Repeat custom stuff with .
Plug("https://github.com/tpope/vim-fugitive", { ["on"] = "Git" }) ---- Git
Plug("https://github.com/tpope/vim-eunuch") ------ Unix helpers
Plug("https://github.com/hoschi/yode-nvim")
Plug("https://github.com/willothy/flatten.nvim")
-- Plug("https://github.com/chrisgrieser/nvim-spider")


-- Telescope
Plug("https://github.com/nvim-telescope/telescope.nvim")
Plug("https://github.com/nvim-telescope/telescope-file-browser.nvim")
Plug("https://github.com/nvim-telescope/telescope-live-grep-args.nvim")
Plug("https://github.com/nvim-telescope/telescope-dap.nvim")


-- Treesitter
Plug("https://github.com/nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("https://github.com/nvim-treesitter/nvim-treesitter-context")


-- Utilities
Plug("https://github.com/numToStr/Comment.nvim")
Plug("https://github.com/akinsho/toggleterm.nvim")
Plug("https://github.com/mbbill/undotree")
Plug("https://github.com/untitled-ai/jupyter_ascending.vim", { ["for"] = { "python" } })
Plug("https://github.com/vimwiki/vimwiki", { ["on"] = { "VimwikiIndex", "VimwikiUISelect" } })
Plug("https://github.com/tpope/vim-dadbod", { ["on"] = { "DB", "DBUI", "DBUIToggle" } })
Plug(
    "https://github.com/kristijanhusak/vim-dadbod-ui",
    { ["on"] = { "DB", "DBUI", "DBUIToggle" } }
)
Plug("https://github.com/ThePrimeagen/jvim.nvim", { ["for"] = "json" })
Plug("https://github.com/ellisonleao/carbon-now.nvim")
Plug("https://github.com/github/copilot.vim")
Plug("https://github.com/cshuaimin/ssr.nvim/")


-- Snippets
Plug("https://github.com/L3MON4D3/LuaSnip")
Plug("https://github.com/rafamadriz/friendly-snippets")
Plug("https://github.com/iurimateus/luasnip-latex-snippets.nvim")
Plug("https://github.com/molleweide/LuaSnip-snippets.nvim")


-- Language Specific
-- Plug("fatih/vim-go", { ["for"] = { "go", "rapid", "gosum" } })
Plug("https://github.com/simrat39/rust-tools.nvim", { ["for"] = { "rust", "toml" } })
Plug("https://github.com/Omer/vim-sparql")
Plug("https://github.com/camnw/lf-vim")


-- Debuggers
Plug("https://github.com/mfussenegger/nvim-dap")
Plug("https://github.com/leoluz/nvim-dap-go", { ["for"] = { "go", "rapid", "gosum" } })
Plug("https://github.com/mfussenegger/nvim-dap-python", { ["for"] = { "python" } })
Plug("https://github.com/rcarriga/nvim-dap-ui")
Plug("https://github.com/theHamsta/nvim-dap-virtual-text")

vim.call("plug#end")
