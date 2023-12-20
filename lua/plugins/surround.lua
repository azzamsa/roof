local M = {
    -- rename surround mappings from gs to gz to prevent conflict with leap
    "echasnovski/mini.surround",
    commit = "7bf8915ba15d7a4f3c2afe7868d3c15a858d73f1",
    opts = {
        mappings = {
            add = "sa", -- Add surrounding in Normal and Visual modes
            delete = "sd", -- Delete surrounding
            find = "sf", -- Find surrounding (to the right)
            find_left = "sF", -- Find surrounding (to the left)
            highlight = "sh", -- Highlight surrounding
            replace = "sr", -- Replace surrounding
            update_n_lines = "sn", -- Update `n_lines`
        },
    },
}

return M
