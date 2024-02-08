local sources = {
  ["path"] = { name = "path", option = { trailing_slash = true, label_trailing_slash = true } },
  ["buffer"] = { name = "buffer", option = { keyword_length = 3 } },
  ["cmdline"] = { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
  ["git"] = { name = "git" },
  ["nvim_lsp"] = { name = "nvim_lsp" },
  ["rg"] = { name = "rg" },
  ["treesitter"] = { name = "treesitter" },
  ["nvim_lsp_document_symbol"] = { name = "nvim_lsp_document_symbol" },
  ["luasnip"] = { name = "luasnip" },
}

local source_to_icon_map = {
  ["path"] = "",
  ["buffer"] = "",
  ["cmdline"] = "",
  ["git"] = "",
  ["nvim_lsp"] = "",
  ["rg"] = "󰑑",
  ["treesitter"] = "󰔱",
  ["nvim_lsp_document_symbol"] = "󱔁",
  ["luasnip"] = "",
}

return {
  {
    "https://github.com/hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    config = function()
      local cmp = require("cmp")
      local ls = require("luasnip")

      cmp.setup({
        enabled = function()
          -- disable completion in comments
          local context = require 'cmp.config.context'
          -- keep command mode completion enabled when cursor is in a comment
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
          end
        end,
        view = {
          entries = { name = "custom", selection_order = "near_cursor" },
          docs = { auto_open = true },
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-1),
          ["<C-f>"] = cmp.mapping.scroll_docs(1),
          ["<C-d>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if cmp.visible_docs() then
                cmp.close_docs()
              else
                cmp.open_docs()
              end
            elseif fallback ~= nil then
              fallback()
            end
          end, { "i", "s" }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Enter>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behaviour = cmp.ConfirmBehavior.Replace, select = false })
              elseif fallback ~= nil then
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            elseif fallback ~= nil then
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if ls.jumpable(-1) then
              ls.jump(-1)
            elseif fallback ~= nil then
              fallback()
            end
          end, { "i", "s" })
        }),
        sources = {
          sources["luasnip"],
          sources["nvim_lsp"],
          sources["path"],
          sources["buffer"],
          -- sources["treesitter"],
          sources["nvim_lsp_document_symbol"],
          -- sources["rg"],
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = function()
              return math.floor(0.45 * vim.o.columns)
            end,
            ellipsis_char = "",
            show_labelDetails = true,
            before = function(entry, vim_item)
              vim_item.menu = " " .. source_to_icon_map[entry.source.name]
              return vim_item
            end,
          })
        }
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          sources["buffer"],
          -- sources["treesitter"],
          sources["nvim_lsp_document_symbol"],
        },
      })

      -- cmp.setup.cmdline(":", {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = cmp.config.sources(
      --     { sources["cmdline"] },
      --     { sources["path"] }
      --   ),
      -- })
    end,
    dependencies = {
      "https://github.com/hrsh7th/cmp-nvim-lsp",
      "https://github.com/onsails/lspkind.nvim",
      "https://github.com/hrsh7th/cmp-buffer",
      "https://github.com/hrsh7th/cmp-path",
      "https://github.com/hrsh7th/cmp-cmdline",
      -- "https://github.com/lukas-reineke/cmp-rg",
      -- "https://github.com/ray-x/cmp-treesitter",
      "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol",
      "https://github.com/L3MON4D3/LuaSnip",
      "https://github.com/saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "https://github.com/petertriho/cmp-git",
    ft = "gitcommit",
    config = function()
      require("cmp_git").setup()

      local cmp = require("cmp")

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources(
          { sources["git"] },
          { sources["buffer"] }
        )
      })
    end,
    dependencies = {
      "https://github.com/hrsh7th/nvim-cmp",
      "https://github.com/nvim-lua/plenary.nvim",
    },
  },
}
