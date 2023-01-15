local M = {}

M.spell_mode_on = function()
    local smo = vim.opt.spell
    if smo:get() then
        return "暈"
    else
        return ""
    end
end

M.total_visual_words = function()
    local vwc = vim.api.nvim_eval("wordcount()")["visual_words"]
    if vwc ~= nil then
        return "wc:" .. vwc
    else
        return ""
    end
end

return M
