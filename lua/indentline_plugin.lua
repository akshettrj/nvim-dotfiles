require("indent_blankline").setup {
    char = "»",
    buftype_exclude = {
        "terminal",
        "help"
    },
    show_first_indent_level = false,
    use_treesitter = true,
    show_trailing_blankline_indent = false
}
