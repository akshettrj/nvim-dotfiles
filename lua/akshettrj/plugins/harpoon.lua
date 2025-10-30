local hostname = vim.fn.hostname()
if hostname:startswith("akshettrai.jindal") then
  alt_prefix = "A-C"
else
  alt_prefix = "A"
end

return {
  "https://github.com/ThePrimeagen/harpoon",
  branch = "harpoon2",
  enabled = false,
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    for i = 1, 9 do
      vim.keymap.set("n", "<" .. alt_prefix .. "-" .. i .. ">", function()
        harpoon:list():select(i)
      end, { desc = "Harpoon goto file " .. i })
    end

    vim.keymap.set("n", "<" .. alt_prefix .. "-0>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle Harpoon UI" })

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Add to Harpoon" })

  end,
  dependencies = {
    "https://github.com/nvim-lua/plenary.nvim",
  },
}
