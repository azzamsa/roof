local M = {
    "cappyzawa/trim.nvim",
    event = "VeryLazy",
    commit = "629b96a303a3a0bb5fd050e6cd9d627ca7831cc7",
}

function M.config()
    require("trim").setup({
        trim_on_write = false,
    })
end

return M
