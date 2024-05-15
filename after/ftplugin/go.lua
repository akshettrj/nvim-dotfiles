vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    group = vim.api.nvim_create_augroup("go-lsp-autofmt", { clear = true }),
    callback = function()
        vim.lsp.buf.format()
    end,
})
