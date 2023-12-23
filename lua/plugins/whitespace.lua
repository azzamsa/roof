-- Using autocmd and hacky regex always match trailing whitespace
-- during typing.
local M = {
    "kaplanz/retrail.nvim",
    event = "VeryLazy",
    commit = "fda098e4b91b98dd4e04a9a87537cf70c25ea2ad",
}

function M.config()
    local retrail = require("retrail")

    retrail.setup({
        -- Trimming already handled by conform
        trim = {
            -- Auto trim on BufWritePre
            auto = false,
        },
    })
end

return M
