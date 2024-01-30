local utils = require("akshettrj.utils")

return {
  "https://github.com/nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = vim.g.akshettrj_colorscheme,
      section_separators = {},
      component_separators = { left = "|", right = "|" },
    },
    extensions = {},
    sections = {
      lualine_a = {
        { "mode", lower = true },
        {
          function()
            if utils.is_spell_mode_on() then
              return "󰓆"
            else
              return ""
            end
          end
        },
      },
      lualine_b = { "branch", "diff" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        {
          function()
            local vwc = utils.get_total_visual_words()
            if vwc > 0 then
              return "vwc: " .. vwc
            else
              return ""
            end
          end
        },
        "location",
      },
    },
  },
}
