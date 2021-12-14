require'nvim-treesitter.configs'.setup{
  ensure_installed = "all",
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {'vimwiki'},
    additional_vim_regex_highlighting = false
  },
  indent = {
    enabled = false,
    -- disable = {}
  },
  matchup = {
    enabled = true,
    -- disable = {}
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
}

-- local o = vim.o

-- o.foldmethod = "expr"
-- o.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.cmd[[syntax off]]
