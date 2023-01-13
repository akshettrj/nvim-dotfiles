require("bufferline").setup({
    animation = false,
    auto_hide = false,
    tabpages = true,
    closable = true,
    clickable = true,
    diagnostics = {
        {enabled = true, icon = "ﬀ"}, -- ERROR
        {enabled = false}, -- WARN
        {enabled = false}, -- INFO
        {enabled = true},  -- HINT
    },
    exclude_ft = {},
    exclude_name = {},
    icons = true,
    icon_custom_colors = false,
    icon_separator_active = "▎",
    icon_separator_inactive = "▎",
    icon_close_tab = "",
    icon_close_tab_modified = "●",
    icon_pinned = "車",
    insert_at_start = false,
    insert_at_end = true,
    maximum_padding = 1,
    maximum_length = 30,
    semantic_letters = true,
    letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
})

-- Navigation
vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { silent = true })
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { silent = true })
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { silent = true })
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { silent = true })
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { silent = true })
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { silent = true })
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { silent = true })
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { silent = true })
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { silent = true })
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", { silent = true })

-- Utils
vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", { silent = true})
