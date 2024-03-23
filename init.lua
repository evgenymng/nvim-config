require("settings")

-- register new filetype "typst" for Typst source files
vim.filetype.add({
    extension = {
        typ = "typst",
    },
})

-- lazy plugin manager
require("lazy-config")
