local M = {
    "fredeeb/tardis.nvim",
    event = "VeryLazy",
    commit = "21a92fbc5b3a389ab09cea6beee8784b39c99099",
}

function M.config()
    require("tardis-nvim").setup({
        keymap = {
            ["next"] = "<C-n>", -- next entry in log (older)
            ["prev"] = "<C-e>", -- previous entry in log (newer)
            ["quit"] = "q", -- quit all
            ["revision_message"] = "m", -- show revision message for current revision
        },
        initial_revisions = 10, -- initial revisions to create buffers for
        max_revisions = 256, -- max number of revisions to load
    })
end

return M
