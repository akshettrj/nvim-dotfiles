return {
  {
    -- Git UI
    "https://github.com/tpope/vim-fugitive",
    enabled = false,
    cmd = "Git",
  },
  {
    "https://github.com/NeogitOrg/neogit",
    config = true,
    cmd = "Neogit",
    dependencies = {
      "https://github.com/nvim-lua/plenary.nvim",
      "https://github.com/sindrets/diffview.nvim",
    },
  },
  {
    "https://github.com/lewis6991/gitsigns.nvim",
    event = { "VeryLazy" },
    keys = {
      {
        "<leader>gb",
        function()
          require("gitsigns").blame_line()
        end,
        silent = true,
        desc = "Run git blame",
      },
    },
    opts = function()
      local gs = require("gitsigns")

      return {
        signcolumn = true,
        numhl = true,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 2000,
          follow_files = true,
        },
        attach_to_untracked = false,
        current_line_blame = false,
        -- current_line_blame_opts = {
        --   virt_text = false,
        --   virt_text_pos = "eol",
        --   delay = 1000,
        -- },
        -- current_line_blame_formatter_opts = {
        --   relative_time = true,
        -- },
        update_debounce = 100,
        max_file_length = 40000,
        on_attach = function()
          opts = {
            expr = true,
            silent = true,
          }

          vim.keymap.set("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, opts)

          vim.keymap.set("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, opts)
        end,
      }
    end,
  },
}
