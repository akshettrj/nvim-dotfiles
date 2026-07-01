return {
  dir = "/Users/akshettrai.jindal/work/sprinklr/projects/common_stuff/scripts/rust_suite/editors/red.nvim",
  name = "red.nvim",
  -- Local work plugin: only enable on this machine.
  enabled = vim.fn.hostname():startswith("akshettrai.jindal"),
  cmd = { "RedPortkey", "RedK8s" },
  keys = {
    { "<leader>pk", "<Cmd>RedPortkey<CR>", desc = "Red Portkey: menu" },
    { "<leader>pK", "<Cmd>RedK8s<CR>", desc = "Red k8s dashboard" },
  },
  opts = {
    -- `red` is on $PATH (cargo install). Override with an absolute path if needed.
    binary = "red",
    env = "prod0",
    field_defaults = { namespace = "intuition", tailLength = "500" },
  },
  config = function(_, opts)
    require("portkey").setup(opts)
  end,
}
