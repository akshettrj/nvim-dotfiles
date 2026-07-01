local utils = require("akshettrj.utils")

return {
  {
    "https://github.com/mfussenegger/nvim-dap",
    enabled = function()
      return not utils.is_inside_vscode()
    end,
    keys = require("akshettrj.dap.keymaps").lazy_keys(),
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      ui.setup()
      require("dap-go").setup()
      require("dap-python").setup("python")
      require("akshettrj.dap.python_attach").setup()

      require("nvim-dap-virtual-text").setup({
        display_callback = function(variable)
          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end
          return " " .. variable.value
        end,
      })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
    dependencies = {
      "https://github.com/leoluz/nvim-dap-go",
      "https://github.com/mfussenegger/nvim-dap-python",
      "https://github.com/theHamsta/nvim-dap-virtual-text",
      "https://github.com/nvim-neotest/nvim-nio",
      "https://github.com/rcarriga/nvim-dap-ui"
    },
  },
}
