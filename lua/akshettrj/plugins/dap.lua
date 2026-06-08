local utils = require("akshettrj.utils")

return {
  {
    "https://github.com/mfussenegger/nvim-dap",
    enabled = function()
      return not utils.is_inside_vscode()
    end,
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint for debugging",
      },
      {
        "<leader>dB",
        function()
          require("dap").run_to_cursor()
        end,
      },
      {
        "<leader>?",
        function()
          require("dap").eval(nil, { enter = true })
        end,
      },
      {
        "<F1>",
        function()
          require("dap").continue()
        end,
      },
      {
        "<F2>",
        function()
          require("dap").step_into()
        end,
      },
      {
        "<F3>",
        function()
          require("dap").step_over()
        end,
      },
      {
        "<F4>",
        function()
          require("dap").step_out()
        end,
      },
      {
        "<F5>",
        function()
          require("dap").step_back()
        end,
      },
      {
        "<F6>",
        function()
          require("dap").restart()
        end,
      },
      {
        "<F7>",
        function()
          require("dap").close()
        end,
      },
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      ui.setup()
      require("dap-go").setup()
      require("dap-python").setup("python")

      dap.configurations.python = dap.configurations.python or {}
      table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "Attach to debugpy (prompt port)",
        connect = {
          host = "127.0.0.1",
          port = function()
            return tonumber(vim.fn.input("debugpy port: ", "5678"))
          end,
        },
        justMyCode = false,
      })

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
