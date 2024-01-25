local M = {}

function string.startswith(String, Start)
  return string.sub(String, 1, string.len(Start)) == Start
end

M.is_spell_mode_on = function()
  local smo = vim.opt.spell
  if smo:get() then
    return true
  else
    return false
  end
end

M.get_total_visual_words = function()
  local vwc = vim.api.nvim_eval("wordcount()")["visual_words"]
  if vwc ~= nil then
    return vwc
  else
    return 0
  end
end

M.jump_to_start_of_line = function()
  local curr_col = vim.fn.col(".")
  if curr_col == 1 then
    vim.cmd.normal("_")
  else
    vim.fn.cursor(".", 1)
  end
end

M.jump_to_end_of_line = function()
  local curr_col = vim.fn.col(".")
  local end_col = vim.fn.col("$") - 1
  if curr_col == end_col then
    vim.cmd.normal("g_")
  else
    vim.fn.cursor(".", end_col)
  end
end

return M
