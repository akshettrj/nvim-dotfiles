local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Requirements
    "https://github.com/nvim-tree/nvim-web-devicons",
    {
        "https://github.com/nvim-lua/popup.nvim",
        lazy = true,
        dependencies = {
            {
                "https://github.com/nvim-lua/plenary.nvim",
                lazy = true,
            },
        },
    },

    -- Colorschemes
    {
        "https://github.com/ellisonleao/gruvbox.nvim",
        lazy = true,
        priority = 1000,
    },

    -- LSP and formatter
    "https://github.com/neovim/nvim-lspconfig",
    {
        "https://github.com/onsails/lspkind.nvim",
        lazy = true,
        dependencies = {
            "https://github.com/neovim/nvim-lspconfig",
        },
    },
    {
        "https://github.com/williamboman/mason.nvim",
        lazy = true,
        dependencies = {
            "https://github.com/neovim/nvim-lspconfig",
        },
    },
    {
        "https://github.com/ray-x/lsp_signature.nvim",
        lazy = true,
        dependencies = {
            "https://github.com/neovim/nvim-lspconfig",
        },
    },
    {
        "https://github.com/SmiteshP/nvim-navic",
        lazy = true,
        dependencies = {
            "https://github.com/neovim/nvim-lspconfig",
        },
    },
    {
        "https://github.com/j-hui/fidget.nvim",
        lazy = true,
        tag = "legacy",
        dependencies = {
            "https://github.com/neovim/nvim-lspconfig",
        },
        event = "LspAttach",
        config = function()
            require("akshettrj.plugins_config.fidget_config")
        end,
    },
    {
        "https://github.com/amirali/yapf.nvim",
        lazy = true,
        ft = { "python" },
        dependencies = {
            "https://github.com/nvim-lua/plenary.nvim",
        },
        config = function()
            require("akshettrj.plugins_config.yapf_config")
        end,
    },
    -- Completion
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-nvim-lua",
    "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/hrsh7th/cmp-buffer",
    { "https://github.com/kdheepak/cmp-latex-symbols",          ft = { "tex" } },
    "https://github.com/saadparwaiz1/cmp_luasnip",
    "https://github.com/hrsh7th/nvim-cmp",
    -- UI
    {
        "https://github.com/romgrk/barbar.nvim",
        dependencies = {
            "https://github.com/lewis6991/gitsigns.nvim",
            "https://github.com/nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("akshettrj.plugins_config.barbar_config")
        end,
    },
    { "https://github.com/lukas-reineke/indent-blankline.nvim", tag = "v2.20.8" },
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/petertriho/nvim-scrollbar",
    {
        "https://github.com/gorbit99/codewindow.nvim",
        lazy = true,
        keys = {
            "<leader>mo",
            "<leader>mf",
            "<leader>mc",
            "<leader>mm",
        },
        config = function()
            require("akshettrj.plugins_config.codewindow_config")
        end
    },
    -- Colors & Highlighting
    {
        "https://github.com/nvim-zh/colorful-winsep.nvim",
        event = { "WinNew" },
        lazy = true,
        config = function()
            require("akshettrj.plugins_config.colorful_winsep_config")
        end,

    },
    {
        "https://github.com/norcalli/nvim-colorizer.lua",
        lazy = true,
        cmd = {
            "ColorizerAttachToBuffer",
            "ColorizerDetachFromBuffer",
            "ColorizerReloadAllBuffers",
            "ColorizerToggle",
        },
        config = function()
            require("akshettrj.plugins_config.colorizer_config")
        end,
    },
    -- Productivity
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/tpope/vim-sleuth", ------ Indentation configuration
    "https://github.com/tpope/vim-surround", ---- Brackets and stuff
    "https://github.com/tpope/vim-repeat", ------ Repeat custom stuff with .
    { "https://github.com/tpope/vim-fugitive",              cmd = "Git" }, ---- Git
    "https://github.com/tpope/vim-eunuch", ------ Unix helpers
    {
        "https://github.com/hoschi/yode-nvim",
        lazy = true,
        cmd = {
            "YodeCreateSeditorFloating",
            "YodeCreateSeditorReplace",
            "YodeBufferDelete",
            "YodeGoToAlternateBuffer",
            "YodeCloneCurrentIntoFloat",
            "YodeFloatToMainWindow",
            "YodeFormatWrite",
            "YodeRunInFile",
        },
        dependencies = {
            "https://github.com/nvim-lua/plenary.nvim",
        },
        config = function()
            require("akshettrj.plugins_config.yode_nvim_config")
        end,
    },
    -- Plug("https://github.com/chrisgrieser/nvim-spider")


    -- Telescope
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-telescope/telescope-file-browser.nvim",
    "https://github.com/nvim-telescope/telescope-live-grep-args.nvim",
    "https://github.com/nvim-telescope/telescope-dap.nvim",
    -- Treesitter
    { "https://github.com/nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    -- Utilities
    {
        "https://github.com/numToStr/Comment.nvim",
        lazy = false,
    },
    {
        "https://github.com/akinsho/toggleterm.nvim",
        lazy = true,
        keys = { [[\\]] },
        config = function()
            require("akshettrj.plugins_config.toggleterm_config")
        end,
    },
    "https://github.com/mbbill/undotree",
    { "https://github.com/untitled-ai/jupyter_ascending.vim", ft = { "python" } },
    {
        "https://github.com/vimwiki/vimwiki",
        cmd = { "VimwikiIndex", "VimwikiUISelect" },
    },
    {
        "https://github.com/kristijanhusak/vim-dadbod-ui",
        dependencies = {
            {
                "https://github.com/tpope/vim-dadbod",
                lazy = true,
            },
            {
                "https://github.com/kristijanhusak/vim-dadbod-completion",
                ft = { "sql", "mysql", "plsql" },
                lazy = true,
            },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },

    {
        "https://github.com/ThePrimeagen/jvim.nvim",
        lazy = true,
        ft = "json",
    },
    {
        "https://github.com/ellisonleao/carbon-now.nvim",
        lazy = true,
        cmd = "CarbonNow",
        config = function()
            require("akshettrj.plugins_config.carbon_now_config")
        end,
    },
    {
        "https://github.com/github/copilot.vim",
        lazy = true,
        ft = { "rust", "go", "python" },
        keys = { "<C-j>" },
        init = function()
            vim.g.copilot_no_tab_map = true

            vim.g.copilot_filetypes = {
                ["*"] = false,
                rust = true,
                go = true,
                python = true,
            }

            vim.keymap.set("i", "<C-j>", "copilot#Accept()",
                { silent = true, script = true, expr = true, replace_keycodes = false })
        end,
    },
    {
        "https://github.com/cshuaimin/ssr.nvim/",
        lazy = true,
        keys = { "<leader>sr" },
        config = function()
            require("akshettrj.plugins_config.ssr_config")
        end,
    },
    -- Snippets
    {
        "https://github.com/L3MON4D3/LuaSnip",
        dependencies = {
            "https://github.com/rafamadriz/friendly-snippets",
            "https://github.com/iurimateus/luasnip-latex-snippets.nvim",
            "https://github.com/molleweide/LuaSnip-snippets.nvim",
        },
        build = "make install_jsregexp",
    },
    -- Language Specific
    -- Plug("fatih/vim-go", { ["for"] = { "go", "rapid", "gosum" } })
    {
        "https://github.com/simrat39/rust-tools.nvim",
        lazy = true,
        ft = { "rust", "toml" },
    },
    {
        "https://github.com/Omer/vim-sparql",
        lazy = true,
        ft = { "sparql" },
    },
    {
        "https://github.com/camnw/lf-vim",
        lazy = true,
        ft = { "lf", "lfrc" },
    },
    -- Debuggers
    {
        "https://github.com/leoluz/nvim-dap-go",
        lazy = true,
        ft = { "go", "rapid", "gosum" },
        dependencies = {
            { "https://github.com/mfussenegger/nvim-dap" },
        },
    },
    {
        "https://github.com/mfussenegger/nvim-dap-python",
        lazy = true,
        ft = { "python" },
        dependencies = {
            { "https://github.com/mfussenegger/nvim-dap" },
        },
    },
    {
        "https://github.com/rcarriga/nvim-dap-ui",
        lazy = true,
        dependencies = {
            { "https://github.com/mfussenegger/nvim-dap" },
        },
    },
    {
        "https://github.com/theHamsta/nvim-dap-virtual-text",
        lazy = true,
        dependencies = {
            { "https://github.com/mfussenegger/nvim-dap" },
        },
    },
})
