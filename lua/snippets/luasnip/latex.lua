local ls = require 'luasnip'

local txtnode = ls.text_node
local snipnode = ls.snippet_node
local funcnode = ls.function_node
local dynnode = ls.dynamic_node
local insnode = ls.insert_node
local chnode = ls.choice_node

local fmt = require 'luasnip.extras.fmt'.fmta

local avail_filetypes = {
    "tex",
    "vimwiki",
    "plaintex",
}

local begin_end_snippet = ls.snippet (
    { trig = "\\?begin", regTrig = true },
    { txtnode( {"Expa{nded", "Sni}ppet"} ) }
    )

local avail_snippets = {
    begin_end_snippet
}

for _, ftp in ipairs(avail_filetypes) do

    if not ls.snippets[ftp] then
        ls.snippets[ftp] = {}
    end

    for _, snip in ipairs(avail_snippets) do
        table.insert(ls.snippets[ftp], snip)
    end

end
