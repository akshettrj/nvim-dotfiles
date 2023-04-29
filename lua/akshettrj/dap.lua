local dap_loaded, dap = pcall(require, "dap")
if not dap_loaded then
    return
end

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<Leader>dr", dap.repl.open)

vim.keymap.set("n", "<F10>", dap.step_into)
vim.keymap.set("n", "<F11>", dap.step_over)
vim.keymap.set("n", "<F12>", dap.step_out)

vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>dB", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint Condition: "))
end)

local dapui_loaded, dapui = pcall(require, "dapui")
if dapui_loaded then
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

local ndvt_loaded, nvim_dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if ndvt_loaded then
    nvim_dap_virtual_text.setup()
end

local dap_go_loaded, dap_go = pcall(require, "dap-go")
if dap_go_loaded then
    dap_go.setup()
end

local dap_python_loaded, dap_python = pcall(require, "dap-python")
if dap_python then
    dap_python.setup("~/.config/nvim/debuggers/debugpy/bin/python")
end
