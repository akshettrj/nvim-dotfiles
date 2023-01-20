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

M.duplicate_and_comment = function()
    if not pcall(require, "Comment") then
        return
    end
    local cursor_position = vim.api.nvim_win_get_cursor(0)
    if cursor_position == nil then
        return
    end
    local line_number = cursor_position[1] - 1
    local line_text = vim.api.nvim_buf_get_lines(0, line_number, line_number + 1, false)[1]
    vim.api.nvim_buf_set_lines(0, line_number, line_number + 1, false, { line_text, line_text })
    require("Comment.api").toggle.linewise.current()
end

return M
