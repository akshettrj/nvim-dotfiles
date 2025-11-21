require("akshettrj.utils")

local hostname = vim.fn.hostname()
if hostname:startswith("akshettrai.jindal") then
  alt_prefix = "A-C"
else
  alt_prefix = "A"
end

return {
  "https://github.com/romgrk/barbar.nvim",
  event = "VeryLazy",
  keys = {
    { "<Tab>",   "<Cmd>BufferNext<CR>",     silent = true, desc = "Go to next buffer" },
    { "<S-Tab>", "<Cmd>BufferPrevious<CR>", silent = true, desc = "Go to previous buffer" },
    { "<" .. alt_prefix .. "-1>",   "<Cmd>BufferGoto 1<CR>",   silent = true, desc = "Go to 1st buffer" },
    { "<" .. alt_prefix .. "-2>",   "<Cmd>BufferGoto 2<CR>",   silent = true, desc = "Go to 2nd buffer" },
    { "<" .. alt_prefix .. "-3>",   "<Cmd>BufferGoto 3<CR>",   silent = true, desc = "Go to 3rd buffer" },
    { "<" .. alt_prefix .. "-4>",   "<Cmd>BufferGoto 4<CR>",   silent = true, desc = "Go to 4th buffer" },
    { "<" .. alt_prefix .. "-5>",   "<Cmd>BufferGoto 5<CR>",   silent = true, desc = "Go to 5th buffer" },
    { "<" .. alt_prefix .. "-6>",   "<Cmd>BufferGoto 6<CR>",   silent = true, desc = "Go to 6th buffer" },
    { "<" .. alt_prefix .. "-7>",   "<Cmd>BufferGoto 7<CR>",   silent = true, desc = "Go to 7th buffer" },
    { "<" .. alt_prefix .. "-8>",   "<Cmd>BufferGoto 8<CR>",   silent = true, desc = "Go to 8th buffer" },
    { "<" .. alt_prefix .. "-9>",   "<Cmd>BufferGoto 9<CR>",   silent = true, desc = "Go to 9th buffer" },
    { "<" .. alt_prefix .. "-0>",   "<Cmd>BufferLast<CR>",     silent = true, desc = "Go to last buffer" },
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = false,
    auto_hide = true,
    tabpages = true,
    closable = true,
    clickable = true,
    exclude_ft = {},
    exclude_name = {},
    icons = {
      buffer_index = true,
      filetype = { enabled = true },
      modified = { button = "●" },
      pinned = { button = "󰐃" },
      inactive = {
        separator = {
          left = "▎"
        },
      },
      separator = {
        left = "▎",
      },
      diagnostics = {
        {
          enabled = true,
          icon = " ",
        }, -- ERROR
        { enabled = true, icon = " " }, -- WARN
        { enabled = false }, -- INFO
        { enabled = true, icon = " " }, -- HINT
      },
      button = "󱎘",
    },
    icon_custom_colors = false,
    insert_at_start = false,
    insert_at_end = true,
    maximum_padding = 1,
    maximum_length = 30,
    semantic_letters = true,
    letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
  },
  dependencies = {
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
  },
}
