function bind_keys(opts)
    local dap = require("dap")
    local dap_widgets = require("dap.ui.widgets")

    local keymap = vim.keymap
    opts.desc = "Resume debug execution"
    keymap.set("n", "<leader>dc", dap.continue, opts)
    opts.desc = "Toggle DAP REPL"
    keymap.set("n", "<leader>dr", dap.repl.toggle, opts)
    opts.desc = "More information for what's under cursor"
    keymap.set("n", "<leader>dK", dap_widgets.hover, opts)
    opts.desc = "Toggle debug breakpoint"
    keymap.set("n", "<leader>dt", dap.toggle_breakpoint, opts)
    opts.desc = "Debug step over"
    keymap.set("n", "<leader>dso", dap.step_over, opts)
    opts.desc = "Debug step into"
    keymap.set("n", "<leader>dsi", dap.step_into, opts)
    opts.desc = "Re-run the last debug adapter"
    keymap.set("n", "<leader>dl", dap.run_last, opts)
end

return {
    bind_keys,
}
