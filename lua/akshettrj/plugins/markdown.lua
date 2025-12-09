local utils = require("akshettrj.utils")

return {
  {
    "https://github.com/MeanderingProgrammer/markdown.nvim",
    enabled = function()
      return not utils.is_inside_vscode()
    end,
    main = "render-markdown",
    name = "render-markdown",
    opts = {},
    dependencies = {
      "https://github.com/nvim-treesitter/nvim-treesitter",
      "https://github.com/echasnovski/mini.nvim",
    },
  },
}
