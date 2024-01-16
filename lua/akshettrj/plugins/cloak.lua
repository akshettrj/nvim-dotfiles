return {
  "https://github.com/laytan/cloak.nvim",
  opts = {
    enabled = true,
    cloak_character = '*',
    highlight_group = 'Comment',
    cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
    try_all_patterns = true,
    patterns = {
      {
        file_pattern = { ".env*", "config.*" },
        cloak_pattern = { "=.+", ":.+", "-.+" },
        replace = nil,
      },
    },
  },
}
