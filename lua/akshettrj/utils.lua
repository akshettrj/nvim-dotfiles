local M = {}

function string.startswith(String, Start)
  return string.sub(String, 1, string.len(Start)) == Start
end

return M
