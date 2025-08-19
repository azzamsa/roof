local Icons = require("configs.icons")

return {
    -- Dashboard
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            local function random_quote()
                return require("etc.quotes").random()
            end

            local dashboard = require("alpha.themes.dashboard")
            local function button(sc, txt, keybind, keybind_opts)
                local b = dashboard.button(sc, txt, keybind, keybind_opts)
                b.opts.hl_shortcut = "Macro"
                return b
            end

            -- To be colorized correctly, it must be a valid string.
            -- Using a table and concatenation doesn't work.
            local header = {
                [[      ★ ✯   🛸        🪐   .°•         ]],
                [[          ° ★  •       🛰              ]],
                [[ ██████╗  ██████╗  ██████╗ ███████╗██╗ ]],
                [[ ██╔══██╗██╔═══██╗██╔═══██╗██╔════╝██║ ]],
                [[ ██████╔╝██║   ██║██║   ██║█████╗  ██║ ]],
                [[ ██╔══██╗██║   ██║██║   ██║██╔══╝  ╚═╝ ]],
                [[ ██║  ██║╚██████╔╝╚██████╔╝██║     ██╗ ]],
                [[ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝ ]],
            }

            dashboard.section.buttons.val = {
                button("f", Icons.ui.Files .. " Find file", function()
                    Snacks.picker.files()
                end),
                button("p", Icons.git.Repo .. " Find project", function()
                    Snacks.picker.projects()
                end),
                button("r", Icons.ui.History .. " Recent files", ":FzfLua oldfiles <CR>"),
                button("Q", Icons.ui.SignOut .. " Quit", ":qa<CR>"),
            }

            dashboard.section.header.val = header
            dashboard.section.footer.val = ""
            dashboard.section.footer.val = random_quote()

            dashboard.section.header.opts.hl = "String"
            dashboard.section.buttons.opts.hl = "Macro"
            dashboard.section.footer.opts.hl = "Type"

            dashboard.opts.opts.noautocmd = true
            require("alpha").setup(dashboard.opts)

            vim.api.nvim_create_autocmd({ "User" }, {
                pattern = { "AlphaReady" },
                callback = function()
                    vim.cmd([[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
      ]])
                end,
            })
        end,
    },
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
    {
        "rcarriga/nvim-notify",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("notify").setup({
                stages = "static", -- default: "fade_in_slide_out"
                -- Timeout will never work if `stages` is set to anything other than `static`.
                timeout = 3000,
                -- on_open = function(win)
                --     vim.api.nvim_win_set_config(win, { zindex = 100 })
                -- end,
                -- on_open = function(win)
                --     -- Set the window to be non-focusable; otherwise, `C-w w` will treat it as a window.
                --     vim.api.nvim_win_set_config(win, { focusable = false })
                -- end,
            })
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
