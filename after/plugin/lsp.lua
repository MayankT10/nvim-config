-- Keybinds
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "References" })
-- vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { desc = "Rename" })
-- vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
vim.keymap.set("n", "<leader>e", function()
    vim.diagnostic.open_float(0, {
        scope = "line", -- show diagnostics for current line only
        border = "rounded", -- rounded border
        focusable = false, -- float does not steal focus
        max_width = 80, -- wrap long lines
        style = "minimal", -- remove extra window decorations
        winhighlight = "NormalFloat:Normal,FloatBorder:Normal", -- transparent look
    })
end, { desc = "Show Diagnostics (Transparent Float)" })

local capabilities = require("blink.cmp").get_lsp_capabilities()

local on_attach = function(_, _)
    vim.lsp.inlay_hint.enable(true)
end

vim.diagnostic.config({
    virtual_text = {
        prefix = "»",
        spacing = 4,
        source = "if_many",
        -- format = function(diagnostic)
        -- 	local message = diagnostic.message
        -- 	local width = 80 -- wrap after 80 characters
        -- 	local wrapped = {}
        -- 	for line in message:gmatch("[^\n]+") do
        -- 		while #line > width do
        -- 			table.insert(wrapped, line:sub(1, width))
        -- 			line = line:sub(width + 1)
        -- 		end
        -- 		table.insert(wrapped, line)
        -- 	end
        -- 	return table.concat(wrapped, "\n")
        -- end,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        source = "if_many",
        border = "rounded",
    },
})

-- -- Auto-format JS/JSX/TS/TSX on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

vim.lsp.config["lua_ls"] = {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
}

-- Rust
vim.lsp.config["rust_analyzer"] = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            check = { command = "clippy" },
            inlayHints = {
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true, minLines = 4 },
                closureCaptureHints = { enable = true },
                closureReturnTypeHints = { enable = "always" },
                discriminantHints = { enable = "always" },
                implicitDrops = { enable = true },
                implicitSizedBoundHints = { enable = true },
                lifetimeElisionHints = { enable = true },
            },
        },
    },
}


-- Java
vim.lsp.config["jdtls"] = {
    capabilities = capabilities,
    cmd = { "jdtls" },
    root_dir = vim.fs.root(0, { ".git", "pom.xml", "build.gradle" }),
    settings = {
        java = {
            format = {
                enabled = true,
            },
        },
    },
}

-- C/C++
vim.lsp.config["clangd"] = {
    capabilities = capabilities,
    cmd = { "clangd", "--fallback-style=LLVM" },
}

-- Python
vim.lsp.config["basedpyright"] = {
    capabilities = capabilities,
}

-- Web dev
for _, server in ipairs({ "ts_ls", "html", "cssls", "jsonls", "tailwindcss" }) do
    vim.lsp.config[server] = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
-- Emmet
vim.lsp.config["emmet_ls"] = {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "javascriptreact", "typescriptreact" },
}

-- for name, config in pairs(vim.lsp.config) do
-- 	vim.lsp.start(config)
-- end

for name, config in pairs(vim.lsp.config) do
    if config.cmd ~= nil then
        vim.lsp.start(config)
    else
    end
end
