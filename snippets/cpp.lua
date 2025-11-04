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
      "#define ll long long",
      "#define fo(i, n) for (i = 0; i < n; i++)",
      "#define pb push_back",
      "",
      "int main() {",
      "    ll t;",
      "    cin >> t;",
      "    while (t--) {",
      "        ",
    }),
    i(1),  -- ← cursor lands here
    t({
      "    ",
      "    }",
      "}",
    }),
  }))
end, { desc = "Insert C++ main template" })
