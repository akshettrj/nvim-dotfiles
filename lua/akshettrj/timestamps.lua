-- Inline virtual text showing human-friendly dates for unix timestamps.
-- Detects 10-digit (seconds) and 13-digit (milliseconds) integers and
-- annotates them with UTC + local time at end of line.

local M = {}

local config = {
  -- Filetypes that get annotations automatically on open.
  auto_filetypes = { "json", "jsonc", "json5", "log", "text", "yaml", "http", "python" },
  -- Leading glyph for each annotation. Change if your font lacks it.
  icon = "🕑",
  -- Only treat numbers whose date falls in this range as timestamps,
  -- to avoid annotating unrelated 10/13-digit IDs.
  min_year = 2000,
  max_year = 2100,
  highlight = "Comment",
  -- Debounce (ms) before refreshing after changes/scroll.
  debounce_ms = 60,
}

local ns = vim.api.nvim_create_namespace("akshettrj_timestamps")
-- Per-buffer enabled state and debounce timers.
local enabled = {}
local timers = {}

local MIN_TS, MAX_TS

local function compute_bounds()
  MIN_TS = os.time({ year = config.min_year, month = 1, day = 1, hour = 0, min = 0, sec = 0 })
  MAX_TS = os.time({ year = config.max_year, month = 1, day = 1, hour = 0, min = 0, sec = 0 })
end

-- Find integer runs in a line that are not glued to word chars / decimals.
-- Returns a list of { s, e, text } with 1-based byte columns.
local function find_numbers(line)
  local results = {}
  local len = #line
  local i = 1
  while i <= len do
    local s, e = line:find("%d+", i)
    if not s then break end
    local before = s > 1 and line:sub(s - 1, s - 1) or ""
    local after = e < len and line:sub(e + 1, e + 1) or ""
    -- Reject if part of a word, hex, or the fractional tail of a decimal.
    local before_ok = before == "" or not before:match("[%w_%.]")
    local after_ok = after == "" or not after:match("[%w_]")
    if before_ok and after_ok then
      results[#results + 1] = { s = s, e = e, text = line:sub(s, e) }
    end
    i = e + 1
  end
  return results
end

-- Returns the human-readable annotation for a numeric string, or nil.
local function annotate(text)
  local digits = #text
  local secs, millis
  if digits == 10 then
    secs = tonumber(text)
  elseif digits == 13 then
    local n = tonumber(text)
    secs = math.floor(n / 1000)
    millis = n % 1000
  else
    return nil
  end

  if not secs or secs < MIN_TS or secs >= MAX_TS then
    return nil
  end

  local utc = os.date("!%B %d, %Y %H:%M:%S", secs)
  local loc = os.date("%B %d, %Y %H:%M:%S %z", secs)
  if millis then
    utc = utc .. string.format(".%03d", millis)
  end
  return string.format("%s UTC · %s", utc, loc)
end

local function clear(bufnr)
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
end

-- Annotate only the lines currently visible in the given window.
local function refresh(bufnr, winid)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end
  clear(bufnr)
  if not enabled[bufnr] then
    return
  end

  winid = winid or vim.fn.bufwinid(bufnr)
  local top, bot
  if winid ~= -1 and vim.api.nvim_win_is_valid(winid) then
    top = vim.fn.line("w0", winid)
    bot = vim.fn.line("w$", winid)
  else
    top = 1
    bot = vim.api.nvim_buf_line_count(bufnr)
  end
  -- Clamp and pad a little so scrolling feels instant.
  top = math.max(1, top - 20)
  bot = math.min(vim.api.nvim_buf_line_count(bufnr), bot + 20)

  local lines = vim.api.nvim_buf_get_lines(bufnr, top - 1, bot, false)
  for idx, line in ipairs(lines) do
    local lnum = top - 1 + idx - 1 -- 0-based
    local matches = find_numbers(line)
    local chunks = {}
    local seen = {}
    for _, m in ipairs(matches) do
      local human = annotate(m.text)
      if human and not seen[m.text] then
        seen[m.text] = true
        if #chunks > 0 then
          chunks[#chunks + 1] = { "  ", config.highlight }
        end
        local label = config.icon .. " "
        if #matches > 1 then
          label = label .. m.text .. " → "
        end
        chunks[#chunks + 1] = { label .. human, config.highlight }
      end
    end
    if #chunks > 0 then
      pcall(vim.api.nvim_buf_set_extmark, bufnr, ns, lnum, 0, {
        virt_text = chunks,
        virt_text_pos = "eol",
        hl_mode = "combine",
      })
    end
  end
end

local function schedule_refresh(bufnr)
  if timers[bufnr] then
    timers[bufnr]:stop()
  end
  local timer = vim.uv.new_timer()
  timers[bufnr] = timer
  timer:start(config.debounce_ms, 0, function()
    timer:stop()
    timer:close()
    timers[bufnr] = nil
    vim.schedule(function()
      refresh(bufnr)
    end)
  end)
end

function M.enable(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  enabled[bufnr] = true
  refresh(bufnr)
end

function M.disable(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  enabled[bufnr] = false
  clear(bufnr)
end

function M.toggle(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  if enabled[bufnr] then
    M.disable(bufnr)
  else
    M.enable(bufnr)
  end
end

function M.setup(opts)
  config = vim.tbl_deep_extend("force", config, opts or {})
  compute_bounds()

  local group = vim.api.nvim_create_augroup("akshettrj_timestamps", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = config.auto_filetypes,
    callback = function(args)
      M.enable(args.buf)
    end,
  })

  vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "WinScrolled", "BufWinEnter" }, {
    group = group,
    callback = function(args)
      if enabled[args.buf] then
        schedule_refresh(args.buf)
      end
    end,
  })

  vim.api.nvim_create_user_command("TimestampToggle", function()
    M.toggle()
  end, { desc = "Toggle human-friendly unix timestamp annotations" })
end

return M
