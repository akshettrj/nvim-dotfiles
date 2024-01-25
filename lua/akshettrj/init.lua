vim.g.akshettrj_colorscheme = "gruvbox"
-- vim.g.akshettrj_colorscheme = "rose-pine"
-- vim.g.akshettrj_colorscheme = "rose-pine-main"
-- vim.g.akshettrj_colorscheme = "rose-pine-moon"
-- vim.g.akshettrj_colorscheme = "rose-pine-dawn"

require("akshettrj.opts")
require("akshettrj.autocommands")
require("akshettrj.lazy")
require("akshettrj.keybinds")

vim.cmd("colorscheme " .. vim.g.akshettrj_colorscheme)
