--[[
let g:vimwiki_list = [{ 'path': '~/work/notes/vimWiki', 'path_html': '~/work/notes/vimWiki/html' }]

let g:vimwiki_hl_headers = 1 	" Color the headings
let g:vimwiki_hl_cb_checked = 2	" Highligh completed TODOs
let g:vimwiki_url_maxsave = 0
]]
local g = vim.g

-- Set dir to save notes
g.vimwiki_list = {
  {
    name = 'Global Notes',
    path = '~/work/notes/vimWiki',
    path_html = '~/work/notes/vimWiki/html',
    syntax = 'default',
    ext = '.wiki',
    auto_toc = 1,
    auto_tags = 1,
    auto_export = 0,
    links_space_char = '_',
    maxhi = 1,
  }, {
    name = 'IIIT Notes 3.1',
    path = '~/iiith/notes/',
    path_html = '~/iiith/notes/html',
    template_path = '~/iiith/notes/templates',
    template_default = 'def_template',
    template_ext = '.html',
    -- custom_wiki2html_arg = '-b "https://akshettrj.github.io/iiith-notes/"',
    nested_syntaxes = {
      python = 'python',
      cpp = 'cpp',
      c = 'c',
      sh = 'zsh',
      bash = 'zsh',
      zsh = 'zsh',
      tex = 'tex'
    },
    syntax = 'default',
    auto_tags = 1,
    ext = '.wiki',
    auto_export = 1,
    auto_toc = 1,
    links_space_char = '_',
    maxhi = 1,
  }
}

-- Highlight the headings
g.vimwiki_hl_headers = 1
-- Highlight completed things
g.vimwiki_hl_cb_checked = 2
g.vimwiki_url_maxsave = 0
g.vimwiki_auto_writeall = 1

g.vimwiki_html_header_numbering = 2
g.vimwiki_html_header_numbering_sym = ')'

vim.cmd[[
au ColorScheme * highlight VimwikiHeader1 guifg=#b57419 gui=bold
au ColorScheme * highlight VimwikiHeader2 guifg=#38b519 gui=bold
au ColorScheme * highlight VimwikiHeader3 guifg=#1984b5 gui=bold
au ColorScheme * highlight VimwikiHeader4 guifg=#943537 gui=bold
au ColorScheme * highlight VimwikiLink guifg=#15dde8 gui=underline
]]
