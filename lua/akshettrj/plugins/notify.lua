local utils = require("akshettrj.utils")

return {
  "https://github.com/rcarriga/nvim-notify",
  enabled= function()
    return not utils.is_inside_vscode()
  end,
  lazy = false,
  config = function()
    local notify = require("notify")
    notify.setup({
      background_colour = "#000000"
    })
    vim.notify = notify
  end,
}
