akshettrj_group = vim.api.nvim_create_augroup("akshettrj_group", { clear = true })

-- Remove extra spaces and newlines at end
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  group = akshettrj_group,
  callback = function()
    local curr_pos = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])  -- Clean extra whitespaces at the end
    -- vim.cmd([[%s/\n\+%$//e]]) -- Clean extra lines at the end
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

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  group = akshettrj_group,
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })

    -- Fix statusline colors
    vim.api.nvim_set_hl(0, "StatusLine", {reverse = false})
    vim.api.nvim_set_hl(0, "StatusLineNC", {reverse = false})
    vim.api.nvim_set_hl(0, "Winbar", {reverse = false})
    vim.api.nvim_set_hl(0, "WinbarNC", {reverse = false})
  end
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = akshettrj_group,
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = akshettrj_group,
  callback = function()
    vim.opt.relativenumber = true
  end,
})

local ns = vim.api.nvim_create_namespace('my.terminal.prompt')
vim.api.nvim_create_autocmd("TermRequest", {
  callback = function(args)
    if string.match(args.data.sequence, "^\027]133;A") then
      local lnum = args.data.cursor[1]
      vim.api.nvim_buf_set_extmark(args.buf, ns, lnum - 1, 0, {
        sign_text = "▶",
        sign_hl_group = "SpecialChar",
      })
    end
  end,
})
vim.api.nvim_create_autocmd("TermOpen", {
  command = "setlocal signcolumn=auto",
})

