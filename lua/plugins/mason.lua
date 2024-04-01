return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
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
                -- "mypy",
                "ruff_lsp",
                "pyright",
                "lua_ls",
                "rust_analyzer",
                "typst_lsp",
                "texlab",
                "clangd",
            },
        })
    end,
}
