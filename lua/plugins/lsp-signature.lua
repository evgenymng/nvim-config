return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function(_, opts)
        local lsp_signature = require("lsp_signature")

        lsp_signature.setup(opts)

        vim.keymap.set({ "n", "i" }, "<C-k>", function()
            lsp_signature.toggle_float_win()
        end, { silent = true, noremap = true, desc = "Toggle signature" })
    end
}
