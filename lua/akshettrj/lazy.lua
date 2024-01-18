local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if (vim.uv ~= nil) and (not vim.uv.fs_stat(lazypath)) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("akshettrj.plugins", {
  ui = {
    border = "single",
    title = "Lazy.nvim",
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  profiling = {
    loader = true,
    require = true,
  },
})
