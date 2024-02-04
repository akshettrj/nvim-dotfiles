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

      local on_attach = function(client, bufnr)
        if client.name == "ruff_lsp" then
          client.server_capabilities.hoverProvider = false
        end

        local map = function(mode, lhs, rhs, opts)
          opts["silent"] = true
          opts["buffer"] = bufnr
          opts["desc"] = "[LSP] " .. opts["desc"]
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
        map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
        map("n", "gr", vim.lsp.buf.references, { desc = "See references" })
        map("n", "K", vim.lsp.buf.hover, { desc = "See hover documentation" })
        map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
        map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename the entity" })
        map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename the entity" })
        map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
        map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
        map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Perform code actions" })
      end

      local lspconfig = require("lspconfig")

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

      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "gopls", "serve" },
        settings = {},
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
            hint = { enable = true, await = true },
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
    },
  }
}
