require("akshettrj.utils")

local hostname = vim.fn.hostname()
if hostname:startswith("akshettrai.jindal") then
  alt_prefix = "A-C"
else
  alt_prefix = "A"
end

return {
  {
    "https://github.com/github/copilot.vim",
    enabled = true,
    event = { "VeryLazy" },
    init = function()
      vim.g.copilot_filetypes = {
        ["*"] = false,
      }
      vim.g.copilot_enabled = true
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_no_maps = true
    end,
    config = function()
      vim.keymap.set("i", "<" ..alt_prefix .. "-c>", "copilot#Suggest()", { expr = true, desc = "[Copilot] Get suggestions" })
      vim.keymap.set("i", "<" ..alt_prefix .. "-]>", "copilot#Next()", { expr = true, desc = "[Copilot] Next suggestion" })
      vim.keymap.set("i", "<" ..alt_prefix .. "-[>", "copilot#Previous()", { expr = true, desc = "[Copilot] Previous suggestion" })
      vim.keymap.set("i", "<" ..alt_prefix .. "-\\>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false, desc = "[Copilot] Accept suggestion" })
    end,
  },
}
