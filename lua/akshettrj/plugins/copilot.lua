return {
  {
    "https://github.com/github/copilot.vim",
    cmd = { "Copilot" },
    init = function()
      vim.g.copilot_filetypes = {
        ["*"] = false,
        lua = true,
      }
      vim.g.copilot_enabled = false
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_no_maps = true
    end,
  },
}
