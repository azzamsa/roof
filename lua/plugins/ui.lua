local Icons = require("configs.icons")

return {
    -- Dashboard
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        commit = "234822140b265ec4ba3203e3e0be0e0bb826dff5",
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
                -- stylua: ignore start
                button("f", Icons.ui.Files .. " Find file", ":Telescope find_files <CR>"),
                button( "p", Icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
                button("r", Icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
                button("Q", Icons.ui.SignOut .. " Quit", ":qa<CR>"),
                -- stylua: ignore end
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
        commit = "7533b0ead663d80452210c0c089e5105089697e5",
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

            require("lualine").setup({
                options = {
                    theme = "catppuccin",
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
                    lualine_x = { "diagnostics" },
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
        commit = "35f99d559041c7c0eff3a41f9093581ceea534e8",
        config = function()
            require("scrollbar").setup()
        end,
    },
    -- Replaces the UI for messages, cmdline and the popupmenu.
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        commit = "92433164e2f7118d4122c7674c3834d9511722ba",
        dependencies = {
            {
                "rcarriga/nvim-notify",
                event = "VeryLazy",
                commit = "e4a2022f4fec2d5ebc79afa612f96d8b11c627b3",
                config = function()
                    require("notify").setup({
                        stages = "static", -- default: "fade_in_slide_out"
                        -- Timeout will never work if `stages` is set to anything other than `static`.
                        timeout = 1000,
                        on_open = function(win)
                            -- Set the window to be non-focusable; otherwise, `C-w w` will treat it as a window.
                            vim.api.nvim_win_set_config(win, { focusable = false })
                        end,
                    })
                end,
            },
        },
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
                -- you can enable a preset for easier configuration
                presets = {
                    -- bottom_search = true, -- use a classic bottom cmdline for search
                    -- command_palette = true, -- position the cmdline and popupmenu together
                    -- long_message_to_split = true, -- long messages will be sent to a split
                    -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    -- lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
        end,
    },
    -- A winbar that uses LSP to display current code context.
    {
        "LunarVim/breadcrumbs.nvim",
        commit = "1033b354f65206793831207d5c9047fc059e35c3",
        config = function()
            require("breadcrumbs").setup()
        end,
        dependencies = {
            "SmiteshP/nvim-navic",
            commit = "0ffa7ffe6588f3417e680439872f5049e38a24db",
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
