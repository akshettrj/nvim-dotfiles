require'nvim-treesitter.configs'.setup{
  ensure_installed = "all",
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {'vimwiki'},
    additional_vim_regex_highlighting = false
  },
  indent = {
    enabled = true,
    disable = {}
  },

}
