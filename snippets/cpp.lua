local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

vim.keymap.set("n", "<leader>M", function()
  ls.snip_expand(s("maincpp", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "typedef long long ll;",
      "#define fo(i, n) for (i = 0; i < n; i++)",
      "#define pb push_back",
      "",
      "void solve() {",
    }),
    i(1),  -- cursor lands HERE (inside solve)
    t({
      "}",
      "",
      "int main() {",
      "    ios::sync_with_stdio(false);",
      "    cin.tie(nullptr);",
      "    int t;",
      "    cin >> t;",
      "    while (t--)",
      "        solve();",
      "    return 0;",
      "}",
    }),
  }))
end, { desc = "Insert C++ main template" })
