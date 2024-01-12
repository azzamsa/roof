local Path = require("configs.utils.path")
local Utils = require("configs.utils")

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        commit = "ce741eb559c924d72e3a67d2189ad3771a231414",
        config = function()
            local mappings = {
                -- Every keymap that uses a custom function means the default `Telescope <*>` always starts from the `cwd`.
                [","] = { "<cmd>Telescope buffers previewer=false<cr>", "Switch buffer" },

                -- stylua: ignore start
                ["."] = { function() Utils.find_files_from_here() end, "Find project file" },
                ["<space>"] = { function() Utils.find_files_in_project() end, "Find project file" },
                ["x"] = { function() Utils.toggle_scratch_buffer() end, "Open scratch buffer" },
                ["/"] = { function() Utils.grep_in_project() end, "Search in project" },
                -- stylua: ignore end

                -- <leader> b --- buffer
                b = {
                    name = "Buffers",
                    b = { "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", "Switch buffer" },
                    k = { "<cmd>bd<cr>", "Kill buffer" },
                    K = { "<cmd>%bd!<cr>", "Kill all buffer" },
                    O = { "<cmd>%bd <bar> e#<cr>", "Kill other buffers" },
                    -- Doom use both `<leader> b s` and `<leader> f s` to save file
                    s = { "<cmd>w<cr>", "Save buffer" },
                    S = { "<cmd>wa<cr>", "Save all buffers" },
                },

                -- <leader> c --- code
                c = {
                    name = "Code",
                    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
                    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump to definition" },
                    e = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics" },
                    p = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview" },
                    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
                    S = { "<cmd>SymbolsOutline<cr>", "Symbols" },
                    w = { "<cmd>Trim<cr>", "Delete trailing whitespaces" },
                    x = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics" },
                    X = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Project diagnostics" },

                    -- stylua: ignore start
                    f = { function() require("conform").format({ async = false, lsp_fallback = false }) end, "Format" },
                    -- stylua: ignore end
                },

                -- <leader> f --- file
                f = {
                    name = "File",
                    d = { "<cmd>Oil<cr>", "Find directory" },
                    D = { "<cmd>call delete(expand('%')) <bar> bdelete!<cr>", "Delete this file" },
                    r = { "<cmd>Telescope oldfiles<cr>", "Recent file" },
                    R = { "<cmd>MurenToggle<cr>", "Replace in files" },
                    s = { "<cmd>w<cr>", "Save buffer" },
                    S = { "<cmd>wa<cr>", "Save all buffers" },

                    -- stylua: ignore start
                    e = { function() Utils.find_files_in_config() end, "Find file in config" },
                    f = { function() Utils.find_files_from_here() end, "Find file" },
                    y = { function() Utils.copy_filename_to_clipboard() end, "Copy file name" },
                    Y = { function() Utils.copy_filepath_to_clipboard() end, "Copy file path" },
                    -- stylua: ignore end
                },

                -- <leader> g --- version control
                g = {
                    name = "VCS",

                    t = { "<cmd>Tardis<cr>", "Git time machine" },
                    -- stylua: ignore start
                    g = { function() Utils.ngit_here() end, "Neogit" },
                    -- stylua: ignore end
                },

                -- <leader> h --- help
                h = {
                    name = "Help",
                    c = { "<cmd>Telescope commands<cr>", "Commands" },
                    h = { "<cmd>Telescope help_tags<cr>", "Help" },
                    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
                    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
                },

                -- <leader> i --- insert
                i = {
                    name = "Insert",
                    f = { "<cmd>put =expand('%:t')<cr>", "Current file name" },
                    F = { "<cmd>put =expand('%:p')<cr>", "Current file path" },
                },

                -- <leader> o --- open
                o = {
                    name = "Open",
                    -- Open from current buffer by default
                    d = { "<cmd>Oil<cr>", "File manager from here" },

                    -- stylua: ignore start
                    p = { function() Utils.ntree_here() end, "Side panel" },
                    x = { function() Utils.open_with(Path.current_dir()) end, "GUI File manager" },
                    -- stylua: ignore end
                },

                -- <leader> p --- project
                p = {
                    name = "Project",
                    p = { "<cmd>Telescope projects<cr>", "Switch project" },

                    -- stylua: ignore start
                    f = { function() Utils.find_files_in_project() end, "Find project file" },
                    s = { function() Utils.grep_in_project() end, "Search in project" },
                    -- stylua: ignore end
                },

                -- <leader> q --- quit
                q = {
                    name = "Quit",
                    -- Avoid accidental presses of lowercase 'q'
                    Q = { "<cmd>wa <bar> qa<cr>", "Quit" },
                },

                -- <leader> s --- search
                s = {
                    name = "Search",
                    c = { "<cmd>Telescope command_history<cr>", "Command history" },
                    C = { "<cmd>Telescope commands<cr>", "Commands" },
                    K = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
                    m = { "<cmd>MCstart<cr>", "Multiple cursors" },
                    r = { "<cmd>Telescope registers<cr>", "Registers" },
                    R = { "<cmd>Telescope resume<cr>", "Resume" },
                    u = { "<cmd>Telescope undo<cr>", "Visual undo" },
                    s = { "<cmd>Telescope spell_suggest<cr>", "Spell candidate" },
                    ['"'] = { "<cmd>Telescope registers<cr>", "Registers" },

                    b = {
                        function()
                            local bookmarks = require("etc.bookmarks").bookmarks
                            require("configs.utils.picker").bookmarks({ bookmarks = bookmarks })
                        end,
                        "Bookmarks",
                    },

                    -- stylua: ignore start
                    g = { function() Utils.grep_from_here() end, "Search" },
                    -- stylua: ignore end
                },

                -- <leader> t --- toggle
                t = {
                    name = "Toggle",
                    C = { "<cmd>ColorizerToggle<cr>", "Rainbow color" },

                    T = {
                        function()
                            if vim.b.ts_highlight then
                                vim.treesitter.stop()
                            else
                                vim.treesitter.start()
                            end
                        end,
                        "Treesitter",
                    },

                    -- stylua: ignore start
                    c = { function() Utils.toggle_opt("conceallevel") end, "Conceal" },
                    d = { function() Utils.toggle_diagnostics() end, "Diagnostics" },
                    f = { function() Utils.toggle_autoformat() end, "Auto format" },
                    h = { function() Utils.toggle_inlay_hints() end, "Inlay Hints" },
                    l = { function() Utils.toggle_line_number() end, "Line numbers" },
                    L = { function() Utils.toggle_opt("relativenumber") end, "Relative line numbers" },
                    s = { function() Utils.toggle_opt("spell") end, "Spelling" },
                    w = { function() Utils.toggle_opt("wrap") end, "Word wrap" },
                    -- stylua: ignore end
                },

                -- <leader> w --- window
                w = {
                    name = "Window",
                    d = { "<c-w>c", "Delete window" },
                    o = { "<c-w>o", "Delete other window" },
                    ["<c-o>"] = { "<c-w>o", "Delete other window" },
                    s = { "<c-w>s", "Horizontal Split" },
                    -- `C-W p` doesn't work if the next buffer is opened via `Telescope`.
                    -- However, it works when opened from `oil.nvim` or `:e .`.
                    -- I am not the only one experiencing this issue; others have resorted to using `C-w hjkl`.
                    -- But my Doom Emacs muscle memory is so strong that I don't want to abandon it.
                    -- Thus, the wizards of the Neovim core team come to my rescue with this `expr` hackery.
                    -- Thank you, Sean Dewar (seandewar).
                    w = {
                        "winnr('#') != 0 && winnr('#') != winnr() ? '<C-W>p' : '<C-W>w'",
                        "Other window",
                        expr = true,
                    },
                    v = { "<c-w>v", "Vertical Split" },
                },
            }

            local opts = {
                mode = "n", -- NORMAL mode
                prefix = "<leader>",
                buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                silent = true, -- use `silent` when creating keymaps
                noremap = true, -- use `noremap` when creating keymaps
                nowait = true, -- use `nowait` when creating keymaps
            }

            -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
            -- see https://neovim.io/doc/user/map.html#:map-cmd
            local vmappings = {
                -- <leader> c --- code
                c = {
                    name = "Code",
                    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
                },

                -- <leader> s --- search
                s = {
                    name = "Search",
                    m = { "<cmd>MCstart<cr>", "Multiple cursors" },
                },
            }

            local vopts = {
                mode = "v", -- VISUAL mode
                prefix = "<leader>",
                buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                silent = true, -- use `silent` when creating keymaps
                noremap = true, -- use `noremap` when creating keymaps
                nowait = true, -- use `nowait` when creating keymaps
            }

            local which_key = require("which-key")

            which_key.setup({
                plugins = {
                    marks = false, -- shows a list of your marks on ' and `
                    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                    spelling = {
                        enabled = true,
                        suggestions = 20,
                    }, -- use which-key for spelling hints
                    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                    -- No actual key bindings are created
                    presets = {
                        operators = false, -- adds help for operators like d, y, ...
                        motions = false, -- adds help for motions
                        text_objects = false, -- help for text objects triggered after entering an operator
                        windows = false, -- default bindings on <c-w>
                        nav = false, -- misc bindings to work with windows
                        z = false, -- bindings for folds, spelling and others prefixed with z
                        g = false, -- bindings for prefixed with g
                    },
                },
                popup_mappings = {
                    scroll_down = "<c-d>", -- binding to scroll down inside the popup
                    scroll_up = "<c-u>", -- binding to scroll up inside the popup
                },
                window = {
                    border = "rounded", -- none, single, double, shadow
                    position = "bottom", -- bottom, top
                    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                    winblend = 0,
                },
                layout = {
                    height = { min = 4, max = 25 }, -- min and max height of the columns
                    width = { min = 20, max = 50 }, -- min and max width of the columns
                    spacing = 3, -- spacing between columns
                    align = "left", -- align columns left, center or right
                },
                ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
                hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
                show_help = true, -- show help message on the command line when the popup is visible
                show_keys = true, -- show the currently pressed key and its label as a message in the command line
                triggers = "auto", -- automatically setup triggers
                -- triggers = {"<leader>"} -- or specify a list manually
                triggers_blacklist = {
                    -- list of mode / prefixes that should never be hooked by WhichKey
                    -- this is mostly relevant for key maps that start with a native binding
                    -- most people should not need to change this
                    i = { "j", "k" },
                    v = { "j", "k" },
                },
                -- disable the WhichKey popup for certain buf types and file types.
                -- Disabled by default for Telescope
                disable = {
                    buftypes = {},
                    filetypes = { "TelescopePrompt" },
                },
            })

            which_key.register(mappings, opts)
            which_key.register(vmappings, vopts)
        end,
    },
}
