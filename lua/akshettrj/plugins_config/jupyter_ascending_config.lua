jupyter_ascending_group = vim.api.nvim_create_augroup("jupyter_bindings", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.py",
    group = jupyter_ascending_group,
    callback = function()
        vim.keymap.set("n", "<leader><leader>w", function()
            vim.fn["jupyter_ascending#sync"]()
        end)
        vim.keymap.set("n", "<leader><leader>x", "<Plug>(JupyterExecute)")
        vim.keymap.set("n", "<leader><leader>X", "<Plug>(JupyterExecuteAll)")
    end,
})
