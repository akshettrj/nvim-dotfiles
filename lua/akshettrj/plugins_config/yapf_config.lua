if not pcall(require, "yapf") then
    return
end

require("yapf").setup({
    command = "yapf",
    style = "pep8",
})
