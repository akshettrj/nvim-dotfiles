"
" Plugin Management
"

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'ray-x/lsp_signature.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-path'
Plug 'kdheepak/cmp-latex-symbols'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/nvim-cmp'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }
Plug 'ThePrimeagen/jvim.nvim'

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'fatih/vim-go', { 'for': 'go' }

Plug 'numToStr/Comment.nvim'
Plug 'rafamadriz/friendly-snippets'
Plug 'L3MON4D3/LuaSnip'
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'

Plug 'vimwiki/vimwiki'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
call plug#end()


"
" General Settings
"

set number relativenumber
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set wrap linebreak
set splitbelow splitright
set completeopt=menuone,noselect
set foldmarker=<<<,>>>
set foldmethod=marker
set colorcolumn=100
set title
set noshowmode
set virtualedit=block
set signcolumn=yes
set tabstop=4
set shiftwidth=4
set expandtab

setglobal termguicolors

let mapleader = " "

"
" Autocommands
"

augroup cleanup_file
    autocmd!
    autocmd BufWritePre * let save_pos = getpos('.')
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e
    autocmd BufWritePre * call setpos('.', save_pos)
augroup END

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=40})
augroup END

autocmd BufEnter * setlocal fo-=c fo-=r fo-=o

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul




"
" Keybindings
"

"" Navigating Splits
nnoremap <silent> <A-h> <C-w><C-h>
nnoremap <silent> <A-j> <C-w><C-j>
nnoremap <silent> <A-k> <C-w><C-k>
nnoremap <silent> <A-l> <C-w><C-l>

"" Resizing Splits
nnoremap <silent> <C-Up>    :resize +2<CR>
nnoremap <silent> <C-Down>  :resize -2<CR>
nnoremap <silent> <C-Left>  :vertical resize +2<CR>
nnoremap <silent> <C-Right> :vertical resize -2<CR>

"" Spell Checking
nnoremap <silent> <Leader>sc :set spell!<CR>

"" System Clipboard
nnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>p "+p

vnoremap <silent> <Leader>y "+y
vnoremap <silent> <Leader>p "+p

"" Centering Stuff
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> G Gzzzv


inoremap <silent> ,         ,<C-g>u
inoremap <silent> .         .<C-g>u
inoremap <silent> <Space>   <Space><C-g>u

inoremap <silent> <A-k> <Up>
inoremap <silent> <A-j> <Down>
inoremap <silent> <A-h> <Left>
inoremap <silent> <A-l> <Right>


vnoremap <silent> < <gv
vnoremap <silent> > >gv

vnoremap <silent> <A-k> :move '<-2<CR>gv-gv
vnoremap <silent> <A-j> :move '>+1<CR>gv-gv


xnoremap <silent> p pgvy


"
" Colorscheme
"

"" Gruvbox
let g:gruvbox_termcolors = 256
let g:gruvbox_transparent_background = 1
let g:gruvbox_improved_warnings = 1
" let g:gruvbox_improved_strings = 1
let g:gruvbox_italic = 0
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_italicize_comments = 0
let g:gruvbox_invert_tabline = 0
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox




"
" Language Specific
"

"" HTML
autocmd FileType html set nowrap

"" Latex
function! ZathuraOpenPdf()
    let fullPath = expand("%:p")
    let pdfFile = substitute(fullPath, ".tex", ".pdf", "")
    silent make target="%" &
    execute "silent !zathura '" . pdfFile . "' &"
endfunction

function! BuildLatexFiles()
    let fullPath = expand("%:p")
    let pdfFile = substitute(fullPath, ".tex", ".pdf", "")
    execute "silent !rm '" . pdfFile . "'"
    silent make target="%"
endfunction

nnoremap <silent> <A-p> <CMD>call ZathuraOpenPdf()<CR>
nnoremap <silent> <A-b> <CMD>call BuildLatexFiles()<CR>

autocmd BufWritePost *.*tex call BuildLatexFiles()









"
" Lua Config
"

lua << EOF
local silent_noremap = {
    noremap = true,
    silent = true
}

local function nsnoremap(lhs, rhs)
    vim.api.nvim_set_keymap('n', lhs, rhs, silent_noremap)
end

-- Bufferline
---[[
require('bufferline').setup()
vim.g.bufferline = {
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



-- Colorizer
---[[
require('colorizer').setup{}
--]]



-- Indent
---[[
require('indent_blankline').setup{
    -- char = '»',
    buftype_exclude = { 'terminal', 'help' },
    show_first_indent_level = false,
    use_treesitter = true,
    show_trailing_blankline_indent = false,
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
    local vwc = vim.fn.wordcount().visual_word
    if (vwc ~= nil) then
        return "wc:" .. vwc
    else
        return ""
    end
end

require('lualine').setup{
    options = {
        theme = 'gruvbox',
        section_separators = {},
        component_separators = { left = '|', right = '|' },
    },
    extensions = {},
    sections = {
        lualine_a = {
            {'mode', lower=true},
            {spell_mode_on},
        },
        lualine_b = {
            'branch',
            'diff',
        },
        lualine_c = {
            'filename',
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
            {total_visual_words},
            'location',
        },
    },
}
--]]




-- GitSigns
---[[
require('gitsigns').setup{
    signs = {
        add = {hl='GitSignsAdd', text='│', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
        change = {hl='GitSignsChange', text='│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete = {hl='GitSignsDelete', text='-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete = {hl='GitSignsDelete', text='‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl='GitSignsChange', text='~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
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
ts.setup{
    defaults = {
        vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
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
        file_browser = {},
    },
}

nsnoremap('<leader>fe', '<CMD>lua require("telescope").extensions.file_browser.file_browser({ cwd = vim.fn.expand("%:p:h") })<CR>')
nsnoremap('<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>')
nsnoremap('<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>')
nsnoremap('<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>')
nsnoremap('<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>')
nsnoremap('<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>')
nsnoremap('<leader>fd', '<CMD>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>')
nsnoremap('<leader>fr', '<CMD>lua require("telescope.builtin").lsp_references()<CR>')
nsnoremap('<leader>fm', '<CMD>lua require("telescope.builtin").man_pages()<CR>')
nsnoremap('<leader>f*', '<CMD>lua require("telescope.builtin").grep_string()<CR>')
nsnoremap('<leader>fc', '<CMD>lua require("telescope").extensions.file_browser.file_browser({ cwd = "~/.config/" })<CR>')
--]]











-- ToggleTerm
---[[
require('toggleterm').setup{
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

cmp.setup{
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert{
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
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(callback)
            -- if cmp.visible() then
            --     cmp.select_prev_item()
            --     fallback()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
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
require('nvim-treesitter.configs').setup{
    ensure_installed = 'all',
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {'vimwiki'},
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = false },
    matchup = { enable = true },
}
--]]





-- Comment.nvim
---[[
require('Comment').setup{
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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
    require('lsp_signature').on_attach()
    local opts = { noremap = true, silent = true, buffer = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({border = 'single'}) end, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, opts)
    vim.keymap.set('n', '<LeftMouse>', '<LeftMouse><CMD>lua vim.diagnostic.open_float()<CR>', opts)
    vim.keymap.set('n', '<RightMouse>', '<LeftMouse><CMD>lua vim.lsp.buf.definition()<CR>', opts)
end

local lspconfig = require('lspconfig')

lspconfig.clangd.setup{
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

lspconfig.tsserver.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = {'python'},
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

lspconfig.gopls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}
--]]





-- LuaSnip / Snippets
---[[
local ls = require('luasnip')

ls.config.setup{
    history = true,
    updateevents = "TextChanged,TextChangedI",
    region_check_events = "CursorHold,CursorHoldI",
    enable_autosnippets = nil,
    ext_opts = nil,
}

require('luasnip.loaders.from_vscode').lazy_load()
--]]

EOF

"
" Vimwiki
"

let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 2
let g:vimwiki_url_maxsave = 0
let g:vimwiki_html_header_numbering = 0
let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr'

autocmd BufEnter *.wiki :syntax sync fromstart
