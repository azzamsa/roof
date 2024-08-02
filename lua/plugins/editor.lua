local Path = require("configs.utils.path")

return {
    -- Git time machine.
    {
        "fredeeb/tardis.nvim",
        event = "VeryLazy",
        config = function()
            require("tardis-nvim").setup({
                keymap = {
                    ["next"] = "<C-e>", -- next entry in log (older)
                    ["prev"] = "<C-i>", -- previous entry in log (newer)
                    ["quit"] = "q", -- quit all
                    ["revision_message"] = "m", -- show revision message for current revision
                    ["commit"] = "<C-g>", -- replace contents of origin buffer with contents of tardis buffer
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

                        ["gi"] = "MoveUp", -- default: gk
                        ["ge"] = "MoveDown", -- default: gj
                    },
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
                        path = Path.validate(path)
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
        "stevearc/oil.nvim",
        event = "VeryLazy",
        tag = "stable",
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
                keymaps = {
                    ["<C-s>"] = "<cmd>w<cr><esc>",
                },
            })
        end,
    },
    -- Fuzzy find things.
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        cmd = "Telescope",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                lazy = true,
            },
            {
                "debugloop/telescope-undo.nvim",
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
                    hidden = false,
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
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
    -- stylua: ignore
    keys = {
      {"gs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash"},
      {"gS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter"},
    },
    },
    -- Multiple cursors
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            "smoka7/hydra.nvim",
        },
        opts = {},
        cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
        config = function()
            require("multicursors").setup({
                -- Any hint position has the potential to cover the target text.
                -- hint_config = false,
                hint_config = {
                    border = "single",
                    position = "top-left",
                    type = "statusline",
                },
                generate_hints = {
                    normal = true,
                    insert = true,
                    extend = true,
                    config = {
                        -- Enable these line if you use `type = window`
                        -- column_count = 2,
                        -- max_hint_length = 15,
                    },
                },
            })
        end,
    },
    -- Super-save
    -- Save all files silently on focus lost or buffer leave
    -- It is the 21st century; should I save files manually?
    {
        "willothy/savior.nvim",
        dependencies = { "j-hui/fidget.nvim" },
        event = { "InsertEnter", "TextChanged" },
        config = function()
            local savior = require("savior")
            savior.setup({
                -- Set to false to disable fidget.nvim notifications
                notify = false,
            })
        end,
    },
    -- Surround
    {
        "echasnovski/mini.surround",
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
