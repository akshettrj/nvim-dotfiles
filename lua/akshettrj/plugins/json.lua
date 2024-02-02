return {
  "https://github.com/ThePrimeagen/jvim.nvim",
  ft = { "json" },
  config = function()
    vim.api.nvim_set_keymap(
      "n", "<Left>",
      function()
		require("jvim").to_parent({ silent = true })
      end,
      { silent = true, desc = "[JSON] To parent" }
    )
    vim.api.nvim_set_keymap(
      "n", "<Right>",
      function()
		require("jvim").descend({ silent = true })
      end,
      { silent = true, desc = "[JSON] Descend" }
    )
    vim.api.nvim_set_keymap(
      "n", "<Up>",
      function()
		require("jvim").prev_sibling({ silent = true })
      end,
      { silent = true, desc = "[JSON] Previous sibling" }
    )
    vim.api.nvim_set_keymap(
      "n", "<Down>",
      function()
          require("jvim").next_sibling({ silent = true })
      end,
      { silent = true, desc = "[JSON] Next sibling" }
    )
  end,
}
