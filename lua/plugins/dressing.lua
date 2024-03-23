return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
        require("dressing").setup({
            input = {
                mappings = {
                    i = {
                        ["<C-e>"] = "Close",
                        ["<C-k>"] = "HistoryPrev",
                        ["<C-j>"] = "HistoryNext",
                    }
                }
            }
        })
    end
}
