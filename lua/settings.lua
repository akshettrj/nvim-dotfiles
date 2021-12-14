local o = vim.o
local cmd = vim.cmd
local g = vim.g

-- g.zipPlugin_ext = "*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip, *.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm, *.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.xlam,*.xlsx,*.xlsm, *.xlsb,*.xltx,*.xltm,*.xlam,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx,*.epub"

-- Line Numbering
o.number = true
o.relativenumber = true

-- Encoding
o.encoding = 'utf-8'

-- Enable Mouse
o.mouse = 'a'

-- Don't break words
o.wrap = true
o.linebreak = true

-- Splits open in intuitive direction
o.splitbelow = true
o.splitright = true

-- Tabbing and spacing
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
-- o.smarttab = true
-- o.smartindent = true
-- o.autoindent = true

-- Completion Moment
o.completeopt = "menuone,noselect"

cmd[[set colorcolumn=100]]

-- Fix Syntax on saving
cmd[[
set title
setglobal termguicolors

" No need of mode showing now
set noshowmode
]]
