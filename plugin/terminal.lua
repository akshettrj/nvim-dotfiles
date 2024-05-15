-- Easy escape from terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Don't want relative line numbers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
  end,
})
