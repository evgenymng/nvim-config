local function on_attach(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        opts.noremap = true
        opts.silent = true
        vim.keymap.set(mode, l, r, opts)
    end

    map("n", "]g", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
    end, { expr = true, desc = "[g]o to the [next] hunk" })

    map("n", "[g", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
    end, { expr = true, desc = "[g]o to the [previous] hunk" })

    map("n", "<leader>hs", gs.stage_hunk, { desc = "[h]unk: [s]tage" })
    map("n", "<leader>hr", gs.reset_hunk, { desc = "[h]unk: [r]eset" })
    map("v", "<leader>hs", function()
        gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")}
    end, { desc = "[h]unk: [s]tage" })
    map("v", "<leader>hr", function()
        gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")}
    end, { desc = "[h]unk: [r]eset" })
    map("n", "<leader>hS", gs.stage_buffer, { desc = "[h]unk: [S]tage buffer"})
    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "[h]unk: [u]ndo stage"})
    map("n", "<leader>hR", gs.reset_buffer, { desc = "[h]unk: [R]eset buffer"})
    map("n", "<leader>hp", gs.preview_hunk, { desc = "[h]unk: [p]review"})
    map("n", "<leader>hb", function() gs.blame_line{full=false} end, { desc = "[h]unk: [b]lame line"})
    map("n", "<leader>hB", function() gs.blame_line{full=true} end, { desc = "[h]unk: [B]lame line (full)"})
    map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "[t]oggle [b]lame"})
    map("n", "<leader>hd", gs.diffthis, { desc = "[h]unk: diff this"})
    map("n", "<leader>hD", function() gs.diffthis("~") end, { desc = "[h]unk: [D]iff everything" })
    map("n", "<leader>td", gs.toggle_deleted, { desc = "hunk: [t]oggle [d]eleted"})
end

local function config()
    require("gitsigns").setup({
        current_line_blame = false,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
            delay = 0,
            ignore_whitespace = false,
            virt_text_priority = 100,
        },
        on_attach = on_attach,
    })
end

return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = config,
}
