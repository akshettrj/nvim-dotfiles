local tsm = require('ts-manipulator')

local opts = {
  silent=true,
  noremap=true,
}

-- ARGUMENTS <<<
vim.keymap.set('n', "gaL", tsm.arguments.swap_forward, opts)
vim.keymap.set('n', "gaH", tsm.arguments.swap_backward, opts)
vim.keymap.set('n', "gal", tsm.arguments.move_forward, opts)
vim.keymap.set('n', "gah", tsm.arguments.move_backward, opts)

-- If arguments are broken into diff lines, then this is more intuitive
vim.keymap.set('n', "gaJ", tsm.arguments.swap_forward, opts)
vim.keymap.set('n', "gaK", tsm.arguments.swap_backward, opts)
vim.keymap.set('n', "gaj", tsm.arguments.move_forward, opts)
vim.keymap.set('n', "gak", tsm.arguments.move_backward, opts)

-- Change argument
vim.keymap.set('n', "gac", tsm.arguments.change, opts)
-- >>>

-- NODES <<<
-- Wrap node
vim.keymap.set('n', "gtnw", tsm.nodes.wrap_curr, opts)
-- >>>

-- LIST ITEMS <<<
vim.keymap.set('n', "glL", tsm.lists.swap_forward, opts)
vim.keymap.set('n', "glH", tsm.lists.swap_backward, opts)
vim.keymap.set('n', "gll", tsm.lists.move_forward, opts)
vim.keymap.set('n', "glh", tsm.lists.move_backward, opts)

-- If arguments are brlken into diff lines, then this is more intuitive
vim.keymap.set('n', "glJ", tsm.lists.swap_forward, opts)
vim.keymap.set('n', "glK", tsm.lists.swap_backward, opts)
vim.keymap.set('n', "glj", tsm.lists.move_forward, opts)
vim.keymap.set('n', "glk", tsm.lists.move_backward, opts)

-- Change argument
vim.keymap.set('n', "glc", tsm.lists.change, opts)
-- >>>
