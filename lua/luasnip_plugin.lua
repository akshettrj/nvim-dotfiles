local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require("luasnip.util.events")

ls.config.setup {
  -- Might be unnecessary
  history = true,

  -- Will update the dynamic snippets as I type
  updateevents = "TextChanged,TextChangedI",

  region_check_events = "CursorHold,CursorHoldI",

  enable_autosnippets = nil,

  -- Crazy Highlights
  ext_opts = nil,

}

--[[ local latex_snips = {
  s("frac", {
    t({"\\dfrac{"}), i(1), t({"}{"}), i(2), t({"}"}), i(0)
  }),
  s("math", {
    t({"$"}), i(1), t({"$"}), i(0)
  }),
  s("cdot", {
    t({"{"}), i(1), t({"}\\cdot{"}), i(2), t({"}"}), i(0)
  }),
  s("Math", {
    t({"{{$", ""}), i(1), t({"", "}}$", ""}), i(0)
  }),
  s("rndbr", {
    t({"\\left("}), i(1), t({"\\right)"}), i(0)
  }),
  s("sqrbr", {
    t({"\\left["}), i(1), t({"\\right]"}), i(0)
  }),
  s("set", {
    t({"\\left\\{"}), i(1), t({"\\right\\}"}), i(0)
  }),
  s("txt", {
    t({"\\text{"}), i(1), t({"}"}), i(0)
  }),
  s("partial", {
    t({"\\dfrac{\\partial{"}), i(1), t({"}}{\\partial{"}), i(2), t({"}}"}), i(0)
  }),
  s("begin", {
    t({"\\begin{"}), i(1), t({"}", ""}), i(2), t({"", "\\end{"}), i(1), t({"}", ""}), i(0)
  }),
} ]]

local latex_snips = {
  s({trig="begin"}, {
      t { "\\begin{" }, i (1, "argument"), t { "}", "" },
      i (2, "body"),
      t { "", "\\end{" }, d (nil, function(args)
        return t (args[1][1])
      end, {1}, "arg"), t { "}" }, i(0)
    })
}

ls.snippets = {
    all = {
    s({trig="cp"}, {
      t({"#include \"bits/stdc++.h\""}),
      t({"using namespace std;"}),
      t({"#define max(a, b) (a < b ? b : a)"}),
      t({"#define min(a, b) ((a > b) ? b : a)"}),
      t({"#define rep(i, begin, end) for (__typeof(end) i = (begin) - ((begin) > (end)); i != (end) - ((begin) > (end)); i += 1 - 2 * ((begin) > (end)))"}),
      t({"#define INF 1000000000000000003"}),
      t({"typedef long long int ll;"}),
      t({"typedef vector<ll> vi;"}),
      t({"typedef vector<vector<ll>> vvi;"}),
      t({"#define ff first"}),
      t({"#define ss second"}),
      t({"#define pb push_back"}),
      t({"#define eb emplace_back"}),
      t({"#define pob pop_back"}),
      t({"#define mp make_pair"}),
      t({"#define mt make_tuple"}),
      t({"#define endl \"\n\""}),
      t({"void solve()"}),
      t({"{"}),
             i(1, "this"),
      t({"}"}),
      t({""}),
      t({"int main()"}),
      t({"{"}),
      t({"    ios::sync_with_stdio(false);"}),
      t({"    cin.tie(nullptr);"}),
      t({"    cout.tie(nullptr);"}),
      t({"    int t;cin >> t;while(t--)"}),
      t({"    solve();"}),
      t({"    return 0;"}),
      t({"}"}),
    })
  },
  -- tex = {
  --   s("ls", {
  --       t({"\\begin{itemize}",
  --         "\t\\item "}), i(1), d(2, rec_ls, {}),
  --     t({"", "\\end{itemize}"}), i(0)
  --   }),
  -- },
  -- vimwiki = latex_snips
}

require ("luasnip/loaders/from_vscode").lazy_load()
require "snippets.luasnip.utils"
require "snippets.luasnip.latex"
require "snippets.luasnip.cpp"
require "snippets.luasnip.helpers"
