local utils = require("akshettrj.utils")

return {
  {
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    enabled = function()
      return not utils.is_inside_vscode()
    end,
    main = "ibl",
    events = { "VeryLazy" },
    config = function()
      local ibl = require("ibl")
      local hooks = require("ibl.hooks")

      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#fb4934" })     -- red
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#fabd2f" })  -- yellow
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#83a598" })    -- blue (muted)
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fe8019" })  -- orange
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b8bb26" })   -- green
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#d3869b" })  -- purple
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#8ec07c" })    -- aqua
      end)

      ibl.setup({
        enabled = true,
        viewport_buffer = { min = 30 },
        indent = {
          smart_indent_cap = true,
          highlight = highlight,
          char = "│",
        },
        whitespace = {
          remove_blankline_trail = true,
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = true,
        },
      })
    end,
  },
}
