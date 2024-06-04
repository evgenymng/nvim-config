-- set leader key
vim.g.mapleader = ","

-- tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- whitespace display
vim.opt.listchars:append({ space = "·" })
vim.opt.list = false

-- line numbers and such
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.syntax = "on"

-- theme
vim.opt.background = "dark"

-- mouse
vim.opt.mouse = "a"

-- share clipboard with the system
vim.opt.clipboard:append("unnamedplus")

vim.opt.undofile = true

-- golines formatting
vim.g.go_fmt_command = "golines"
vim.g.go_fmt_options = { golines = "-m 79"}


function format_go_code()
    vim.cmd("silent! lua vim.lsp.buf.format({ async = true })")
end

vim.api.nvim_set_keymap("n", "<leader>gf", ":lua format_go_code()<CR>", { noremap = true, silent = true})
