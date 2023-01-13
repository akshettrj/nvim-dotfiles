local utils = require("akshettrj.utils")
local lspconfig = require("lspconfig")
local uv = vim.loop

local capabilities = nil
if utils.is_module_available("cmp_nvim_lsp") then
    capabilities = require("cmp_nvim_lsp").default_capabilities()
end

local on_attach = function(client, bufnr)
    if utils.is_module_available("lsp_signature") then
        require("lsp_signature").on_attach()
    end

    if client.name ~= "efm" then
        if utils.is_module_available("nvim-navic") then
            require("nvim-navic").attach(client, bufnr)
        end
    end

    local keymap_opts = { silent = true, buffer = true }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)

    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover({ border = "single" })
    end, keymap_opts)

    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, keymap_opts)
    vim.keymap.set("n", "<Leader>ld", vim.lsp.buf.type_definition, keymap_opts)
    vim.keymap.set("n", "<Leader>lca", vim.lsp.buf.code_action, keymap_opts)
    vim.keymap.set("n", "<Leader>lf", vim.lsp.buf.format, keymap_opts)
    vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, keymap_opts)
    vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, keymap_opts)
    vim.keymap.set("n", "]e", vim.diagnostic.goto_next, keymap_opts)
    vim.keymap.set("n", "<Leader>lel", vim.diagnostic.setloclist, keymap_opts)
end

lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--background-index",
        "--cross-file-rename",
        "--clang-tidy",
        "--completion-style=bundled",
    },
})


lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "pyright", "--stdio" },
    filetypes = { "python" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        },
    },
})


lspconfig.efm.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    init_options = { documentFormatting = true },
    filetypes = { "python" },
    settings = {
        rootMarkers = { ".git/", "requirements.txt" },
        languages = {
            python = {
                {
                    formatCommand = "black --quiet -",
                    formatStdin = true,
                },
            },
        },
    },
})


lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})


lspconfig.gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                asmdecl = true,
                assign = true,
                atomic = true,
                atomicalign = true,
                bools = true,
                buildssa = true,
                buildtag = true,
                cgocall = true,
                composite = true,
                copylock = true,
                ctrlflow = true,
                deepequalerrors = true,
                errorsas = true,
                fieldalignment = true,
                findcall = true,
                framepointer = true,
                httpresponse = true,
                ifaceassert = true,
                inspect = true,
                internal = true,
                loopclosure = true,
                lostcancel = true,
                nilfunc = true,
                nilness = true,
                pkgfact = true,
                printf = true,
                reflectvaluecompare = true,
                shadow = true,
                shift = true,
                sigchanyzer = true,
                sortslice = true,
                stdmethods = true,
                stringintconv = true,
                structtag = true,
                testinggoroutine = true,
                tests = true,
                timeformat = true,
                unmarshal = true,
                unreachable = true,
                unsafeptr = true,
                unusedresult = true,
                unusedwrite = true,
                usesgenerics = true,
            },
        },
    },
})


lspconfig.golangci_lint_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})


lspconfig.taplo.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

local sumneko_root_path = os.getenv("HOME") .. "/.config/nvim/lsp/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local sumneko_workspace_library = {
    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
    [vim.fn.expand("/usr/share/awesome/lib")] = true,
}

--[[ local plugins_path = vim.fn.expand("$XDG_DATA_HOME/nvim/plugged")
uv.fs_scandir(plugins_path, function(err1, success)
    if err1 ~= nil then return end

    while true do
        local f_name, f_type = uv.fs_scandir_next(success)

        if f_name == nil then break end
        if f_type ~= "directory" then goto continue end

        local lua_dir_path = plugins_path .. "/" .. f_name .. "/lua"
        uv.fs_realpath(lua_dir_path, function(err2, path)
            if err2 ~= nil then return end
            sumneko_workspace_library[path] = true
        end)
        ::continue::
    end
end) ]]

lspconfig.sumneko_lua.setup({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
            completion = { enable = true, callSnippet = "Both" },
            diagnostics = {
                enable = true,
                globals = { "vim", "describe", "awesome", "client", "screen", "root" },
                disable = { "lowercase-global" },
            },
            workspace = {
                library = sumneko_workspace_library,
                -- adjust these two values if your performance is not optimal
                maxPreload = 2000,
                preloadFileSize = 1000,
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4",
                },
            },
        },
    },
})
