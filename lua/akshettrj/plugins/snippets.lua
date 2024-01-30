return {
  {
    "https://github.com/L3MON4D3/LuaSnip",
    event = "VeryLazy",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      local ls = require("luasnip")

      ls.snippets = require("luasnip_snippets").load_snippets()

      require("luasnip-latex-snippets").setup()
      require("luasnip.loaders.from_vscode").lazy_load()

      ls.config.setup({
        history = true,
        update_events = "TextChanged,TextChangedI",
        region_check_events = "CursorHold,CursorHoldI,InsertEnter",
        delete_check_events = "InsertLeave",
        enable_autosnippets = nil,
        ext_opts = nil,
      })
    end,
    dependencies = {
      "https://github.com/rafamadriz/friendly-snippets",
      "https://github.com/iurimateus/luasnip-latex-snippets.nvim",
      "https://github.com/molleweide/LuaSnip-snippets.nvim",
    }
  }
}
