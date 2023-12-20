local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
    commit = "74ce793a60759e3db0d265174f137fb627430355",
    lazy = true,
    cmd = "Telescope",
}

function M.config()
    local icons = require("plugins.icons")
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

                    ["<C-n>"] = actions.move_selection_next,
                    ["<C-e>"] = actions.move_selection_previous,
                },
                n = {
                    ["n"] = actions.move_selection_next,
                    ["e"] = actions.move_selection_previous,
                    ["<esc>"] = actions.close,
                    ["q"] = actions.close,
                },
            },
        },
        pickers = {
            live_grep = {
                theme = "dropdown",
            },

            grep_string = {
                theme = "dropdown",
            },

            find_files = {
                theme = "dropdown",
                previewer = false,
            },

            buffers = {
                theme = "dropdown",
                previewer = false,
                initial_mode = "normal",
                mappings = {
                    i = {
                        ["<C-d>"] = actions.delete_buffer,
                    },
                    n = {
                        ["dd"] = actions.delete_buffer,
                    },
                },
            },

            planets = {
                show_pluto = true,
                show_moon = true,
            },

            colorscheme = {
                enable_preview = true,
            },

            lsp_references = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_definitions = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_declarations = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_implementations = {
                theme = "dropdown",
                initial_mode = "normal",
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
    })
end

return M
