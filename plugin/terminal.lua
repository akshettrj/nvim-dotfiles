-- Easy escape from terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")


local ns = vim.api.nvim_create_namespace('my.terminal.prompt');
local group = vim.api.nvim_create_augroup(
  "custom-term-open",
  { clear = true }
);

local osc_133_extmarks = {}

-- vim.api.nvim_create_autocmd("TermRequest", {
--   group = group,
--   callback = function(args)
--     local lnum = args.data.cursor[1]
--     if string.match(args.data.sequence, "^\027]133;A") then
--       extmark_id = vim.api.nvim_buf_set_extmark(args.buf, ns, lnum - 1, 0, {
--         sign_text = "▶",
--         sign_hl_group = "SpecialChar",
--       })
--       --
--       -- if not osc_133_extmarks[args.buf] then
--       --   osc_133_extmarks[args.buf] = {}
--       -- end
--       -- osc_133_extmarks[args.buf][lnum - 1] = extmark_id
--       --
--       -- for l, i in pairs(osc_133_extmarks[args.buf]) do
--       --   if l > (lnum - 1) then
--       --     vim.api.nvim_buf_del_extmark(args.buf, ns, i)
--       --   end
--       -- end
--     end
--   end,
-- })


-- Don't want relative line numbers and add OSC-133 indications in sign column
vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
    vim.opt_local.signcolumn = "auto"
  end,
})
