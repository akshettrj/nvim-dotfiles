vim.opt.number = true
vim.opt.inccommand = "split"
vim.opt.relativenumber = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.foldmarker = { "<<<", ">>>" }
vim.opt.foldmethod = "marker"
vim.opt.title = true
vim.opt.showmode = false
vim.opt.virtualedit = "block"
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.winbar = "%=%m %f"
vim.opt.termguicolors = true
vim.opt_global.termguicolors = true
vim.opt.list = true
vim.opt.fillchars = { eob = " " }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 10

if vim.g.started_by_firenvim == true then
  vim.opt_global.laststatus = 0
else
  vim.opt_global.laststatus = 2
end
