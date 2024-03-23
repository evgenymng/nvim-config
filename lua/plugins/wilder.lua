return {
    "gelguy/wilder.nvim",
    event = { "CmdlineEnter", "CmdwinEnter" },
    config = function()
        local wilder = require("wilder")

        wilder.set_option("renderer", wilder.popupmenu_renderer(
            wilder.popupmenu_border_theme({
                border = "rounded",
                highlighter = wilder.basic_highlighter(),
                max_height = "50%",
                max_width = "50%",
                min_height = "0",
                prompt_position = "top",
                reverse = 0,
            })
        ))

        wilder.setup({
            modes = {":", "?"},
            next_key = "<C-J>",
            previous_key = "<C-K>",
            -- accept_key = "<CR>",
            reject_key = "<C-E>",
        })
    end,
}
