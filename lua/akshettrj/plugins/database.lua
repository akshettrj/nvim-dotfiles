return {
  {
    "https://github.com/tpope/vim-dadbod",
    init = function()
      vim.g.dadbod_manage_dbext = 1
    end,
    cmd = { "DB" },
  },
  {
    "https://github.com/kristijanhusak/vim-dadbod-ui",
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_auto_execute_table_helpers = 1
    end,
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    dependencies = {
      "https://github.com/tpope/vim-dadbod",
      "https://github.com/kristijanhusak/vim-dadbod-completion",
    },
  },
  {
    "https://github.com/kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql" },
  },
}
