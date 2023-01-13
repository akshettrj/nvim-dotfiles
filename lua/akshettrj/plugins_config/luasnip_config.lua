local utils = require("akshettrj.utils")
local ls = require("luasnip")

if utils.is_module_available("luasnip-snippets") then
    require("luasnip-snippets").load_snippets()
end

require("luasnip.loaders.from_vscode").lazy_load() -- "rafamadriz/friendly-snippets"

if utils.is_module_available("luasnip-latex-snippets") then
    require("luasnip-latex-snippets").setup()
end

ls.config.setup({
    history = true,
    update_events = "TextChanged,TextChangedI",
    region_check_events = "CursorHold,CursorHoldI,InsertEnter",
    delete_check_events = "InsertLeave",
    enable_autosnippets = nil,
    ext_opts = nil,
})
