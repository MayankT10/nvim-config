require("mayank")
print("Hello")

-- keybinds
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Info" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { desc = "Rename" })

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    settings = {
	lua = {
	    runtime = {
		version = "LuaJIT",
	    },
	    diagnostics = {
		globals = { "vim" },
	    },
	},
    },
})


lspconfig.clangd.setup({
    cmd = { "clangd", "--fallback-style==LLVM" },
})
