return {
  "https://github.com/lmburns/lf.nvim",
  keys = {
    { "<A-o>", "<Cmd>Lf<CR>", silent = true, desc = "Open LF file manager" },
  },
  config = function ()
    require("lf").setup({
      escape_quit = false,
      border = "rounded",
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "LfTermEnter",
      callback = function (a)
        vim.api.nvim_buf_set_keymap(a.buf, "t", "q", "q", {nowait = true})
        vim.api.nvim_buf_set_keymap(a.buf, "t", "<Esc>", "<Esc>", {nowait = true})
      end
    })
  end,
  dependencies = {
    "https://github.com/akinsho/toggleterm.nvim",
  },
}
