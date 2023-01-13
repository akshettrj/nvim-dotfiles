cleanup_file_group = vim.api.nvim_create_augroup("cleanup_file", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    group = cleanup_file_group,
    callback = function()
        local current_position = vim.fn.getpos(".")

        vim.cmd [[%s/\s\+$//e]]
        vim.cmd [[%s/\n\+\%$//e]]

        vim.fn.setpos(".", current_position)
    end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    group = cleanup_file_group,
    callback = function()
        vim.lsp.buf.format()
    end,
})


highlight_yank_group = vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    group = highlight_yank_group,
    callback = function()
        vim.highlight.on_yank({ higroup="IncSearch", timeout=40 })
    end,
})


vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})


vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.cursorline = true
    end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        vim.opt_local.cursorline = false
    end,
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    callback = function()
        vim.opt.wrap = false
    end,
})
