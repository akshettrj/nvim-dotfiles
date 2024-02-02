return {
  {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
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
    dependencies = {
      "https://github.com/nvim-treesitter/nvim-treesitter",
    }
  }
}
