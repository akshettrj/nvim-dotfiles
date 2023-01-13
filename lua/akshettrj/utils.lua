local M = {}

M.is_module_available = function(name)
    if package.loaded[name] then
        return true
    else
        for _, searcher in ipairs(package.searchers or package.loaders) do
            local loader = searcher(name)
            if type(loader) == 'function' then
                package.preload[name] = loader
                return true
            end
        end
        return false
    end
end

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
