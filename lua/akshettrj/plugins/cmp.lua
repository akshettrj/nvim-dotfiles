return {
  {
    "https://github.com/hrsh7th/nvim-cmp",
    event = { "VeryLazy", "InsertEnter" },
    config = function()
      local cmp = require("cmp")

      local sources = {
        ["path"] = {
          name = "path",
          option = {
            trailing_slash = true,
            label_trailing_slash = true,
          }
        },
        ["buffer"] = {
          name = "buffer",
          option = {
            keyword_length = 3,
          },
        },
        ["cmdline"] = {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
        ["git"] = {
          name = "git",

        },
      }

      cmp.setup({
        sources = {
          sources["path"],
          sources["buffer"],
        },
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          sources["buffer"],
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          { sources["path"] },
          { sources["cmdline"] }
        ),
      })

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources(
          { sources["git"] },
          { sources["buffer"] }
        )
      })
    end,
    dependencies = {
      "https://github.com/neovim/nvim-lspconfig",
      "https://github.com/hrsh7th/cmp-nvim-lsp",
      "https://github.com/hrsh7th/cmp-buffer",
      "https://github.com/hrsh7th/cmp-path",
      "https://github.com/hrsh7th/cmp-cmdline",
      "https://github.com/petertriho/cmp-git",
    },
  },
  {
    "https://github.com/petertriho/cmp-git",
    event = "VeryLazy",
    dependencies = {
      "https://github.com/nvim-lua/plenary.nvim",
    }
  }
}
