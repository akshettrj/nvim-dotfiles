vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    group = vim.api.nvim_create_augroup("rust-lsp-autofmt", { clear = true }),
    callback = function()
        vim.lsp.buf.format()
    end,
})
