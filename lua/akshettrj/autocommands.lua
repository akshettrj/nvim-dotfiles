akshettrj_group = vim.api.nvim_create_augroup("akshettrj_group", { clear = true })

-- Remove extra spaces and newlines at end
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  group = akshettrj_group,
  callback = function()
    local curr_pos = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.cmd([[%s/\n\+%$//e]])
    vim.fn.setpos(".", curr_pos)
  end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = akshettrj_group,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
  end,
})

-- Highlight cursor line in Insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = akshettrj_group,
  callback = function()
    vim.opt_local.cursorline = true
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  group = akshettrj_group,
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

-- Do not wrap HTML files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  group = akshettrj_group,
  callback = function()
    vim.opt.wrap = false
  end,
})

-- Misc settings
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  group = akshettrj_group,
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
