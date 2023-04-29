local jvim, loaded = pcall(require, "jvim")
if loaded then
    return
end

vim.keymap.set("n", "<Left>", jvim.to_parent, { silent = true })
vim.keymap.set("n", "<Right>", jvim.descend, { silent = true })
vim.keymap.set("n", "<Up>", jvim.prev_sibling, { silent = true })
vim.keymap.set("n", "<Down>", jvim.next_sibling, { silent = true })
