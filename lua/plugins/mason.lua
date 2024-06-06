return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    event = "VeryLazy",
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✔",
                    package_pending = "➔",
                    package_uninstalled = "✗",
                }
            }
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "ruff_lsp",
                "pyright",
                "lua_ls",
                "rust_analyzer",
                "typst_lsp",
                "texlab",
                "clangd",
                "gopls",
                "tsserver",
                "svelte",
                "vuels",
                "cssls",
                "golangci_lint_ls",
            },
        })
    end,
}
