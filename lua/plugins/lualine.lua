return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = false,
                theme = "gruvbox-material",
                component_separators = {
                    left = "",
                    right = "",
                },
                section_separators = {
                    left = "",
                    right = "",
                },
                always_divide_middle = false,
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"branch", "diff"},
                lualine_c = {"filename"},
                lualine_x = {},
                lualine_y = {"filetype"},
                lualine_z = {"location"},
            },
            inactive_sections = {
                lualine_a = {"branch"},
                lualine_b = {},
                lualine_c = {"filename"},
                lualine_x = {},
                lualine_y = {"filetype"},
                lualine_z = {},
            }
        })
    end
}
