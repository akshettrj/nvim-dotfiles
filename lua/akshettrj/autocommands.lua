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

if pcall(require, "yapf") then
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.py",
        group = cleanup_file_group,
        callback = function()
            vim.cmd [[Yapf]]
        end,
    })
end


highlight_yank_group = vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    group = highlight_yank_group,
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
    end,
})


cursor_line_group = vim.api.nvim_create_augroup("cursor_line", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    group = cursor_line_group,
    callback = function()
        vim.opt_local.cursorline = true
    end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    group = cursor_line_group,
    callback = function()
        vim.opt_local.cursorline = false
    end,
})


file_types_group = vim.api.nvim_create_augroup("file_types", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    group = file_types_group,
    callback = function()
        vim.opt.wrap = false
    end,
})

buf_enter_group = vim.api.nvim_create_augroup("buf_enter", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    group = buf_enter_group,
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
        -- vim.cmd [[ syntax match nonascii "[^\x00-\xFF]" ]]
        -- vim.cmd [[ highlight nonascii guifg=NONE guibg=red ]]
    end,
})
