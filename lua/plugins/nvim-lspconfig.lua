local function on_attach(client, bufnr)
    local keymap = vim.keymap
    local opts = { buffer = bufnr, noremap = true, silent = true }

    opts.desc = "Show LSP references"
    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    opts.desc = "Show LSP definitions"
    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    opts.desc = "Show LSP implementations"
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    opts.desc = "Show LSP type definition"
    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    opts.desc = "Show documentation for what's under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)
    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
end

local function config()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
        "pylsp",
        "pyright",
        "clangd",
        "rust_analyzer",
        "typst_lsp",
        "lua_ls",
        "ruff_lsp",
        "gopls",
        "htmx",
    }

    local settings = {
        typst_lsp = {
            exportPdf = "onSave",
            serverPath = ""
        },
        pylsp = {
            plugins = {
                ruff = {
                    enabled = true,
                    extendSelect = { "I", "E", "F" },
                    format = { "I" },
                    unsafeFixes = false,
                },
                mypy = {
                    enabled = true,
                },
            },
        },
        Lua = {
            diagnostics = {
                globals = { "vim", "require" }
            }
        },
        ["rust-analyzer"] = {
            procMacro = {
                ignored = {
                    leptos_macro = {
                        "component",
                        "server",
                    },
                },
            },
        },
    }

    for _, server in ipairs(servers) do
        local params = {}

        if server == "lua_ls" then
            params.on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    }
                })
            end
        end

        params.settings = settings
        params.on_attach = on_attach
        params.capabilities = capabilities

        lspconfig[server].setup(params)
    end
end

return {
    "neovim/nvim-lspconfig",
    -- name = "lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
        "ray-x/lsp_signature.nvim",
        "j-hui/fidget.nvim",
    },
    config = config,
}
