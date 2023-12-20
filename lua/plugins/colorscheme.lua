-- local M = {
--     "catppuccin/nvim",
--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
--     commit = "079500a625f3ae5aa6efb758f1a17fe4c7a57e52",
--     name = "catppuccin",
--     opts = {
--         -- Disabled by default.
--         -- Must be enabled; otherwise, lazygit and vtrem use an ugly colorscheme.
--         term_colors = true,
--     },
-- }

local M = {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    commit = "f247ee700b569ed43f39320413a13ba9b0aef0db",
}

function M.config()
    require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    })
    -- vim.cmd.colorscheme("catppuccin")
    vim.cmd.colorscheme("tokyonight")
end

return M
