if not pcall(require, "jvim") then
    return
end

local jvim = require("jvim")

vim.keymap.set("n", "<Left>", jvim.to_parent, { silent = true })
vim.keymap.set("n", "<Right>", jvim.descend, { silent = true })
vim.keymap.set("n", "<Up>", jvim.prev_sibling, { silent = true })
vim.keymap.set("n", "<Down>", jvim.next_sibling, { silent = true })
