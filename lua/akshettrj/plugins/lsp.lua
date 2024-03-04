local map = function(mode, lhs, rhs, bufnr, opts)
  opts["silent"] = true
  opts["buffer"] = bufnr
  opts["desc"] = "[LSP] " .. opts["desc"]
  vim.keymap.set(mode, lhs, rhs, opts)
end

local on_attach_maker = function(lsp_basics)
  return function(client, bufnr)
    if client.name == "ruff_lsp" then
      client.server_capabilities.hoverProvider = false
    end

    -- local basics = require("lsp_basics")
    lsp_basics.make_lsp_commands(client, bufnr)

    map("n", "gd", vim.lsp.buf.definition, bufnr, { desc = "Go to definition" })
    map("n", "gD", vim.lsp.buf.declaration, bufnr, { desc = "Go to declaration" })
    map("n", "gr", vim.lsp.buf.references, bufnr, { desc = "See references" })
    map("n", "K", vim.lsp.buf.hover, bufnr, { desc = "See hover documentation" })
    map("n", "gi", vim.lsp.buf.implementation, bufnr, { desc = "Go to implementation" })
    map("n", "<F2>", vim.lsp.buf.rename, bufnr, { desc = "Rename the entity" })
    map("n", "<leader>r", vim.lsp.buf.rename, bufnr, { desc = "Rename the entity" })
    map("n", "[d", vim.diagnostic.goto_prev, bufnr, { desc = "Go to previous diagnostic" })
    map("n", "]d", vim.diagnostic.goto_next, bufnr, { desc = "Go to next diagnostic" })
    map("n", "<leader>d", vim.diagnostic.open_float, bufnr, { desc = "Open diagnostics in a floating window" })
    map("n", "<leader>a", vim.lsp.buf.code_action, bufnr, { desc = "Perform code actions" })

    vim.lsp.inlay_hint.enable(0, true)
  end
end

return {
  {
    "https://github.com/williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonUpdate",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "https://github.com/williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    config = function()
      require("mason-lspconfig").setup()
    end,
    dependencies = {
      "https://github.com/williamboman/mason.nvim",
    },
  },
  {
    "https://github.com/nvimdev/lspsaga.nvim",
    event = { "LspAttach" },
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = true,
          show_folder = 0,
          show_file = false,
          color_mode = true,
          hide_keyword = true,
        },
        lightbulb = {
          enable = true,
          sign = true,
          virtual_text = false,
        },
      })
    end,
    dependencies = {
      "https://github.com/nvim-treesitter/nvim-treesitter",
      "https://github.com/nvim-tree/nvim-web-devicons",
    },
  },
  {
    "https://github.com/neovim/nvim-lspconfig",
    event = { "BufNewFile", "BufReadPre" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lsp_basics = require("lsp_basics")
      local lspconfig = require("lspconfig")

      local on_attach = on_attach_maker(lsp_basics)

      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "clangd",
          "--background-index",
          "--cross-file-rename",
          "--clang-tidy",
          -- "--completion-style=bundled",
          "--completion-style=detailed",
          "--function-args-placeholders",
          "--header-insertion=iwyu",
          "--import-insertions",
          "--limit-references=0",
          "--limit-results=0",
          "--rename-file-limit=0",
        },
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "pyright-langserver", "--stdio" },
        settings = {
          python = {
            analysis = {
              autoImportCompletions = true,
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
              typeCheckingMode = "strict",
            },
          },
        },
      })

      lspconfig.ruff_lsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "ruff-lsp" },
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.taplo.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "gopls", "serve" },
        settings = { gopls = {
          analyses = {
            fieldalignment = true,
            shadow = true,
            unusedvariable = true,
            unusedwrite = true,
            useany = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = false,
            constantValues = true,
            functionTypeParameters = false,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          importShortcut = "Both",
          usePlaceholders = true,
          matcher = "Fuzzy",
          experimentalPostfixCompletions = true,
          staticcheck = true,
        }, },
      })

      lspconfig.ruff_lsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        -- settings = {
        --   args = {},
        -- },
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
            completion = { enable = true, callSnippet = "Both" },
            diagnostics = {
              enable = true,
              globals = { "vim" },
              disable = { "lowercase-global" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              },
              maxPreload = 10000,
              preloadFileSize = 10000,
            },
            hint = {
              enable = true,
              arrayIndex = "Disable",
              await = true,
              paramName = "Literal",
              paramType = true,
              semicolon = "Disable",
              setType = true,
            },
            format = {
              enable = true,
              defaultConfig = { indent_style = "space", indent_size = "4" },
            },
          },
        },
      })
    end,
    dependencies = {
      "https://github.com/williamboman/mason.nvim",
      "https://github.com/williamboman/mason-lspconfig.nvim",
      "https://github.com/hrsh7th/cmp-nvim-lsp",
      "https://github.com/nanotee/nvim-lsp-basics",
    },
  },
  {
    "https://github.com/j-hui/fidget.nvim",
    version = "v1.*",
    event = { "LspAttach" },
    config = function()
      require("fidget").setup({
        notification = {
          window = {
            winblend = 0,
          },
        },
      })
    end,
  },
  {
    "https://github.com/mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    init = function()
      local lsp_basics = require("lsp_basics")
      local on_attach = on_attach_maker(lsp_basics)

      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            -- Rust related stuff here

            on_attach(client, bufnr)
          end,
        },
        default_settings = {
          ['rust-analyzer'] = {

          },
        },
      }
    end,
    dependencies = {
      "https://github.com/nanotee/nvim-lsp-basics",
    },
  },
}
