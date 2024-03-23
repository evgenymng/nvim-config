return {
    "HallerPatrick/py_lsp.nvim",
    config = function()
        require("py_lsp").setup({
            default_venv_name = ".venv",
            language_server = "pylsp"
        })
    end
}
