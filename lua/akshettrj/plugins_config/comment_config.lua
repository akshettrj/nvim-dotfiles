if not pcall(require, "Comment") then
    return
end

require("Comment").setup({
    padding = true,
    sticky = true,
    ignore = nil,
    mappings = {
        basic = true,
        extra = true,
        extended = false,
    },
    toggler = {
        line = "gcc",
        block = "gbc",
    },
    opleader = {
        line = "gc",
        block = "gb",
    },
    pre_hook = nil,
    post_hook = nil,
})
