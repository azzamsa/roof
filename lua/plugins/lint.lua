local M = {
    "mfussenegger/nvim-lint",
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    commit = "32f98300881f38f4e022391f240188fec42f74db",
}

function M.config()
    local lint = require("lint")

    lint.linters.luacheck.args = {
        "--config",
        require("configs.utils").config_path("luacheckrc"),
        "--formatter",
        "plain",
        "--codes",
        "--ranges",
        "-",
    }

    lint.linters_by_ft = {
        lua = { "luacheck" },
        yaml = { "actionlint" },
    }
end

return M
