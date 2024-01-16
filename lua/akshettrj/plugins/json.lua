return {
  "https://github.com/ThePrimeagen/jvim.nvim",
  ft = { "json" },
  keys = {
    {
      "<Left>",
      function()
        require("jvim").to_parent({ silent = true })
      end,
      mode = "n",
      silent = true,
      desc = "[JSON] to parent",
    },
    {
      "<Right>",
      function()
        require("jvim").descend({ silent = true })
      end,
      mode = "n",
      silent = true,
      desc = "[JSON] descend",
    },
    {
      "<Up>",
      function()
        require("jvim").prev_sibling({ silent = true })
      end,
      mode = "n",
      silent = true,
      desc = "[JSON] previous sibling",
    },
    {
      "<Down>",
      function()
        require("jvim").next_sibling({ silent = true })
      end,
      mode = "n",
      silent = true,
      desc = "[JSON] next sibling",
    },
  },
}
