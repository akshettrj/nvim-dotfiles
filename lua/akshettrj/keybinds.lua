local utils = require("akshettrj.utils")

local opts = { silent = true }

-- Split Navigation
vim.keymap.set("n", "<A-h>", "<C-w><C-h>", opts)
vim.keymap.set("n", "<A-j>", "<C-w><C-j>", opts)
vim.keymap.set("n", "<A-k>", "<C-w><C-k>", opts)
vim.keymap.set("n", "<A-l>", "<C-w><C-l>", opts)

-- Split Resizing
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- System Clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", [["+y]], opts)
vim.keymap.set({ "n", "v" }, "<Leader>p", [["+p]], opts)

-- Centering on Navigation
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "G", "Gzzzv", opts)
vim.keymap.set("n", "%", "%zzzv", opts)
vim.keymap.set("n", "``", "``zzzv", opts)

-- Navigation in Insert mode
vim.keymap.set("i", "<A-h>", "<Left>", opts)
vim.keymap.set("i", "<A-j>", "<Down>", opts)
vim.keymap.set("i", "<A-k>", "<Up>", opts)
vim.keymap.set("i", "<A-l>", "<Right>", opts)

-- Easy Indentation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move lines around
vim.keymap.set("v", "<C-k>", ":move '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "<C-j>", ":move '>+1<CR>gv=gv", opts)
-- vim.keymap.set("n", "<C-k>", ":move .-2<CR>==", opts)
-- vim.keymap.set("n", "<C-j>", ":move .+1<CR>==", opts)

-- Don't change clipboard while pasting in Select mode
vim.keymap.set("x", "p", "pgvy", opts)

-- Undo on spaces and tabs
vim.keymap.set("i", "<Space>", "<Space><C-g>u", opts)
vim.keymap.set("i", "<Tab>", "<Tab><C-g>u", opts)

-- Jump to start/end of line.
vim.keymap.set("n", "H", utils.jump_to_start_of_line, opts)
vim.keymap.set("n", "L", utils.jump_to_end_of_line, opts)
