if not pcall(require, "telescope") then
    return
end

local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")

local extensions = {
    file_browser = {
        hijack_netrw = true,
    },
}

if pcall(require, "telescope-live-grep-args.actions") then
    extensions.live_grep_args = {
        auto_quoting = true,
        mappings = {
            i = {
                ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
            },
        },
    }

    vim.keymap.set("n", "<Leader>fl", telescope.extensions.live_grep_args.live_grep_args, { silent = true })
end

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        file_ignore_patterns = {
            "node_modules/.*",
            "venv/.*",
        },
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
            },
        },
    },
    extensions = extensions,
})

if telescope.extensions.file_browser ~= nil then
    telescope.load_extension("file_browser")

    vim.keymap.set("n", "<Leader>fe", function()
        telescope.extensions.file_browser.file_browser({ cwd = vim.fn.expand("%:p:h") })
    end, { silent = true })

    vim.keymap.set("n", "<Leader>fc", function()
        telescope.extensions.file_browser.file_browser({ cwd = "~/.config/" })
    end, { silent = true })
end


if pcall(require, "telescope._extensions.dap") then
    require("telescope").load_extension("dap")
end

vim.keymap.set("n", "<Leader>fR", telescope_builtin.resume, { silent = true })

vim.keymap.set("n", "<Leader>fg", function()
    telescope_builtin.git_files({ show_untracked = true })
end, { silent = true })
vim.keymap.set("n", "<A-g>", function()
    telescope_builtin.git_files({ show_untracked = true })
end, { silent = true })

vim.keymap.set("n", "<Leader>ff", function()
    telescope_builtin.find_files({ hidden = true })
end, { silent = true })
vim.keymap.set("n", "<A-f>", function()
    telescope_builtin.find_files({ hidden = true })
end, { silent = true })

vim.keymap.set("n", "<Leader>fb", telescope_builtin.buffers, { silent = true })
vim.keymap.set("n", "<A-b>", telescope_builtin.buffers, { silent = true })

vim.keymap.set("n", "<Leader>fh", telescope_builtin.help_tags, { silent = true })

vim.keymap.set("n", "<Leader>fr", telescope_builtin.lsp_references, { silent = true })
vim.keymap.set("n", "<A-r>", telescope_builtin.lsp_references, { silent = true })

vim.keymap.set("n", "<Leader>fE", telescope_builtin.diagnostics, { silent = true })

vim.keymap.set("n", "<Leader>fm", telescope_builtin.man_pages, { silent = true })
