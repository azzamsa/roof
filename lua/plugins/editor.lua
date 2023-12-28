return {
    -- Git time machine.
    {
        "fredeeb/tardis.nvim",
        event = "VeryLazy",
        commit = "21a92fbc5b3a389ab09cea6beee8784b39c99099",
        config = function()
            require("tardis-nvim").setup({
                keymap = {
                    ["next"] = "<C-n>", -- next entry in log (older)
                    ["prev"] = "<C-e>", -- previous entry in log (newer)
                    ["quit"] = "q", -- quit all
                    ["revision_message"] = "m", -- show revision message for current revision
                },
                initial_revisions = 10, -- initial revisions to create buffers for
                max_revisions = 256, -- max number of revisions to load
            })
        end,
    },
    -- Magit for Neovim.
    {
        "neogitorg/neogit",
        event = "VeryLazy",
        commit = "801143ee4db4121fc11a6468daae6680ba9fab51",
        config = function()
            local neogit = require("neogit")
            neogit.setup({})
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
        commit = "c80844fd52ba76f48fabf83e2b9f9b93273f418d",
        config = function()
            local function get_previous_buffer_path()
                local previous_bufnr = vim.fn.bufnr("#")
                -- So far, there must be a previous buffer.
                -- No need to check if there is a previous buffer `previous_bufnr ~= -1`.
                return vim.fn.fnamemodify(vim.fn.bufname(previous_bufnr), ":p:h")
            end

            require("toggleterm").setup({
                open_mapping = [[<c-/>]],
                direction = "float",
                close_on_exit = true, -- close the terminal window when the process exits
                -- Already set in "opt.shell"
                shell = vim.o.shell, -- change the default shell
                float_opts = {
                    border = "rounded",
                },

                -- Runs everytime ToggleTerm toggled
                on_open = function(term)
                    -- Can't use `require("configs.utils").file_path()` because it uses ToggleTerm buffer
                    -- instead of the currently opened buffer.
                    -- A helper function is needed to get previous buffer path.
                    --
                    -- Sometimes, I want to open the terminal in a non-project directory.
                    local path = get_previous_buffer_path()
                    -- Open from oily path too! Such as `oil.nvim`
                    path = require("configs.utils.file").validate(path)

                    -- Use project root if available, otherwise use the plain path.
                    path = require("configs.utils").project_root_or_cwd(path)
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
        "stevearc/oil.nvim",
        event = "VeryLazy",
        commit = "523b61430cb7365f8f86609c2ea60e48456bac63",
        config = function()
            require("oil").setup({
                -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
                delete_to_trash = true,
                -- Skip the confirmation popup for simple operations
                skip_confirm_for_simple_edits = false,
                -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
                prompt_save_on_select_new_entry = true,
                -- Set to false to disable all of the above keymaps
                use_default_keymaps = true,
                view_options = {
                    sort = {
                        -- sort order can be "asc" or "desc"
                        -- see :help oil-columns to see which columns are sortable
                        { "mtime", "desc" },
                    },
                },
            })
        end,
    },
    -- Fuzzy find things.
    {
        "nvim-telescope/telescope.nvim",
        commit = "74ce793a60759e3db0d265174f137fb627430355",
        lazy = true,
        cmd = "Telescope",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                lazy = true,
                commit = "6c921ca12321edaa773e324ef64ea301a1d0da62",
            },
            {
                "debugloop/telescope-undo.nvim",
                commit = "d3afc1c105535a90caec092ce27a113f77ba7b84",
                config = function()
                    require("telescope").load_extension("undo")
                end,
            },
        },
        config = function()
            local icons = require("configs.icons")
            local actions = require("telescope.actions")

            local find_files_no_ignore = function()
                local action_state = require("telescope.actions.state")
                local line = action_state.get_current_line()
                require("telescope.builtin").find_files({
                    no_ignore = true,
                    default_text = line,
                })
            end
            local find_files_with_hidden = function()
                local action_state = require("telescope.actions.state")
                local line = action_state.get_current_line()
                require("telescope.builtin").find_files({
                    hidden = true,
                    default_text = line,
                })
            end

            require("telescope").setup({
                defaults = {
                    -- Ignore them; otherwise, they will pop up in `find_files`.
                    file_ignore_patterns = { ".git" },
                    prompt_prefix = icons.ui.Telescope .. " ",
                    selection_caret = icons.ui.Forward .. " ",
                    entry_prefix = "   ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    path_display = { "smart" },
                    color_devicons = true,
                    set_env = { ["COLORTERM"] = "truecolor" },
                    sorting_strategy = nil,
                    layout_strategy = nil,
                    layout_config = {},
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob=!.git/",
                    },

                    mappings = {
                        i = {
                            ["<a-i>"] = find_files_no_ignore,
                            ["<a-h>"] = find_files_with_hidden,

                            ["<C-Down>"] = actions.cycle_history_next,
                            ["<C-Up>"] = actions.cycle_history_prev,
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,
                        },
                        n = {
                            ["n"] = actions.move_selection_next,
                            ["e"] = actions.move_selection_previous,
                            ["<esc>"] = actions.close,
                            ["q"] = actions.close,
                        },
                    },
                    pickers = {
                        find_files = {
                            previewer = false,
                        },
                        buffers = {
                            mappings = {
                                i = {
                                    ["<C-d>"] = actions.delete_buffer,
                                },
                                n = {
                                    ["dd"] = actions.delete_buffer,
                                },
                            },
                        },
                    },
                    extensions = {
                        fzf = {
                            fuzzy = true, -- false will only do exact matching
                            override_generic_sorter = true, -- override the generic sorter
                            override_file_sorter = true, -- override the file sorter
                            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        },
                    },
                },
            })
        end,
    },
    -- Project management.
    {
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
        config = function()
            require("project_nvim").setup({
                active = true,
                on_config_done = nil,
                manual_mode = false,
                -- Don't use `lsp` as detection method.
                -- It will use a buffer's directory as a root project.
                detection_methods = { "pattern" },
                --  `.project` and `.projectile` are part of the Emacs's project detection system.
                patterns = { ".git", "justfile", "Makefile", "package.json", ".project", ".projectile" },
                ignore_lsp = {},
                exclude_dirs = {},
                show_hidden = true,
                -- Set to `true` to enable debugging.
                -- But it is too noisy when switching between buffers a lot.
                silent_chdir = true,
                scope_chdir = "global",
            })

            require("telescope").load_extension("projects")
        end,
    },
    -- Find and replace across files.
    {
        "nvim-pack/nvim-spectre",
        build = false,
        cmd = "Spectre",
        opts = { open_cmd = "noswapfile vnew" },
        commit = "d8906855f1949ac97b1e77aaf8d3fe12ed158ddc",
        config = function()
            require("spectre").setup({ is_block_ui_break = true })
        end,
    },
    -- Find and replace across files.
    {
        "AckslD/muren.nvim",
        config = true,
    },
    -- NeoTree
    {
        "nvim-neo-tree/neo-tree.nvim",
        commit = "77d9f484b88fd380386b46ed9206e5374d69d9d8",
        cmd = "Neotree",
        config = function()
            require("neo-tree").setup({
                filesystem = {
                    follow_current_file = {
                        -- This will use the OS level file watchers to detect changes
                        use_libuv_file_watcher = true,
                    },
                },
                window = {
                    width = 25,
                },
            })
        end,
    },
    -- Jump around
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        commit = "48817af25f51c0590653bbc290866e4890fe1cbe",
        -- stylua: ignore
        keys = {
           {"s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash"},
           {"S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter"},
           {"r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash"},
           {"R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search"},
           {"<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search"},
        },
    },
    -- Surround actions
    {
        "echasnovski/mini.surround",
        commit = "7bf8915ba15d7a4f3c2afe7868d3c15a858d73f1",
        opts = {
            mappings = {
                add = "gsa", -- Add surrounding in Normal and Visual modes
                delete = "gsd", -- Delete surrounding
                find = "gsf", -- Find surrounding (to the right)
                find_left = "gsF", -- Find surrounding (to the left)
                highlight = "gsh", -- Highlight surrounding
                replace = "gsr", -- Replace surrounding
                update_n_lines = "gsn", -- Update `n_lines`
            },
        },
    },
    -- Multiple cursors
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        commit = "8e876fe9db46c1b76c151202b418df21eca07bad",
        dependencies = {
            "smoka7/hydra.nvim",
            commit = "3ced42c0b6a6c85583ff0f221635a7f4c1ab0dd0",
        },
        opts = {},
        cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
        config = function()
            require("multicursors").setup({
                -- Any hint position has the potential to cover the target text.
                hint_config = false,
            })
        end,
    },
}
