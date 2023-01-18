-- Navigating through splits
vim.keymap.set("n", "<A-h>", "<C-w><C-h>", { silent = true })
vim.keymap.set("n", "<A-j>", "<C-w><C-j>", { silent = true })
vim.keymap.set("n", "<A-k>", "<C-w><C-k>", { silent = true })
vim.keymap.set("n", "<A-l>", "<C-w><C-l>", { silent = true })


-- Resizing splits
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { silent = true })


-- Spell checking
vim.keymap.set("n", "<Leader>sc", ":set spell!<CR>", { silent = true })


-- System clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", [["+y]], { silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>p", [["+p]], { silent = true })


-- Centering stuff
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })
vim.keymap.set("n", "G", "Gzzzv", { silent = true })
vim.keymap.set("n", "%", "%zzzv", { silent = true })
vim.keymap.set("n", "``", "``zzzv", { silent = true })


-- Moving around in insert mode
vim.keymap.set("i", "<A-h>", "<Left>", { silent = true })
vim.keymap.set("i", "<A-j>", "<Down>", { silent = true })
vim.keymap.set("i", "<A-k>", "<Up>", { silent = true })
vim.keymap.set("i", "<A-l>", "<Right>", { silent = true })


-- Indentation
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })


-- Move lines around
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv-gv", { silent = true })
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv-gv", { silent = true })


-- Don't change clipboard while pasting in Select mode
vim.keymap.set("x", "p", "pgvy", { silent = true })


-- Undo-tree
vim.keymap.set("n", "<F4>", ":UndotreeToggle<CR>", { silent = true })


-- Jump to start/end of line
vim.keymap.set("n", "H", function()
    local current_column = vim.fn.col(".")
    if current_column == 1 then
        vim.cmd.normal("_")
    else
        vim.fn.cursor(".", 1)
    end
end, { silent = true })
vim.keymap.set("n", "L", function()
    local current_column = vim.fn.col(".")
    local end_column = vim.fn.col("$") - 1
    if current_column == end_column then
        vim.cmd.normal("g_")
    else
        vim.fn.cursor(".", end_column)
    end
end, { silent = true })
