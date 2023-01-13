local utils = require("akshettrj.utils")
local cmp = require("cmp")
local luasnip_available = utils.is_module_available("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            if luasnip_available then
                require("luasnip").lsp_expand(args.body)
            end
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Down>"] = cmp.mapping.select_next_item({
            behaviour = cmp.SelectBehavior.Select
        }),
        ["<Up>"] = cmp.mapping.select_prev_item({
            behaviour = cmp.SelectBehavior.Select
        }),
        ["<Right>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if not luasnip_available then
                return
            end
            -- if cmp.visible() then
            --     cmp.select_next_item({ behaviour = cmp.SelectBehavior.Select }),
            local luasnip = require("luasnip")
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif fallback ~= nil then
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            -- if cmp.visible() then
            --     cmp.select_prev_item({ behaviour = cmp.SelectBehavior.Select }),
            if luasnip_available then
                print("luasnip avail")
                local luasnip = require("luasnip")
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                elseif fallback ~= nil then
                    fallback()
                end
            elseif fallback ~= nil then
                fallback()
            else
                print("luasnip not avail")
            end
        end, { "i", "s" }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "latex_symbols" },
        { name = "buffer" },
    },
    experimental = {
        native_menu = false,
    },
    formatting = {
        format = function(entry, vim_item)
            if utils.is_module_available("lspkind") then
                vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
        end
            vim_item.menu = ({
                npm = "",
                buffer = "﬘",
                nvim_lsp = "",
                luasnip = "",
                nvim_lua = "",
                emoji = "ﲃ",
                latex_symbols = "",
                treesitter = "滑",
                path = "",
                zsh = "",
                spell = "暈",
                rg = "縷",
            })[entry.source.name]
            return vim_item
        end,
    },
})
