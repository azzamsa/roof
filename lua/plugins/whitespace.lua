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
        -- Enabled filetypes.
        filetype = {
            -- Excluded filetype list. Overrides `include` list.
            exclude = {
                "toggleterm",
                "neo-tree",
                -- following are defaults that need to be added or they'll be overridden
                "",
                "alpha",
                "checkhealth",
                "diff",
                "help",
                "lspinfo",
                "man",
                "mason",
                "TelescopePrompt",
                "Trouble",
                "WhichKey",
            },
        },
        -- Trimming already handled by conform
        trim = {
            -- Auto trim on BufWritePre
            auto = false,
        },
    })
end

return M
