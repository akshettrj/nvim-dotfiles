local ls = require 'luasnip'

local txtnode = ls.text_node
local snipnode = ls.snippet_node
local funcnode = ls.function_node
local dynnode = ls.dynamic_node
local insnode = ls.insert_node
local chnode = ls.choice_node

local fmt = require 'luasnip.extras.fmt'.fmta

local function same (num)
    print(num)
end
