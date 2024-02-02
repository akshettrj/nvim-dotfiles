return {
  {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    build = ":TSUpdateSync",
    event = { "VeryLazy" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "python",
          "rust",
          "lua",
          "bash",
          "go",
        },
        ignore_installed = {},
        highlight = {
          enable = true,
          disable = { "vimwiki" },
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = false },
        matchup = { enable = false },
      })
    end,
  },
  {
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    event = { "VeryLazy" },
    config = function()
      require("treesitter-context").setup()
      highlight_settings = {
        underline = true,
        sp = "Grey",
        bg = "Black",
      }
      vim.api.nvim_set_hl(0, "TreesitterContext", highlight_settings)
      vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", highlight_settings)
    end,
    dependencies = {
      "https://github.com/nvim-treesitter/nvim-treesitter",
    }
  }
}
