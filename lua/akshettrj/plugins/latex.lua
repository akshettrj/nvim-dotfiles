return {
  "https://github.com/lervag/vimtex",
  ft = { "tex" },
  init = function()
    local hostname = vim.fn.hostname()
    if hostname:startswith("akshettrai.jindal") then
      vim.g.vimtex_view_method = "mupdf"
    else
      vim.g.vimtex_view_method = "zathura"
    end
  end
}
