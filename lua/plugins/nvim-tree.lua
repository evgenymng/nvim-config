local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "<leader>e", api.tree.toggle, { desc = "Toggle NvimTree" })
end

function config()
    -- disable netrw file manager
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
        view = {
            width = 30,
        },
        on_attach = on_attach,
    })
end

return {
    "nvim-tree/nvim-tree.lua",
    name = "nvim-tree",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = config,
}