local M = {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    commit = "smoka7/multicursors.nvim",
    dependencies = {
        "smoka7/hydra.nvim",
        commit = "3ced42c0b6a6c85583ff0f221635a7f4c1ab0dd0",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
}

return M
