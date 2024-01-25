return {
  {
    -- Git UI
    "https://github.com/tpope/vim-fugitive",
    cmd = "Git",
  },
  {
    "https://github.com/lewis6991/gitsigns.nvim",
    opts = {
      signcolumn = true,
      numhl = true,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 2000,
        follow_files = true,
      },
      attach_to_untracked = false,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
      },
      current_line_blame_formatter_opts = {
        relative_time = true,
      },
      update_debounce = 100,
      max_file_length = 40000,
    },
  },
}
