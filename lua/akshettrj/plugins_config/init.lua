local utils = require("akshettrj.utils")

if utils.is_module_available("nvim-navic") then
    require("akshettrj.plugins_config.navic_config")
end

if utils.is_module_available("bufferline") then
    require("akshettrj.plugins_config.barbar_config")
end

if utils.is_module_available("indent_blankline") then
    require("akshettrj.plugins_config.indent_blankline_config")
end

if utils.is_module_available("lualine") then
    require("akshettrj.plugins_config.lualine_config")
end

if utils.is_module_available("colorful-winsep") then
    require("akshettrj.plugins_config.colorful_winsep_config")
end

if utils.is_module_available("colorizer") then
    require("akshettrj.plugins_config.colorizer_config")
end

if utils.is_module_available("gitsigns") then
    require("akshettrj.plugins_config.gitsigns_config")
end

if utils.is_module_available("telescope") then
    require("akshettrj.plugins_config.telescope_config")
end

if utils.is_module_available("nvim-treesitter") then
    require("akshettrj.plugins_config.treesitter_config")
end

if utils.is_module_available("cmp") then
    require("akshettrj.plugins_config.cmp_config")
end

if utils.is_module_available("toggleterm") then
    require("akshettrj.plugins_config.toggleterm_config")
end

if utils.is_module_available("Comment") then
    require("akshettrj.plugins_config.comment_config")
end

if utils.is_module_available("luasnip") then
    require("akshettrj.plugins_config.luasnip_config")
end

require("akshettrj.plugins_config.jupyter_ascending_config")
require("akshettrj.plugins_config.vimwiki_config")
