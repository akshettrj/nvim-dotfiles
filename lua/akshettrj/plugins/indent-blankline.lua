return {
  {
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    events = { "VeryLazy" },
    opts = {
      enabled = true,
      viewport_buffer = { min = 30 },
      indent = {
        smart_indent_cap = true,
      },
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = true,
      },
    },
  },
}
