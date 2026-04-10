local utils = require("akshettrj.utils")

local map = function(mode, lhs, rhs, bufnr, opts)
  opts["silent"] = true
  opts["buffer"] = bufnr
  opts["desc"] = "[LSP] " .. opts["desc"]
  vim.keymap.set(mode, lhs, rhs, opts)
end

local xdg_config_dir = vim.fn.stdpath("config"):gsub("nvim$", "")

local on_attach_maker = function(lsp_basics)
  return function(client, bufnr)
    if client.name == "ruff_lsp" or client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end

    -- local basics = require("lsp_basics")
    lsp_basics.make_lsp_commands(client, bufnr)

    map("n", "gd", vim.lsp.buf.definition, bufnr, { desc = "Go to definition" })
    map("n", "gD", vim.lsp.buf.declaration, bufnr, { desc = "Go to declaration" })
    map("n", "gr", vim.lsp.buf.references, bufnr, { desc = "See references" })
    map("n", "K", vim.lsp.buf.hover, bufnr, { desc = "See hover documentation" })
    map("n", "gi", vim.lsp.buf.implementation, bufnr, { desc = "Go to implementation" })
    map("n", "<leader>r", vim.lsp.buf.rename, bufnr, { desc = "Rename the entity" })
    map("n", "[d", vim.diagnostic.goto_prev, bufnr, { desc = "Go to previous diagnostic" })
    map("n", "]d", vim.diagnostic.goto_next, bufnr, { desc = "Go to next diagnostic" })
    map("n", "<leader>D", vim.diagnostic.open_float, bufnr, { desc = "Go to next diagnostic" })
    map("n", "<leader>a", vim.lsp.buf.code_action, bufnr, { desc = "Perform code actions" })

    vim.lsp.inlay_hint.enable(true, nil)
    vim.diagnostic.config({
      float = {
        source = "if_many",
      },
    })
  end
end

return {
  {
    "https://github.com/williamboman/mason.nvim",
    enabled = function()
      return not utils.is_inside_vscode()
    end,
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
    enabled = function()
      return not utils.is_inside_vscode()
    end,
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
    enabled = function()
      return not utils.is_inside_vscode()
    end,
    event = { "LspAttach" },
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = true,
          show_folder = 0,
          show_file = true,
          folder_level = 2,
          color_mode = true,
          hide_keyword = true,
        },
        lightbulb = {
          enable = false,
          sign = true,
          virtual_text = false,
          sign_priority = 0;
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
    enabled = function()
      return not utils.is_inside_vscode()
    end,
    event = { "BufNewFile", "BufReadPre" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lsp_basics = require("lsp_basics")

      local on_attach = on_attach_maker(lsp_basics)

      vim.lsp.config.clangd = {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "clangd",
          "--background-index",
          "--cross-file-rename",
          "--clang-tidy",
          -- "--completion-style=bundled",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
          "--import-insertions",
          "--limit-references=0",
          "--limit-results=0",
          "--rename-file-limit=0",
        },
      }
      vim.lsp.enable("clangd")

      vim.lsp.config.pyright = {
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
              typeCheckingMode = "standard",
              reportMissingTypeStubs = false,
            },
          },
        },
      }
      -- vim.lsp.enable("pyright")

      -- lspconfig.ruff.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      --   cmd = { "ruff", "server", "--preview" },
      -- })
      --
      -- lspconfig.ts_ls.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      vim.lsp.config.taplo = {
        capabilities = capabilities,
        on_attach = on_attach,
      }
      vim.lsp.enable("taplo")

      -- lspconfig.nil_ls.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      --   settings = {
      --     ['nil'] = {
      --       nix = {
      --         flake = {
      --           autoArchive = false,
      --           autoEvalInputs = false,
      --         },
      --       },
      --     },
      --   },
      -- })

      vim.lsp.config.nixd = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          nixd = {
            nixpkgs = { expr = 'import (builtins.getFlake "' .. xdg_config_dir .. 'nixos-flake").inputs.nixpkgs { }' },
            formatting = { command = { "alejandra" } },
            options = {
              nixos = { expr = '(builtins.getFlake "' .. xdg_config_dir .. 'nixos-flake").nixosConfigurations.' .. vim.fn.hostname() .. '.options' },
              home_manager = { expr = '(builtins.getFlake "' .. xdg_config_dir .. 'nixos-flake").homeConfigurations."' .. os.getenv("USER") .. '@' .. vim.fn.hostname() .. '".options' },
            },
          },
        },
      }
      vim.lsp.enable("nixd")

      vim.lsp.config.texlab = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          texlab = {
            inlayHints = {
              maxLength = 15,
            }
          }
        }
      }
      vim.lsp.enable("texlab")

      vim.lsp.config.gopls = {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "gopls", "serve" },
        settings = {
          gopls = {
            analyses = {
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
          },
        },
      }
      vim.lsp.enable("gopls")

      vim.lsp.config.lua_ls = {
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
                vim.fn.expand("$VIMRUNTIME/lua"),
                vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
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
      }
      vim.lsp.enable("lua_ls")

      vim.lsp.config.pyrefly = {
        cmd = { "pyrefly", "lsp" },
        filetypes = { "python" },
        root_dir = vim.fs.root(0, { ".git/", "pyproject.toml", "pyrefly.toml" }),
        -- settings = {
        --   python = {
        --     pyrefly = {
        --       diagnosticMode = "workspace",
        --     },
        --   },
        -- },
        on_attach = on_attach,
        capabilities = capabilities,
      }
      vim.lsp.enable("pyrefly")

      vim.lsp.config.ty = {
        cmd = { "ty", "server" },
        filetypes = { "python" },
        root_dir = vim.fs.root(0, { ".git/", "pyproject.toml" }),
        on_attach = on_attach,
        capabilities = capabilities,
      }
      vim.lsp.enable("ty")

      vim.lsp.config.qmlls = {
        cmd = { "qmlls", "-E" },
        filetypes = { "qml" },
        root_dir = vim.fs.root(0, { "shell.qml" }),
        on_attach = on_attach,
        capabilities = capabilities,
      }
      vim.lsp.enable("qmlls")

    end,
    dependencies = {
      "https://github.com/williamboman/mason.nvim",
      "https://github.com/williamboman/mason-lspconfig.nvim",
      "https://github.com/hrsh7th/cmp-nvim-lsp",
      "https://github.com/nanotee/nvim-lsp-basics",
      "https://github.com/folke/neoconf.nvim",
    },
  },
  {
    "https://github.com/j-hui/fidget.nvim",
    enabled = function()
      return not utils.is_inside_vscode()
    end,
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
    "https://github.com/folke/trouble.nvim",
    enabled = function()
      return not utils.is_inside_vscode()
    end,
    event = "LspAttach",
    cmd = "Trouble",
    opts = {},
  },
  {
    "https://github.com/mrcjkb/rustaceanvim",
    enabled = function()
      return not utils.is_inside_vscode()
    end,
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
  {
    "https://github.com/folke/neoconf.nvim",
    enabled = function()
      return not utils.is_inside_vscode()
    end,
    opts = {
      import = {
        vscode = true,
        coc = false,
        nlsp = false,
      },
    },
    lazy = true,
  },
}
