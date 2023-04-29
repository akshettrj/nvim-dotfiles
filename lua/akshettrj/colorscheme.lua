local loaded, gruvbox = pcall(require, "gruvbox")
if not loaded then
    return
end

gruvbox.setup({
    undercurl            = true,
    underline            = true,
    bold                 = true,
    italic               = {
        strings = false,
        operators = true,
        comments = true,
        folds = true,
    },
    strikethrough        = true,
    invert_selection     = false,
    invert_signs         = false,
    invert_tablines      = false,
    invert_intend_guides = false,
    inverse              = true, -- invert bg for search, diffs, statuslines and errors
    contrast             = "hard", -- can be "hard", "soft" or empty string
    overrides            = {},
})

vim.cmd.colorscheme("gruvbox")
