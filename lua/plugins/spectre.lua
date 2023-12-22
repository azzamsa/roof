local M = {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    commit = "d8906855f1949ac97b1e77aaf8d3fe12ed158ddc",
}

function M.config()
    require("spectre").setup({ is_block_ui_break = true })
end

return M
