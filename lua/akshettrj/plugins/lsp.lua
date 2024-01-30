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
    "https://github.com/neovim/nvim-lspconfig",
    event = { "VeryLazy" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local opts = { silent = true, buffer = true }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "single" }) end, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
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
        settings = { python = { analysis = {
              autoImportCompletions = true,
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
              typeCheckingMode = "strict",
            }, },
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
        cmd = { "gopls" },
        settings = {},
      })

    end,
    dependencies = {
      "https://github.com/williamboman/mason.nvim",
      "https://github.com/williamboman/mason-lspconfig.nvim",
      "https://github.com/hrsh7th/cmp-nvim-lsp",
    },
  }
}
