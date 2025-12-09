local utils = require("akshettrj.utils")
local has_vscode, vscode = pcall(require, "vscode")

if not has_vscode then
  return
end

local opts = { silent = true }

local hostname = vim.fn.hostname()
if hostname:startswith("akshettrai.jindal") then
  alt_prefix = "A-C"
else
  alt_prefix = "A"
end

-- Split Navigation
vim.keymap.set("n", string.format("<%s-h>", alt_prefix), function() vscode.action("workbench.action.navigateLeft") end, opts)
vim.keymap.set("n", string.format("<%s-j>", alt_prefix), function() vscode.action("workbench.action.navigateDown") end, opts)
vim.keymap.set("n", string.format("<%s-k>", alt_prefix), function() vscode.action("workbench.action.navigateUp") end, opts)
vim.keymap.set("n", string.format("<%s-l>", alt_prefix), function() vscode.action("workbench.action.navigateRight") end, opts)

vim.notify = vscode.notify
