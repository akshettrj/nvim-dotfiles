if not pcall(require, "dap") then
    return
end

local dap = require("dap")

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<Leader>dr", dap.repl.open)

vim.keymap.set("n", "<F10>", dap.step_into)
vim.keymap.set("n", "<F11>", dap.step_over)
vim.keymap.set("n", "<F12>", dap.step_out)

vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>dB", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint Condition: "))
end)

if pcall(require, "dapui") then
    local dapui = require("dapui")

    dapui.setup()
    vim.keymap.set("n", "<Leader>du", dapui.toggle)

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

if pcall(require, "nvim-dap-virtual-text") then
    require("nvim-dap-virtual-text").setup()
end

if pcall(require, "dap-go") then
    require("dap-go").setup()
end

if pcall(require, "dap-python") then
    require("dap-python").setup("~/.config/nvim/debuggers/debugpy/bin/python")
end
