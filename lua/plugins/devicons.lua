local M = {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    commit = "aff5f50b34754335a312c9b3dc5b245f605ce437",
}
function M.config()
    local devicons = require("nvim-web-devicons")

    devicons.set_icon({
        astro = {
            --  󱓟 
            icon = "󱓞",
            color = "#FF7E33",
            name = "astro",
        },
    })
end

return M
