return {
  dir = "/Users/akshettrai.jindal/work/sprinklr/projects/common_stuff/scripts/rust_suite/editors/jenkins.nvim",
  name = "jenkins.nvim",
  -- Local work plugin: only enable on this machine.
  enabled = vim.fn.hostname():startswith("akshettrai.jindal"),
  cmd = { "Jenkins" },
  keys = {
    { "<leader>pj", "<Cmd>Jenkins<CR>", desc = "Jenkins helper: menu" },
  },
  opts = {
    binary = "jenkins",
    -- nil = use default_env from jenkins_helper.toml. Override per project as needed.
    environment = nil,
    field_defaults = { component_name = "intuition" },
  },
  config = function(_, opts)
    require("jenkins").setup(opts)
  end,
}
