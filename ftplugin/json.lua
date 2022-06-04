local jvim = require('jvim')

local opts = {noremap = true, silent = true}

vim.keymap.set('n', '<Left>', jvim.to_parent, opts)
vim.keymap.set('n', '<Right>', jvim.descend, opts)
vim.keymap.set('n', '<Up>', jvim.prev_sibling, opts)
vim.keymap.set('n', '<Down>', jvim.next_sibling, opts)
