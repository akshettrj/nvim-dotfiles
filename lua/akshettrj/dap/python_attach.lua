-- Continuous debugpy attach.
--
-- Keeps (re)connecting to a running debugpy instance so that when one debug
-- session ends and another starts on the same port, Neovim attaches to it
-- automatically. The port is taken from an environment variable; if that is
-- unset, it is prompted for once per start and reused for every reconnect.

local M = {}

---@class PythonAttachOpts
---@field host string             Host debugpy listens on.
---@field env_var string          Env var read for the port.
---@field default_port integer    Fallback/prompt default when env var is unset.
---@field poll_interval_ms integer How often to re-check and reattach.
---@field connect_max_retries integer  TCP connect retries (×250ms) per attempt.
---@field just_my_code boolean     debugpy `justMyCode`.
---@field config_name string       Name shown in the dap config picker.
---@field keymap string|false      Normal-mode toggle keymap, or false to skip.
local defaults = {
  host = "127.0.0.1",
  env_var = "DEBUGPY_PORT",
  default_port = 5678,
  poll_interval_ms = 2000,
  connect_max_retries = 1000,
  just_my_code = false,
  config_name = "Attach to debugpy (continuous)",
  keymap = "<leader>dp",
}

local state = {
  ---@type PythonAttachOpts?
  opts = nil,
  ---@type integer? active timer handle
  timer = nil,
  ---@type integer? resolved port for the current start
  port = nil,
  ---@type table? the dap configuration table
  config = nil,
}

-- Resolve the port: the env var wins; otherwise prompt the user (defaulting to
-- `default_port`). Called once per start so the prompt appears at most once.
---@param opts PythonAttachOpts
---@return integer
local function resolve_port(opts)
  local from_env = tonumber(vim.env[opts.env_var])
  if from_env then
    return from_env
  end
  local answer = vim.fn.input(string.format("debugpy port [%d]: ", opts.default_port))
  return tonumber(answer) or opts.default_port
end

---@return boolean
function M.is_running()
  return state.timer ~= nil
end

function M.start()
  if state.timer then
    return
  end
  local dap = require("dap")
  local opts = state.opts
  state.port = resolve_port(opts)

  local function tick()
    -- A non-nil session means we are already attached or mid-connect, so skip.
    if not dap.session() then
      dap.run(state.config, { new = true })
    end
  end

  state.timer = vim.fn.timer_start(opts.poll_interval_ms, tick, { ["repeat"] = -1 })
  tick()
  vim.notify(
    string.format("debugpy: continuously attaching on %s:%d", opts.host, state.port),
    vim.log.levels.INFO
  )
end

function M.stop()
  if state.timer then
    vim.fn.timer_stop(state.timer)
    state.timer = nil
  end
  state.port = nil
  pcall(function()
    local dap = require("dap")
    if dap.session() then
      dap.terminate()
    end
  end)
  vim.notify("debugpy: continuous attach stopped", vim.log.levels.INFO)
end

function M.toggle()
  if state.timer then
    M.stop()
  else
    M.start()
  end
end

-- Registers the dap configuration, adapter retry behaviour, commands and keymap.
-- Call after `require("dap-python").setup(...)`.
---@param user_opts PythonAttachOpts?
function M.setup(user_opts)
  local dap = require("dap")
  local opts = vim.tbl_extend("force", defaults, user_opts or {})
  state.opts = opts

  state.config = {
    type = "python",
    request = "attach",
    name = opts.config_name,
    connect = {
      host = opts.host,
      -- Resolved lazily at attach time: reuse the started port, else resolve
      -- on the fly (covers picking this config manually without M.start()).
      port = function()
        return state.port or resolve_port(opts)
      end,
    },
    justMyCode = opts.just_my_code,
  }

  dap.configurations.python = dap.configurations.python or {}
  table.insert(dap.configurations.python, state.config)

  -- Wait for debugpy to come up instead of erroring immediately on connect.
  -- nvim-dap retries the TCP connect `max_retries` times, 250ms apart.
  local base_adapter = dap.adapters.python
  dap.adapters.python = function(cb, config)
    base_adapter(function(adapter)
      if config.request == "attach" and config.name == opts.config_name then
        adapter.options = adapter.options or {}
        adapter.options.max_retries = opts.connect_max_retries
      end
      cb(adapter)
    end, config)
  end
  dap.adapters.debugpy = dap.adapters.python

  vim.api.nvim_create_user_command("DebugpyAttach", M.start, { desc = "Start continuous debugpy attach" })
  vim.api.nvim_create_user_command("DebugpyAttachStop", M.stop, { desc = "Stop continuous debugpy attach" })
  vim.api.nvim_create_user_command("DebugpyAttachToggle", M.toggle, { desc = "Toggle continuous debugpy attach" })

  if opts.keymap then
    vim.keymap.set("n", opts.keymap, M.toggle, { desc = "Toggle continuous debugpy attach" })
  end
end

return M
