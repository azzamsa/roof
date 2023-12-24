local M = {
    "stevearc/conform.nvim",
    commit = "8b407bb6175846cdc4c499e2a8d28109615a2089",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
}

function M.config()
    local conform = require("conform")

    conform.formatters.stylua = {
        prepend_args = function()
            local config = require("configs.utils").config_path("stylua.toml")
            if config then
                return { "--config-path", config }
            end
        end,
        -- Don't run in case `stylua.toml` doesn't exist
        condition = function()
            return require("configs.utils").config_path("stylua.toml")
        end,
    }

    conform.setup({
        format_on_save = function(_)
            if vim.g.autoformat then
                -- not recommended to change
                return { timeout_ms = 3000, async = false, quiet = false }
            end
            return
        end,
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
        },
    })
end

return M
