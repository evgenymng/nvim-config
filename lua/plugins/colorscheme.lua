return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            terminalColors = true,
            transparent = true,
        })

        vim.cmd("colorscheme kanagawa-lotus")

        vim.api.nvim_set_hl(0, "FloatTitle", { bg="none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg="none" })
        vim.api.nvim_set_hl(0, "FloatFooter", { bg="none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg="none" })

        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg="none" })
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg="none" })

        -- vim.api.nvim_set_hl(0, "Visual", { bg = "#303030" })
        vim.api.nvim_set_hl(0, "Visual", { bg = "#C0C0C0" })

        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })

        vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#303030" })
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#C0C0C0" })
        vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" })
        vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "none" })
        vim.api.nvim_set_hl(0, "PmenuBorder", { bg = "none" })
    end
}
