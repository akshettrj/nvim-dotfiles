if not pcall(require, "scrollbar") then
    return
end

require("scrollbar").setup()
require("scrollbar.handlers.gitsigns").setup()
