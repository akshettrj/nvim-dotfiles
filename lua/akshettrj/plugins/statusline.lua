local utils = require("akshettrj.utils")

function get_lualine_theme()
  if vim.g.akshettrj_colorscheme == "gruvbox" then
    return "gruvbox_dark"
  else
    return vim.g.akshettrj_colorscheme
  end
end

return {
  "https://github.com/nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = get_lualine_theme(),
      component_separators = {},
      section_separators = { left = "|", right = "|" },
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
      lualine_b = { "branch" },
      lualine_c = { "%=", { "filename", file_status = true }, "diff" },
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
  dependencies = {
    "https://github.com/nvimdev/lspsaga.nvim",
  },
}
