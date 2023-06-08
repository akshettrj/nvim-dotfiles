vim.g.vimwiki_hl_headers = 1
vim.g.vimwiki_hl_cb_checked = 2
vim.g.vimwiki_url_maxsave = 0
vim.g.vimwiki_html_header_numbering = 0
vim.g.vimwiki_valid_html_tags = "b,i,s,u,sub,sup,kbd,br,hr,div"

vim.g.vimwiki_list = {
    {
        name = "General Notes",
        path = "~/work/vimwiki_notes/general_notes",
        path_html = "~/work/vimwiki_notes/html/general_notes",
        template_path = "~/work/vimwiki_notes/templates",
        template_default = "def_template",
        template_ext = ".html",
        nested_syntaxes = {
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
        },
        syntax = "default",
        ext = ".wiki",
        auto_toc = 1,
        auto_tags = 1,
        auto_export = 1,
        links_space_char = "_",
        maxhi = 1,
    },
    {
        name = "IIIT Notes",
        path = "~/work/vimwiki_notes/iiit_notes",
        path_html = "~/work/vimwiki_notes/html/iiit_notes",
        template_path = "~/work/vimwiki_notes/templates",
        template_default = "def_template",
        template_ext = ".html",
        nested_syntaxes = {
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
        },
        syntax = "default",
        auto_tags = 1,
        ext = ".wiki",
        auto_toc = 1,
        auto_export = 1,
        links_space_char = "_",
        maxhi = 1,
    },
    {
        name = "Programming Notes",
        path = "~/work/vimwiki_notes/programming_notes",
        path_html = "~/work/vimwiki_notes/html/programming_notes",
        template_path = "~/work/vimwiki_notes/templates",
        template_default = "def_template",
        template_ext = ".html",
        nested_syntaxes = {
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
        },
        syntax = "default",
        auto_tags = 1,
        ext = ".wiki",
        auto_toc = 1,
        auto_export = 1,
        links_space_char = "_",
        maxhi = 1,
    },
}
