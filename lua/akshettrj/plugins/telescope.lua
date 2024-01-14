return {
  {
    "https://github.com/nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>R",
        function()
          require("telescope.builtin").resume()
        end,
        { noremap = true, silent = true, desc = "Telescope Resume" }
      },
      {
        "<leader>g",
        function()
          require("telescope.builtin").git_files({ show_untracked = true })
        end,
        { noremap = true, silent = true, desc = "Telescope Git files" }
      },
      {
        "<leader>f",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        { noremap = true, silent = true, desc = "Telescope Resume" }
      },
    },
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules/.*",
            "venv/.*",
            ".git/.*"
          },
          mappings = {
            ["i"] = {
              ["<C-h>"] = "which_key",
            },
          },
        },
      })
    end,

    dependencies = {
      "https://github.com/nvim-lua/plenary.nvim",
      "https://github.com/nvim-tree/nvim-web-devicons",
    },
  },

  {
    "https://github.com/nvim-telescope/telescope-dap.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("dap")
    end,
    dependencies = {
      "https://github.com/nvim-telescope/telescope.nvim",
      "https://github.com/mfussenegger/nvim-dap",
    },
  },

  {
    "https://github.com/nvim-telescope/telescope-file-browser.nvim",
    keys = {
      {
        "<leader>e", "<cmd>Telescope file_browser<CR>",
        { noremap = true, silent = true, desc = "Telescope File Browser" }
      },
    },
    config = function()
      require("telescope._extensions")._config["file_browser"] = {
        hijack_netrw = true,
      }
      require("telescope").load_extension("file_browser")
    end,
    dependencies = {
      "https://github.com/nvim-telescope/telescope.nvim",
    },
  },

  {
    "https://github.com/nvim-telescope/telescope-live-grep-args.nvim",
    keys = {
      {
        "<leader>/", "<cmd>Telescope live_grep_args<CR>",
        { noremap = true, silent = true, desc = "Telescope Live Grep Args" }
      },
    },
    config = function()
      require("telescope._extensions")._config["live_grep_args"] = {
        auto_quoting = true,
        mappings = {
          ["i"] = {
            ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
          },
        },
      }
      require("telescope").load_extension("live_grep_args")
    end,
    dependencies = {
      "https://github.com/nvim-telescope/telescope.nvim",
    },
  },
}