local Icons = require("configs.icons")

return {
    -- Status line.
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            --- Multi cursor
            local function mc_is_active()
                local ok, hydra = pcall(require, "hydra.statusline")
                return ok and hydra.is_active()
            end

            local function mc_get_name()
                local ok, hydra = pcall(require, "hydra.statusline")
                if ok then
                    return hydra.get_name()
                end
                return ""
            end

            local function ws_get_name()
                local name = require("workspaces").name()
                if name then
                    return name
                else
                    return ""
                end
            end

            require("lualine").setup({
                options = {
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    ignore_focus = { "Neotree" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        { "filename", path = 4 },
                    },
                    lualine_c = {
                        "location",
                        -- Multi cursors
                        { mc_get_name, cond = mc_is_active },
                    },
                    lualine_x = { "diagnostics", ws_get_name },
                    lualine_y = { "filetype" },
                    lualine_z = { { "branch", icon = "" } },
                },
            })
        end,
    },
    -- Scrollbar
    {
        "petertriho/nvim-scrollbar",
        event = "VeryLazy",
        config = function()
            require("scrollbar").setup()
        end,
    },
    -- Replaces the UI for messages, cmdline and the popupmenu.
    {
        "folke/noice.nvim",
        tag = "stable",
        event = "VeryLazy",
        dependencies = {},
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
            })
        end,
    },
    -- A winbar that uses LSP to display current code context.
    {
        "LunarVim/breadcrumbs.nvim",
        config = function()
            require("breadcrumbs").setup()
        end,
        dependencies = {
            "SmiteshP/nvim-navic",
            config = function()
                require("nvim-navic").setup({
                    icons = Icons.kind,
                    highlight = true,
                    lsp = {
                        auto_attach = true,
                    },
                    click = true,
                    separator = " " .. Icons.ui.ChevronRight .. " ",
                    depth_limit = 0,
                    depth_limit_indicator = "..",
                })
            end,
        },
    },
}
