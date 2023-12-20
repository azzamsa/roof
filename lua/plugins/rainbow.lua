local M = {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    commit = "dde3084106a70b9a79d48f426f6d6fec6fd203f7",
}

function M.config()
    require("colorizer").setup()
end

return M
