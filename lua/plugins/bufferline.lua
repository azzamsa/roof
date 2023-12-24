local M = {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
}

function M.config()
    require("bufferline").setup({
        options = {
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    })
end

return M
