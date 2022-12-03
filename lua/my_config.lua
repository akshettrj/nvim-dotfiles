local g = vim.g

local silent_noremap = {
    noremap = true,
    silent = true
}

local function nsnoremap(lhs, rhs)
    vim.api.nvim_set_keymap('n', lhs, rhs, silent_noremap)
end

-- Bufferline
---[[
require('bufferline').setup {
    animation = false,
    auto_hide = false,
    tabpages = true,
    closable = true,
    clickable = true,
    exclude_ft = {},
    exclude_name = {},
    icons = true,
    icon_custom_colors = false,
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',
    insert_at_start = false,
    insert_at_end = true,
    maximum_padding = 1,
    maximum_length = 30,
    semantic_letters = true,
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    -- no_name_title = nil,
}
nsnoremap("<Tab>", "<CMD>BufferNext<CR>")
nsnoremap("<S-Tab>", "<CMD>BufferPrevious<CR>")
--]]


require('scrollbar').setup()
require('scrollbar.handlers.gitsigns').setup()


require('colorful-winsep').setup()

-- Colorizer
---[[
require('colorizer').setup {}
--]]


require('yode-nvim').setup({})


-- Indent
---[[
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
require('indent_blankline').setup {
    -- char = '»',
    buftype_exclude = { 'terminal', 'help' },
    show_first_indent_level = false,
    use_treesitter = true,
    show_trailing_blankline_indent = false,
    show_end_of_line = true,
}
--]]


-- Lualine
---[[
local function spell_mode_on()
    local smo = vim.o.spell
    if (smo == true) then
        return "暈"
    else
        return ""
    end
end

local function total_visual_words()
    local vwc = vim.api.nvim_eval("wordcount()")["visual_words"]
    if (vwc ~= nil) then
        return "wc:" .. vwc
    else
        return ""
    end
end

local navic = require('nvim-navic')

require('lualine').setup {
    options = {
        theme = 'gruvbox',
        section_separators = {},
        component_separators = { left = '|', right = '|' },
    },
    extensions = {},
    sections = {
        lualine_a = {
            { 'mode', lower = true },
            { spell_mode_on },
        },
        lualine_b = {
            'branch',
            'diff',
        },
        lualine_c = {
            'filename',
            { navic.get_location, cond = navic.is_available },
        },
        lualine_x = {
            'encoding',
            'fileformat',
            'filetype',
        },
        lualine_y = {
            'progress',
        },
        lualine_z = {
            { total_visual_words },
            'location',
        },
    },
}
--]]




-- GitSigns
---[[
require('gitsigns').setup {
    signs = {
        add = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
    signcolumn = true,
    numhl = true,
    linehl = false,
    word_diff = false,
    keymaps = {
        noremap = true,
        ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line({full=true})<CR>',
        ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    },
    watch_gitdir = {
        interval = 2000,
        follow_files = true,
    },
    attach_to_untracked = false,
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
    },
    current_line_blame_formatter_opts = {
        relative_time = true,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
    },
    yadm = {
        enable = false,
    },
}
--]]









-- Telescope
---[[
local ts = require('telescope')
local lga_actions = require('telescope-live-grep-args.actions')
ts.setup {
    defaults = {
        vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column',
            '--smart-case' },
        file_ignore_patterns = {
            'node_modules/.*',
            'venv/.*'
        },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
            },
        },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
        },
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                },
            },
        },
    },
}

nsnoremap('<leader>fR', '<CMD>lua require("telescope.builtin").resume()<CR>')
nsnoremap('<leader>fe',
    '<CMD>lua require("telescope").extensions.file_browser.file_browser({ cwd = vim.fn.expand("%:p:h") })<CR>')
nsnoremap('<leader>fg', '<CMD>lua require("telescope.builtin").git_files{show_untracked = true }<CR>')
nsnoremap('<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>')
nsnoremap('<leader>fl', '<CMD>lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>')
nsnoremap('<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>')
nsnoremap('<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>')
nsnoremap('<leader>fd', '<CMD>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>')
nsnoremap('<leader>fr', '<CMD>lua require("telescope.builtin").lsp_references()<CR>')
nsnoremap('<leader>fE', '<CMD>lua require("telescope.builtin").diagnostics()<CR>')
nsnoremap('<leader>fm', '<CMD>lua require("telescope.builtin").man_pages()<CR>')
nsnoremap('<leader>f*', '<CMD>lua require("telescope.builtin").grep_string()<CR>')
nsnoremap('<leader>fc', '<CMD>lua require("telescope").extensions.file_browser.file_browser({ cwd = "~/.config/" })<CR>')
--]]











-- ToggleTerm
---[[
require('toggleterm').setup {
    size = function(term)
        if term.direction == "horizontal" then
            return 20
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[\\]],
    insert_mappings = false,
    terminal_mappings = true,
    -- on_open = fun(t: Terminal), -- function to run when the terminal opens
    -- on_close = fun(t: Terminal), -- function to run when the terminal closes
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1',
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
}
--]]











-- Compe
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Down>'] = cmp.mapping.select_next_item { behaviour = cmp.SelectBehavior.Select },
        ['<Up>'] = cmp.mapping.select_prev_item { behaviour = cmp.SelectBehavior.Select },
        ['<Right>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
            -- if cmp.visible() then
            --    cmp.select_next_item()
            --    fallback()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif fallback ~= nil then
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(callback)
            -- if cmp.visible() then
            --     cmp.select_prev_item()
            --     fallback()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            elseif callback ~= nil then
                callback()
            end
        end, { 'i', 's' }),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
    },
    sources = {
        { name = 'npm', keyword_length = 4 },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'latex_symbols' },
        { name = 'buffer' },
    },
    experimental = {
        native_menu = false,
        -- ghost_text = true,
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
            vim_item.menu = ({
                npm = "",
                buffer = "﬘",
                nvim_lsp = "",
                luasnip = "",
                nvim_lua = "",
                emoji = "ﲃ",
                latex_symbols = "",
                treesitter = "滑",
                path = "",
                zsh = "",
                spell = "暈",
                rg = "縷",
            })[entry.source.name]
            return vim_item
        end,
    }
}






-- Treesitter
---[[
require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    ignore_install = {
        'phpdoc',
    },
    highlight = {
        enable = true,
        disable = { 'vimwiki' },
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = false },
    matchup = { enable = true },
    markid = { enable = true },
}

require('treesitter-context').setup {
    enable = true,
}
--]]





-- Comment.nvim
---[[
require('Comment').setup {
    padding = true,
    sticky = true,
    ignore = nil,
    mappings = {
        basic = true,
        extra = true,
        extended = false,
    },
    toggler = {
        line = 'gcc',
        block = 'gbc',
    },
    opleader = {
        line = 'gc',
        block = 'gb',
    },
    pre_hook = nil,
    post_hook = nil,
}
--]]







-- LSP
---[[
-- require('lsp_lines').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
    require('lsp_signature').on_attach()
    if client.name ~= "efm" then
        require('nvim-navic').attach(client, bufnr)
    end
    local opts = { noremap = true, silent = true, buffer = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'single' }) end, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)
    vim.keymap.set('n', '<LeftMouse>', '<LeftMouse><CMD>lua vim.diagnostic.open_float()<CR>', opts)
    vim.keymap.set('n', '<RightMouse>', '<LeftMouse><CMD>lua vim.lsp.buf.definition()<CR>', opts)
end

local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
        'clangd',
        '--background-index',
        '--cross-file-rename',
        '--clang-tidy',
        '--completion-style=bundled',
    },
}

lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                useLibraryCodeForTypes = true,
            },
        },
    },
}

lspconfig.efm.setup {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    init_options = {
        documentFormatting = true,
    },
    filetypes = { "python" },
    settings = {
        rootMarkers = { ".git/", "requirements.txt" },
        languages = {
            python = {
                {
                    formatCommand = "black --quiet -",
                    formatStdin = true,
                },
            },
        },
    },
}

lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        gopls = {
            analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
                assign = true,
                atomic = true,
                bools = true,
                cgocall = true,
                erroras = true,
                fieldalignment = true,
                printf = true,
            },
        },
    },
}

lspconfig.golangci_lint_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.taplo.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

local opts = {
    -- rust-tools options
    tools = {
        autoSetHints = true,
        -- hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    -- https://rust-analyzer.github.io/manual.html#features
    server = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importEnforceGranularity = true,
                    importPrefix = "crate"
                },
                cargo = {
                    allFeatures = true
                },
                checkOnSave = {
                    -- default: `cargo check`
                    command = "clippy"
                },
                inlayHints = {
                    typeHints = {
                        enable = false,
                    },
                },
            },
        }
    },
}

require('rust-tools').setup(opts)

-- This will be the path towards your sumneko folder. This is subjective
local sumneko_root_path = os.getenv("HOME") ..
    "/.config/nvim/lsp/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"
lspconfig.sumneko_lua.setup({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
            completion = { enable = true, callSnippet = "Both" },
            diagnostics = {
                enable = true,
                globals = { 'vim', 'describe',
                    'awesome', 'client', 'screen', 'root' },
                disable = { "lowercase-global" }
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    [vim.fn.expand('/usr/share/awesome/lib')] = true
                },
                -- adjust these two values if your performance is not optimal
                maxPreload = 2000,
                preloadFileSize = 1000
            }
        }
    },
    on_attach = on_attach
})

local credentials = require("credentials")
lspconfig.grammarly.setup({
    cmd = { "grammarly-languageserver", "--stdio" },
    filetypes = { "markdown", "text" },
    init_options = {
        clientId = credentials.grammarly_client_id,
    },
})
--]]





-- LuaSnip / Snippets
---[[
local ls = require('luasnip')

ls.config.setup {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    region_check_events = "CursorHold,CursorHoldI",
    enable_autosnippets = nil,
    ext_opts = nil,
}

require('luasnip.loaders.from_vscode').lazy_load()

require('luasnip-latex-snippets').setup()
--]]

-- Vimwiki
---[[
g.vimwiki_list = {
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
        },
        syntax = "default",
        ext = ".wiki",
        auto_toc = 1,
        auto_tags = 1,
        auto_export = 1,
        links_space_char = "_",
        maxhi = 1,
    }, {
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
        },
        syntax = "default",
        auto_tags = 1,
        ext = ".wiki",
        auto_toc = 1,
        auto_export = 1,
        links_space_char = "_",
        maxhi = 1,
    }, {
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
-- ]]

-- Harpoon
--- [[
opts = { noremap = true }
vim.keymap.set('n', '<leader>ma', require("harpoon.mark").add_file, opts)
vim.keymap.set('n', '<leader>mt', require("harpoon.ui").toggle_quick_menu, opts)
vim.keymap.set('n', '<leader>m1', function() require("harpoon.ui").nav_file(1) end, opts)
vim.keymap.set('n', '<leader>m2', function() require("harpoon.ui").nav_file(2) end, opts)
vim.keymap.set('n', '<leader>m3', function() require("harpoon.ui").nav_file(3) end, opts)
vim.keymap.set('n', '<leader>m4', function() require("harpoon.ui").nav_file(4) end, opts)
vim.keymap.set('n', '<leader>m5', function() require("harpoon.ui").nav_file(5) end, opts)
vim.keymap.set('n', '<leader>m6', function() require("harpoon.ui").nav_file(6) end, opts)
vim.keymap.set('n', '<leader>m7', function() require("harpoon.ui").nav_file(7) end, opts)
vim.keymap.set('n', '<leader>m8', function() require("harpoon.ui").nav_file(8) end, opts)
vim.keymap.set('n', '<leader>m9', function() require("harpoon.ui").nav_file(9) end, opts)
vim.keymap.set('n', '<leader>m0', function() require("harpoon.ui").nav_file(10) end, opts)
vim.keymap.set('n', '<leader>mn', require("harpoon.ui").nav_next, opts)
vim.keymap.set('n', '<leader>mp', require("harpoon.ui").nav_prev, opts)
-- ]]

-- Debugging
--- [[
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>du", ":lua require'dapui'.toggle()<CR>")

local dap, dapui = require("dap"), require("dapui")
require('nvim-dap-virtual-text').setup()
require('dapui').setup()
require('telescope').load_extension('dap')

-- Language Specific Extensions
require('dap-go').setup()


-- C/C++/Rust Debugger
dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/usr/bin/codelldb',
        args = { "--port", "${port}" },
    }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        stdio = { "input.txt", nil, nil },
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp



-- Launch dap-ui automatically when debugging starts/stops
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- ]]
