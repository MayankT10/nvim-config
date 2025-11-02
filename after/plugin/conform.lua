-- require("conform").setup({
--   formatters_by_ft = {
--     lua = { "stylua" },
--     python = { "isort", "black" },
--     rust = { "rustfmt", lsp_format = "fallback" },
--     javascript = { "prettierd", "prettier", stop_after_first = true },
--     c = { "clang_format" },
--     cpp = { "clang_format" },
--   },
--
--   formatters = {
--     clang_format = {
--       prepend_args = { "-style={IndentWidth: 4, UseTab: Never}" },
--     },
--     stylua = {
--       prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
--     },
--     prettier = {
--       prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
--     },
--     prettierd = {
--       prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
--     },
--   },
-- })
--

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        c = { "clang_format" },
        cpp = { "clang_format" },
        java = { "google-java-format", lsp_format = "fallback" },
    },

    formatters = {
        clang_format = {
            prepend_args = { "-style={IndentWidth: 4, UseTab: Never}" },
        },
        stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        },
        prettier = {
            prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
        },
        prettierd = {
            prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
        },
        ["google-java-format"] = {
            prepend_args = { "--aosp" }, -- optional, use "--aosp" for Android style or remove for Google default
        },
    },
})

-- Keymap: Manual formatting
-- vim.keymap.set({ "n", "v" }, "<leader>f", function()
--   require("conform").format({ async = true })
-- end, { desc = "Format code" })

-- -- Auto-format on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = {
--     "*.lua",
--     "*.py",
--     "*.rs",
--     "*.js",
--     "*.jsx",
--     "*.ts",
--     "*.tsx",
--     "*.html",
--     "*.css",
--     "*.json",
--     "*.c",
--     "*.cpp",
--   },
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })
-- require("conform").setup({
--     -- Map of filetype to formatters
--     formatters_by_ft = {
--         lua = { "stylua" },
--         go = { "goimports", "gofmt" },
--         c_and_cpp = { "clang-format" , "astyle"},
--         rust = { "rustfmt", lsp_format = "fallback" },
--         python = function(bufnr)
--             if require("conform").get_formatter_info("ruff_format", bufnr).available then
--                 return { "ruff_format" }
--             else
--                 return { "isort", "black" }
--             end
--         end,
--         ["*"] = { "codespell" },
--         ["_"] = { "trim_whitespace" },
--     },
--     default_format_opts = {
--         lsp_format = "fallback",
--     },
--     format_on_save = {
--         lsp_format = "fallback",
--         timeout_ms = 500,
--     },
--     format_after_save = {
--         lsp_format = "fallback",
--     },
--     log_level = vim.log.levels.ERROR,
--     notify_on_error = true,
--     notify_no_formatters = true,
--     formatters = {
--         my_formatter = {
--             command = "my_cmd",
--             args = { "--stdin-from-filename", "$FILENAME" },
--             range_args = function(self, ctx)
--                 return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
--             end,
--             -- Send file contents to stdin, read new contents from stdout (default true)
--             -- When false, will create a temp file (will appear in "$FILENAME" args). The temp
--             -- file is assumed to be modified in-place by the format command.
--             stdin = true,
--             -- A function that calculates the directory to run the command in
--             cwd = require("conform.util").root_file({ ".editorconfig", "package.json" }),
--             -- When cwd is not found, don't run the formatter (default false)
--             require_cwd = true,
--             -- When stdin=false, use this template to generate the temporary file that gets formatted
--             tmpfile_format = ".conform.$RANDOM.$FILENAME",
--             -- When returns false, the formatter will not be used
--             condition = function(self, ctx)
--                 return vim.fs.basename(ctx.filename) ~= "README.md"
--             end,
--             -- Exit codes that indicate success (default { 0 })
--             exit_codes = { 0, 1 },
--             -- Environment variables. This can also be a function that returns a table.
--             env = {
--                 VAR = "value",
--             },
--             -- Set to false to disable merging the config with the base definition
--             inherit = true,
--             -- When inherit = true, add these additional arguments to the beginning of the command.
--             -- This can also be a function, like args
--             prepend_args = { "--use-tabs" },
--             -- When inherit = true, add these additional arguments to the end of the command.
--             -- This can also be a function, like args
--             append_args = { "--trailing-comma" },
--         },
--         -- These can also be a function that returns the formatter
--         other_formatter = function(bufnr)
--             return {
--                 command = "my_cmd",
--             }
--         end,
--     },
-- })
--
-- -- You can set formatters_by_ft and formatters directly
-- require("conform").formatters_by_ft.lua = { "stylua" }
-- require("conform").formatters.my_formatter = {
--     command = "my_cmd",
-- }
