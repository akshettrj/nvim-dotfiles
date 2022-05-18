local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)

  require'lsp_signature'.on_attach()

  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true, buffer=0 }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<LeftMouse>', '<LeftMouse><cmd>lua vim.lsp.buf.hover({border = "single"})<CR>', opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({border="single"}) end, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, opts)
  vim.keymap.set('n', '<LeftMouse>', '<LeftMouse><cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.keymap.set('n', '<RightMouse>', '<LeftMouse><cmd>lua vim.lsp.buf.definition()<CR>', opts)

end

-- C/C++

require'lspconfig'.clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--cross-file-rename",
    "--clang-tidy",
    "--completion-style=bundled"
  },
  -- root_dir = vim.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")
}

-- Javascript

require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- Python

require'lspconfig'.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      }
    }
  },
  -- single_file_support = false
}

-- CSS

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- BASH

require'lspconfig'.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require'lspconfig'.dockerls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require'lspconfig'.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require'lspconfig'.vimls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require'lspconfig'.rust_analyzer.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- Flutter

-- require'flutter-tools'.setup{}


-- Lua <<<

-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
  sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lsp/lua-language-server"
  sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lsp/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
  sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
  sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
else
  print("Unsupported system for sumneko")
end

--[[
require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          ["${3rd}/love2d/library"]
        = true};
        maxPreload = 2000;
        preloadFileSize = 1000;
        checkThirdParty = false
      }
    }
  }
}
--]]

-- put this file somewhere in your nvim config, like: ~/.config/nvim/lua/config/lua-lsp.lua
-- usage: require'lspconfig'.sumneko_lua.setup(require("config.lua-lsp"))

local library = {}

local path = vim.split(package.path, ";")

-- this is the ONLY correct way to setup your path
table.insert(path, "lua/?.lua")
table.insert(path, "lua/?/init.lua")

local function add(lib)
  for _, p in pairs(vim.fn.expand(lib, false, true)) do
    p = vim.loop.fs_realpath(p)
    if p ~= nil then
      library[p] = true
    end
  end
end

-- add runtime
local runtimes = vim.api.nvim_list_runtime_paths()
for _,runtime in ipairs(runtimes) do
  add(runtime)
end

-- add your config
add("~/.config/nvim")

-- add plugins
-- if you're not using packer, then you might need to change the paths below
add("~/.local/share/nvim/site/pack/packer/opt/*")
add("~/.local/share/nvim/site/pack/packer/start/*")

local awesome_config = (os.getenv("PWD") == "/home/akshettrj/.config/awesome")
if awesome_config  then
  add("/usr/share/awesome/lib")
end

require'lspconfig'.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  -- delete root from workspace to make sure we don't trigger duplicate warnings
  on_new_config = function(config, root)
    local libs = vim.tbl_deep_extend("force", {}, library)
    libs[root] = nil
    config.settings.Lua.workspace.library = libs
    return config
  end,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = path
      },
      completion = { callSnippet = "Both" },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = awesome_config and { "vim", "use", "awesome", "client", "root" } or { "vim", "use", "client", "root" }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = library,
        maxPreload = 2000;
        preloadFileSize = 1000;
        checkThirdParty = false
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false }
    }
  }
}

-- >>>
