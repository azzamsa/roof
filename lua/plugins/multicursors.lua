local M = {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    commit = "8e876fe9db46c1b76c151202b418df21eca07bad",
    dependencies = {
        "smoka7/hydra.nvim",
        commit = "3ced42c0b6a6c85583ff0f221635a7f4c1ab0dd0",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
}

function M.config()
    require("multicursors").setup({
        -- Any hint position has the potential to cover the target text.
        hint_config = false,
    })
end
return M
