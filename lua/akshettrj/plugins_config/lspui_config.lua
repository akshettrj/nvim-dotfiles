if not pcall(require, "LspUI") then
    return
end

-- Default config
require("LspUI").setup({
    lightbulb = {
        enable = true, -- close by default
        command_enable = true, -- close by default, this switch does not have to be turned on, this command has no effect
        icon = "💡",
    },
    code_action = {
        enable = true,
        command_enable = true,
        icon = "💡",
        keybind = {
            exec = "<CR>",
            prev = "k",
            next = "j",
            quit = "q",
        },
    },
    hover = {
        enable = true,
        command_enable = true,
        keybind = {
            prev = "p",
            next = "n",
            quit = "q",
        },
    },
    rename = {
        enable = true,
        command_enable = true,
        auto_select = true, -- whether select all automatically
        keybind = {
            change = "<CR>",
            quit = "<ESC>",
        },
    },
    diagnostic = {
        enable = true,
        command_enable = true,
        icons = {
            Error = " ",
            Warn = " ",
            Info = " ",
            Hint = " ",
        },
    },
    peek_definition = {
        enable = false, -- close by default
        command_enable = true,
        keybind = {
            edit = "op",
            vsplit = "ov",
            split = "os",
            quit = "q",
        },
    },
})
