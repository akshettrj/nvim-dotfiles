local utils = require("akshettrj.utils")

local opts = { silent = true }

local hostname = vim.fn.hostname()
if hostname:startswith("akshettrai.jindal") then
  alt_prefix = "A-C"
else
  alt_prefix = "A"
end

-- Split Navigation
vim.keymap.set("n", string.format("<%s-h>", alt_prefix), "<C-w><C-h>", opts)
vim.keymap.set("n", string.format("<%s-j>", alt_prefix), "<C-w><C-j>", opts)
vim.keymap.set("n", string.format("<%s-k>", alt_prefix), "<C-w><C-k>", opts)
vim.keymap.set("n", string.format("<%s-l>", alt_prefix), "<C-w><C-l>", opts)

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
vim.keymap.set("i", string.format("<%s-h>", alt_prefix), "<Left>", opts)
vim.keymap.set("i", string.format("<%s-j>", alt_prefix), "<Down>", opts)
vim.keymap.set("i", string.format("<%s-k>", alt_prefix), "<Up>", opts)
vim.keymap.set("i", string.format("<%s-l>", alt_prefix), "<Right>", opts)

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
vim.keymap.set({ "n", "v" }, "H", utils.jump_to_start_of_line, opts)
vim.keymap.set({ "n", "v" }, "L", utils.jump_to_end_of_line, opts)

-- Quickfix list
vim.keymap.set("n", "]q", "<CMD>cnext<CR>")
vim.keymap.set("n", "[q", "<CMD>cprev<CR>")

-- Shift + Space sometimes. Very annoying
vim.keymap.set("t", "<S-Space>", "<Space>")
