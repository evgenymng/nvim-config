local function on_attach(_, bufnr)
    vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { buf = bufnr, desc = "Move line down" })
    vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { buf = bufnr, desc = "Move line up" })
    vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { buf = bufnr, desc = "Move line down" })
    vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { buf = bufnr, desc = "Move line up" })
    vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { buf = bufnr, desc = "Move line down" })
    vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { buf = bufnr, desc = "Move line up" })
end

local function config()
    local treesitter_configs = require("nvim-treesitter.configs")
    treesitter_configs.setup({
        ensure_installed = {
            "c",
            "cpp",
            "css",
            "lua",
            "go",
            "html",
            "python",
            "rust",
            "vimdoc",
            "vim",
            "svelte",
            "javascript",
            "typescript",
            "markdown",
            "markdown_inline"
        },
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        on_attach = on_attach, -- doesn't work
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = config,
    on_attach = on_attach,
}
