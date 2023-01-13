require("gitsigns").setup {
    signs = {
        add = {
            hl = "GitSignsAdd",
            text = "│",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn"
        },
        change = {
            hl = "GitSignsChange",
            text = "│",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn"
        },
        delete = {
            hl = "GitSignsDelete",
            text = "-",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn"
        },
        topdelete = {
            hl = "GitSignsDelete",
            text = "‾",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn"
        },
        changedelete = {
            hl = "GitSignsChange",
            text = "~",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn"
        },
    },
    signcolumn = true,
    numhl = true,
    linehl = false,
    word_diff = false,
    keymaps = {
        noremap = true,
        ["n <Leader>hb"] = [[ <Cmd>lua require"gitsigns".blame_line({full=true})<CR> ]],
        ["n <Leader>hs"] = [[ <Cmd>lua require"gitsigns".stage_hunk()<CR> ]],
        ["v <Leader>hs"] = [[ <Cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR> ]],
        ["n <Leader>hu"] = [[ <Cmd>lua require"gitsigns".undo_stage_hunk()<CR> ]],
        ["v <Leader>hr"] = [[ <Cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR> ]],
    },
    watch_gitdir = {
        interval = 2000,
        follow_files = true,
    },
    attach_to_untracked = false,
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
    },
    current_line_blame_formatter_opts = {
        relative_time = true,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
    yadm = {
        enable = false,
    },
}
