return {
  {
    "https://github.com/williamboman/mason.nvim",
    cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
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
    setup = function()
    end,
    dependencies = {
      "https://github.com/williamboman/mason.nvim",
      "https://github.com/williamboman/mason-lspconfig.nvim",
    },
  }
}
