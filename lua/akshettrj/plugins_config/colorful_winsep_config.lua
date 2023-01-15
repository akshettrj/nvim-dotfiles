if not pcall(require, "colorful-winsep") then
    return
end

require("colorful-winsep").setup({
    -- highlight = {
    --     bg = "#16161E",
    --     fg = "#1F3442",
    -- },
    interval = 30,
    no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
    symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
    close_event = function()
    end,
    create_event = function()
    end,
})
