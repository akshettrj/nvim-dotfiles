local o = vim.o
local g = vim.opt_global

-- Editor Options (:set)

o.number = true; o.relativenumber = true  -- Line Numbering
o.encoding = 'utf-8'                      -- Encoding
o.mouse = 'a'                             -- Enable Mouse
o.wrap = true; o.linebreak = true         -- Don't break words
o.splitbelow = true; o.splitright = true  -- Splits open in intuitive direction
o.completeopt = "menuone,noselect"        -- Completion Moment
o.foldmarker = "<<<,>>>"                  -- Folds
o.foldmethod = "marker"                   -- Folds
o.colorcolumn = '100'                     -- Highlight 100th Column
o.title = true                            -- Show Title in X11 window name
o.showmode = false                        -- Don't show current mode (insert,normal etc.)
o.virtualedit = 'block'                   -- Move beyond EOL in block mode (select full rectangle)
o.signcolumn = 'yes'                      -- Keep signcolumn always open

-- [[ Tabbing and spacing
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
-- o.smarttab = true
-- o.smartindent = true
-- o.autoindent = true
--]]


-- Global Options (:setglobal)

g.termguicolors = true                    --  Enable 24-bit RGB color


vim.cmd[[ let mapleader = " " ]]
