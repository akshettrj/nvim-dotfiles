return {
  "https://github.com/vimwiki/vimwiki",
  cmd = { "VimwikiIndex", "VimwikiUISelect" },
  init = function()
    vim.g.vimwiki_hl_headers = 1
    vim.g.vimwiki_hl_cb_checked = 2
    vim.g.vimwiki_url_maxsave = 0
    vim.g.vimwiki_html_header_numbering = 0
    vim.g.vimwiki_valid_html_tags = "b,i,s,u,sub,sup,kbd,br,hr,div"

    vimwiki_list = {
      {
        name = "General Notes",
        path = "~/work/vimwiki_notes/general_notes",
        path_html = "~/work/vimwiki_notes/html/general_notes",
        template_path = "~/work/vimwiki_notes/templates",
        template_default = "def_template",
        template_ext = ".html",
        ext = ".wiki",
      },
      {
        name = "IIIT Notes",
        path = "~/work/vimwiki_notes/iiit_notes",
        path_html = "~/work/vimwiki_notes/html/iiit_notes",
        template_path = "~/work/vimwiki_notes/templates",
        template_default = "def_template",
        template_ext = ".html",
        ext = ".wiki",
      },
      {
        name = "Programming Notes",
        path = "~/work/vimwiki_notes/programming_notes",
        path_html = "~/work/vimwiki_notes/html/programming_notes",
        template_path = "~/work/vimwiki_notes/templates",
        template_default = "def_template",
        template_ext = ".html",
        ext = ".wiki",
      },
    }

    for _, v in ipairs(vimwiki_list) do
      v.syntax = "default"
      v.nested_syntaxes = {
        python = "python",
        cpp = "cpp",
        c = "c",
        sh = "zsh",
        bash = "zsh",
        zsh = "zsh",
        tex = "tex",
        json = "json",
        go = "go",
        sparql = "sparql",
      }

      v.auto_toc = 1
      v.auto_tags = 1
      v.auto_export = 1
      v.links_space_char = "_"
      v.links_maxhi = 1
    end

    vim.g.vimwiki_list = vimwiki_list
  end,
}
