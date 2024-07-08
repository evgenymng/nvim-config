local function on_attach(client, bufnr)
    local keymap = vim.keymap
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local goto_preview = require("goto-preview")

    opts.desc = "[g]o [p]review definition"
    keymap.set("n", "gp", goto_preview.goto_preview_definition, opts)
    opts.desc = "[g]o [p]review [t]ype definition"
    keymap.set("n", "gpt", goto_preview.goto_preview_type_definition, opts)
    opts.desc = "[g]o [p]review [i]mplementation"
    keymap.set("n", "gpi", goto_preview.goto_preview_implementation, opts)
    opts.desc = "[g]o [p]review [D]eclaration"
    keymap.set("n", "gpD", goto_preview.goto_preview_declaration, opts)
    opts.desc = "[g]o un[P]review (close windows)"
    keymap.set("n", "gP", goto_preview.close_all_win, opts)
    opts.desc = "[g]o [p]review [r]eferences"
    keymap.set("n", "gpr", goto_preview.goto_preview_references, opts)
end

local function config()
    require("goto-preview").setup({
        width = 80,
        height = 10,
        border = {"╭", "─" ,"╮", "│", "╯", "─", "╰", "│"},
        resizing_mappings = false,
        dismiss_on_move = true,
        on_attach = on_attach, -- doesn't work
    })
end

return {
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = config,
}
