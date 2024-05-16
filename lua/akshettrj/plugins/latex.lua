return {
  "https://github.com/lervag/vimtex",
  ft = { "tex" },
  init = function()
    vim.g.vimtex_view_method = "zathura"
  end
}
