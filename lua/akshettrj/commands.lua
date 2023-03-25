local utils = require("akshettrj.utils")

vim.api.nvim_create_user_command("DuplicateAndComment", utils.duplicate_and_comment, {})

vim.api.nvim_create_user_command("ReloadConfig", function()
    for module_name, _ in pairs(package.loaded) do
        if module_name:find("^akshettrj") ~= nil then
            package.loaded[module_name] = nil
        end
    end
    require("akshettrj")
end, { bang = true })
