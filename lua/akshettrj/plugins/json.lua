return {
  "https://github.com/ThePrimeagen/jvim.nvim",
  ft = { "json" },
  config = function()
    vim.keymap.set(
      "n", "<Left>",
      function()
		require("jvim").to_parent({ silent = true })
      end,
      { silent = true, desc = "[JSON] To parent" }
    )
    vim.keymap.set(
      "n", "<Right>",
      function()
		require("jvim").descend({ silent = true })
      end,
      { silent = true, desc = "[JSON] Descend" }
    )
    vim.keymap.set(
      "n", "<Up>",
      function()
		require("jvim").prev_sibling({ silent = true })
      end,
      { silent = true, desc = "[JSON] Previous sibling" }
    )
    vim.keymap.set(
      "n", "<Down>",
      function()
          require("jvim").next_sibling({ silent = true })
      end,
      { silent = true, desc = "[JSON] Next sibling" }
    )
  end,
}
