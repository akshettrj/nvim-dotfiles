local jvim = require('jvim')

local opts = {noremap = true, silent = true}

vim.keymap.set('n', '<left>', jvim.to_parent, opts)
vim.keymap.set('n', '<right>', jvim.descend, opts)
vim.keymap.set('n', '<up>', jvim.prev_sibling, opts)
vim.keymap.set('n', '<down>', jvim.next_sibling, opts)
