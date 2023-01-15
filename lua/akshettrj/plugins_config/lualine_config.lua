if not pcall(require, "lualine") then
    return
end

local utils = require("akshettrj.utils")

local lualine_a = {
    { "mode", lower = true },
    { utils.spell_mode_on },
}

local lualine_b = { "branch", "diff" }

local lualine_c = { "filename" }

local lualine_x = { "encoding", "fileformat", "filetype" }

local lualine_y = { "progress" }

local lualine_z = {
    { utils.total_visual_words },
    "location",
}

if pcall(require, "nvim-navic") then
    local navic = require("nvim-navic")
    table.insert(lualine_c, { navic.get_location, cond = navic.is_available })
end

require("lualine").setup({
    options = {
        theme = "gruvbox",
        section_separators = {},
        component_separators = { left = "|", right = "|" },
    },
    extensions = {},
    sections = {
        lualine_a = lualine_a,
        lualine_b = lualine_b,
        lualine_c = lualine_c,
        lualine_x = lualine_x,
        lualine_y = lualine_y,
        lualine_z = lualine_z,
    }
})
