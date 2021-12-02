local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' }
  },
  {
    { name = 'buffer' }
  })
})

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `luasnip`
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<Down>"] = cmp.mapping.select_next_item { behaviour = cmp.SelectBehavior.Select },
    ["<Up>"] = cmp.mapping.select_prev_item { behaviour = cmp.SelectBehavior.Select },
    ["<Right>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- if cmp.visible() then
        -- cmp.select_next_item()
        -- fallback()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'npm', keyword_length = 4 },
    { name = 'luasnip'},
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    -- { name = 'rg' },
    { name = 'latex_symbols' },
    -- { name = 'zsh' },
    -- { name = 'treesitter' },
    { name = 'buffer', keyword_length = 5, max_item_count = 4 },
    { name = 'emoji' },
    { name = 'spell', keyword_length = 5 },
  },
  documentation = {
  },
  experimental = {
    native_menu = false,
    -- ghost_text = true,
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        npm = "",
        buffer = "﬘",
        nvim_lsp = "",
        luasnip = "",
        nvim_lua = "",
        emoji = "ﲃ",
        latex_symbols = "",
        treesitter = "滑",
        path = "",
        zsh = "",
        spell = "暈",
        rg = "縷",
      })[entry.source.name]

      return vim_item
    end,
  }
})
