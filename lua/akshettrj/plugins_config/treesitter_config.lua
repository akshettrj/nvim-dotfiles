if not pcall(require, "nvim-treesitter") then
    return
end

require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    ignore_installed = {},
    highlight = {
        enable = true,
        disable = { "vimwiki" },
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = false },
    matchup = { enable = true },
})
