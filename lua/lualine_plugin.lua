-- local path = require "plenary.path"
-- For treesitter position
--[[
local ts_utils = require'nvim-treesitter.ts_utils'
local parsers = require'nvim-treesitter.parsers'

local get_line_for_node = function(node, type_patterns, transform_fn)
  local node_type = node:type()
  local is_valid = false
  for _, rgx in ipairs(type_patterns) do
    if node_type:find(rgx) then
      is_valid = true
      break
    end
  end
  if not is_valid then return '' end
  local line = transform_fn(vim.trim(ts_utils.get_node_text(node)[1] or ''))
  -- Escape % to avoid statusline to evaluate content as expression
  return line:gsub('%%', '%%%%')
end

local function transform_line(line)
  return line:gsub('%s*[%[%(%{]*%s*$', '')
end

local function fnc_loc()
  if not parsers.has_parser() then return end
  local options = {}
  local indicator_size = options.indicator_size or 100
  local type_patterns = options.type_patterns or {'class', 'function', 'method'}
  local transform_fn = options.transform_fn or transform_line
  local separator = options.separator or ' > '

  local current_node = ts_utils.get_node_at_cursor()
  if not current_node then return "" end

  local lines = {}
  local expr = current_node

  while expr do
    local line = get_line_for_node(expr, type_patterns, transform_fn)
    if line ~= '' and not vim.tbl_contains(lines, line) then
      table.insert(lines, 1, line)
    end
    expr = expr:parent()
  end

  local text = table.concat(lines, separator)
  local text_len = #text
  if text_len > indicator_size then
    return '...'..text:sub(text_len - indicator_size, text_len)
  end

  return text
end
--]]

-- https://github.com/nvim

-- local function total_words()
--   return string.format("tw:%d", vim.fn.wordcount().words)
-- end
--
local function total_visual_words()
  local vwc = vim.fn.wordcount().visual_words
  if (vwc ~= nil) then
    return string.format("vw:%d", vwc)
  else
    return ""
  end
end

local function spell_mode_on()
  local smo = vim.o.spell
  if (smo == true) then
    return "暈"
  else
    return ""
  end
end

--[[
local function check_dir()
  akdsfj
end
]]


require'lualine'.setup{
  options = {
    theme = 'gruvbox',
    -- section_separators = {},
    -- component_separators = { left = '|', right = '|' }
  },
  extensions = {
  },
  sections = {
    lualine_a = {
      {'mode', lower=true},
      {spell_mode_on}
    },
    lualine_b = {
      'branch',
      'diff',
    },
    lualine_c = {
      'filename',
      -- require('nvim-treesitter').statusline,
      -- vim.b.terminal_number,
      -- 'filesize',
      -- "require'lsp-status'.status()"
      -- {currdir},
      -- ':%:p:h'
      -- {fnc_loc}
    },
    lualine_x = {
      -- {file_permissions},
      'encoding',
      'fileformat',
      'filetype',
    },
    lualine_y = {
      'progress'
    },
    lualine_z = {
      -- {total_words},
      {total_visual_words},
      'location',
    }
  },
}
