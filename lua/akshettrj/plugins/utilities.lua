return {
  {
    "https://github.com/folke/which-key.nvim",
    event = "VeryLazy",
    module = "which-key",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
    config = true,
  },
}
