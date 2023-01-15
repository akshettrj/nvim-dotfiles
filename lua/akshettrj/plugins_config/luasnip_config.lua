if not pcall(require, "luasnip") then
    return
end

local ls = require("luasnip")

if pcall(require, "luasnip-snippets") then
    require("luasnip-snippets").load_snippets()
end

require("luasnip.loaders.from_vscode").lazy_load() -- "rafamadriz/friendly-snippets"

if pcall(require, "luasnip-latex-snippets") then
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
