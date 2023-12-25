return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        commit = "c19b9023842697ec92caf72cd3599f7dd7be4456",
        config = function()
            require("kanagawa").setup({
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none",
                                -- waveBlue1 is too dark for me. Hard to distinguish
                                bg_visual = "#2D4F67", -- waveBlue2, default: waveBlue1
                            },
                        },
                    },
                },
            })
            vim.cmd.colorscheme("kanagawa")
        end,
    },
}
