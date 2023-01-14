local utils = require("akshettrj.utils")

require("akshettrj.opts")
require("akshettrj.plugins")
require("akshettrj.plugins_config")
require("akshettrj.autocommands")
require("akshettrj.remap")

if utils.is_module_available("gruvbox") then
    require("akshettrj.colorscheme")
end

if utils.is_module_available("lspconfig") then
    require("akshettrj.lsp")
end

if utils.is_module_available("dap") then
    require("akshettrj.dap")
end
