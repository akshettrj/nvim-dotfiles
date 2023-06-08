vim.g.copilot_no_tab_map = true

vim.g.copilot_filetypes = {
    ["*"] = false,
    rust = true,
    go = true,
    python = true,
}

vim.keymap.set("i", "<C-j>", "copilot#Accept()",
    { silent = true, script = true, expr = true, replace_keycodes = false })
