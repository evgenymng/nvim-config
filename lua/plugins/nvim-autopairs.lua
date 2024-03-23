return {
    "windwp/nvim-autopairs",
    event = "BufRead",
    config = function()
        require("nvim-autopairs").setup()
    end
}
