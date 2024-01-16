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

return M
