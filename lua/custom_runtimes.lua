local custom_runtimes = {
  "~/work/neovim/ts-manipulator.nvim/main",
  "~/work/neovim/nvimwiki/nvimwiki/main"
}

for _, runtime in ipairs(custom_runtimes) do
  vim.cmd([[set rtp+=]]..runtime)
end
