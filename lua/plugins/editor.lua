local Path = require("configs.utils.path")

return {
    -- 🍿 A collection of QoL plugins for Neovim.
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                preset = {
                    header = [[
     ★ ✯   🛸        🪐   .°•
         ° ★  •       🛰
██████╗  ██████╗  ██████╗ ███████╗██╗
██╔══██╗██╔═══██╗██╔═══██╗██╔════╝██║
██████╔╝██║   ██║██║   ██║█████╗  ██║
██╔══██╗██║   ██║██║   ██║██╔══╝  ╚═╝
██║  ██║╚██████╔╝╚██████╔╝██║     ██╗
╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝]],

                    -- stylua: ignore start
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                    -- stylua: ignore end
                },
                sections = {
                    { section = "header" },
                    {
                        section = "terminal",
                        icon = " ",
                        cmd = "quotes -p -q",
                        height = 2,
                        indent = 11,
                    },
                    { section = "keys", gap = 1, padding = 1 },
                    { section = "startup" },
                },
            },
            indent = {
                enabled = true,
                only_scope = true, -- only show indent guides of the scope
                only_current = true, -- only show indent guides in the current window
            },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true, only_current = true, only_scope = true },
            styles = {
                notification = {},
            },
        },
        keys = {},
    },
    -- Git time machine.
    {
        "fredeeb/tardis.nvim",
        event = "VeryLazy",
        config = function()
            require("tardis-nvim").setup({})
        end,
    },
    -- Magit for Neovim.
    {
        "neogitorg/neogit",
        event = "VeryLazy",
        dependencies = {
            "sindrets/diffview.nvim", -- optional - Diff integration
        },
        config = function()
            local neogit = require("neogit")
            neogit.setup({
                mappings = {
                    commit_editor = {
                        ["<c-c><c-g>"] = "Abort",
                        ["<c-c><c-k>"] = false,
                    },
                    rebase_editor = {
                        -- `C-c C-k` doesn't work
                        ["<c-c><c-g>"] = "Abort",
                        ["<c-c><c-k>"] = false,
                    },
                    status = {
                        ["s"] = "Stage",
                        -- Magit uses `S`
                        ["S"] = "StageAll", -- default: C-s
                    },
                },
                integrations = {
                    diffview = true,
                    fzf_lua = true,
                },
            })
        end,
    },
    -- Display VCS changes in the gutter.
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
        },
    },
    --  Terminal
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-/>]],
                direction = "float",
                float_opts = {
                    border = "rounded",
                },

                -- Runs everytime ToggleTerm toggled
                on_open = function(term)
                    -- Can't use `require("configs.utils.file").path()` because it returns
                    -- ToggleTerm buffer path instead of current buffer path.
                    local path = Path.previous_dir()
                    if path then
                        path = Path.sanitize(path)
                    else
                        -- Fallback to home if no previous directory found
                        path = "~/"
                    end

                    -- Use project root if available, otherwise use the plain path.
                    -- Sometimes, I want to open the terminal in a non-project directory.
                    path = Path.project_root_or_cwd(path)
                    if path ~= term.dir then
                        term:change_dir(path)
                    end
                    -- Start in insert mode
                    vim.cmd("startinsert!")
                end,
            })
        end,
    },
    -- Dired for Nvim.
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = true,
            keymaps = {
                show_help = "<f1>",
            },
        },
        -- 👇 if you use open_for_directories=true, this is recommended
        init = function()
            -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
            -- vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
    },
    -- Find and replace across files.
    {
        "nvim-pack/nvim-spectre",
        build = false,
        cmd = "Spectre",
        opts = { open_cmd = "noswapfile vnew" },
        config = function()
            require("spectre").setup({ is_block_ui_break = true })
        end,
    },
    -- NeoTree
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        config = function()
            require("neo-tree").setup({
                window = {
                    width = 25,
                    mappings = {
                        ["R"] = "refresh",
                        ["<C-l>"] = "refresh",
                    },
                },
                filesystem = {
                    -- Let `oil.nvim` handle it
                    hijack_netrw_behavior = "disabled",
                    -- This will use the OS level file watchers to detect changes
                    use_libuv_file_watcher = true,
                    window = {
                        mappings = {
                            ["H"] = "toggle_hidden",
                            ["g."] = "toggle_hidden",
                        },
                    },
                    filtered_items = {
                        never_show = {
                            ".git",
                            "cdata", -- container data
                            -- too generic to ignore
                            -- "data", -- container data
                            "target", -- rust build directory
                            "node_modules",
                            "pnpm-lock.yaml",
                            ".svelte-kit",
                        },
                        never_show_by_pattern = {
                            "*.lock",
                        },
                    },
                },
            })
        end,
    },
    -- Jump around (à la Avy)
    {
        "folke/flash.nvim",
        tag = "stable",
        event = "VeryLazy",
        opts = {},
    },
    -- Multiple cursors
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvimtools/hydra.nvim",
        },
        opts = {},
        cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    },
    -- Super-save
    -- Save all files silently on focus lost or buffer leave
    -- It is the 21st century; should I save files manually?
    {
        "okuuva/auto-save.nvim",
        cmd = "ASToggle", -- optional for lazy loading on command
        event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
        -- Doesn't work without `opts` block!
        opts = {},
    },
    -- Surround
    {
        "echasnovski/mini.surround",
        enabled = false,
        opts = {
            mappings = {
                -- Normal: sa-uw-<char>
                -- Visual: sa-<char>
                add = "sa", -- Add surrounding in Normal and Visual modes
                -- Normal: sd-<char>
                delete = "sd", -- Delete surrounding
                find = "sf", -- Find surrounding (to the right)
                find_left = "sF", -- Find surrounding (to the left)
                highlight = "sh", -- Highlight surrounding
                -- Normal: sr-<char>-<char>
                replace = "sr", -- Replace surrounding
                update_n_lines = "sn", -- Update `n_lines`
            },
        },
    },
    -- Sudo
    {
        "lambdalisue/suda.vim",
        event = "VeryLazy",
    },
}
