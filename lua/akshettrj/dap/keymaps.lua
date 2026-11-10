-- Single source of truth for DAP keymaps.
--
-- The same table both feeds lazy.nvim's `keys` spec (so the plugin lazy-loads
-- and the mappings are registered with descriptions) and renders the cheatsheet
-- popup, so the two can never drift out of sync. To add/change a binding, edit
-- `M.mappings` only.

local M = {}

---@class DapMapping
---@field [1] string lhs
---@field [2] function rhs
---@field desc string shown in which-key and the cheatsheet

---@type DapMapping[]
M.mappings = {
  {
    "<leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "[DAP] Toggle breakpoint for debugging",
  },
  {
    "<leader>dB",
    function()
      require("dap").run_to_cursor()
    end,
    desc = "[DAP] Continue execution till the cursor line",
  },
  {
    "<leader>?",
    function()
      require("dapui").eval(nil, {
        enter = true,
        width = math.floor(vim.o.columns * 0.9),
        height = math.floor(vim.o.lines * 0.8),
        context = "repl",
      })
    end,
    desc = "[DAP] Evaluate the variable/expression under the cursor/visually selected",
  },
  {
    "<F1>",
    function()
      require("dap").continue()
    end,
    desc = "[DAP] Continue / Start Debugging",
  },
  {
    "<F2>",
    function()
      require("dap").step_into()
    end,
    desc = "[DAP] Step Into",
  },
  {
    "<F3>",
    function()
      require("dap").step_over()
    end,
    desc = "[DAP] Step Over",
  },
  {
    "<F4>",
    function()
      require("dap").step_out()
    end,
    desc = "[DAP] Step Out",
  },
  {
    "<F5>",
    function()
      require("dap").step_back()
    end,
    desc = "[DAP] Step Back",
  },
  {
    "<F6>",
    function()
      require("dap").restart()
    end,
    desc = "[DAP] Restart",
  },
  {
    "<F7>",
    function()
      require("dap").close()
    end,
    desc = "[DAP] Stop",
  },
  {
    "<leader>dk",
    function()
      require("akshettrj.dap.keymaps").toggle_cheatsheet()
    end,
    desc = "[DAP] Toggle keybind cheatsheet",
  },
}

-- Build the `keys` spec for lazy.nvim from the mappings above.
---@return table[]
function M.lazy_keys()
  local keys = {}
  for _, m in ipairs(M.mappings) do
    table.insert(keys, { m[1], m[2], desc = m.desc })
  end
  return keys
end

local cheatsheet = { win = nil }

-- A short, unobtrusive floating window in the bottom-right listing every DAP
-- keybind and its description. Toggles: call again to close it.
function M.toggle_cheatsheet()
  if cheatsheet.win and vim.api.nvim_win_is_valid(cheatsheet.win) then
    vim.api.nvim_win_close(cheatsheet.win, true)
    cheatsheet.win = nil
    return
  end

  local desc_prefix = "%[DAP%]%s*"
  local max_lhs = 0
  for _, m in ipairs(M.mappings) do
    max_lhs = math.max(max_lhs, #m[1])
  end

  local lines = {}
  for _, m in ipairs(M.mappings) do
    local desc = (m.desc or ""):gsub(desc_prefix, "")
    table.insert(lines, string.format(" %-" .. max_lhs .. "s  %s ", m[1], desc))
  end

  local width = 0
  for _, line in ipairs(lines) do
    width = math.max(width, vim.fn.strdisplaywidth(line))
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = "wipe"

  cheatsheet.win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    anchor = "SE",
    row = vim.o.lines - 2,
    col = vim.o.columns - 1,
    width = width,
    height = #lines,
    style = "minimal",
    border = "rounded",
    title = " DAP keybinds ",
    title_pos = "center",
    focusable = false,
    noautocmd = true,
  })
end

return M
