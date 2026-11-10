local function run_with_env(command, args)
  return function()
    local env = vim.fn.input("Environment: ", "prod0")

    vim.api.nvim_cmd({
      cmd = command,
      args = vim.list_extend(vim.deepcopy(args or {}), { env }),
    }, {})
  end
end

return {
  dir = "/Users/akshettrai.jindal/work/sprinklr/projects/common_stuff/scripts/rust_suite/editors/red.nvim",
  name = "red.nvim",
  -- Local work plugin: only enable on this machine.
  enabled = vim.fn.hostname():startswith("akshettrai.jindal"),
  cmd = { "RedPortkey", "RedK8s" },
  keys = {
    { "<leader>pkm", run_with_env("RedPortkey", { "menu" }), desc = "Red Portkey: menu" },
    { "<leader>pkl", run_with_env("RedPortkey", { "local" }), desc = "Red Portkey: local" },
    { "<leader>pK", run_with_env("RedK8s"), desc = "Red k8s dashboard" },
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
