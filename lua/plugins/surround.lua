local M = {
    "echasnovski/mini.surround",
    commit = "7bf8915ba15d7a4f3c2afe7868d3c15a858d73f1",
    opts = {
        mappings = {
            add = "gsa", -- Add surrounding in Normal and Visual modes
            delete = "gsd", -- Delete surrounding
            find = "gsf", -- Find surrounding (to the right)
            find_left = "gsF", -- Find surrounding (to the left)
            highlight = "gsh", -- Highlight surrounding
            replace = "gsr", -- Replace surrounding
            update_n_lines = "gsn", -- Update `n_lines`
        },
    },
}

return M
