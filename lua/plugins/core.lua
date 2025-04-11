local Path = require("configs.utils.path")
local Utils = require("configs.utils")

return {
    {
        "folke/which-key.nvim",
        tag = "stable",
        event = "VeryLazy",
        config = function()
            local which_key = require("which-key")
            which_key.setup({})

            -- stylua: ignore start
            which_key.add({
                -- Every keymap that uses a custom functionmeans the default `FzfLua ...`
                -- always starts from the `cwd`.
                { "<leader>x", function() require("snacks").scratch() end, desc = "Toggle scratch buffer" },
                { "<leader>'", "<cmd>FzfLua live_grep_resume<cr>", desc = "Resume last search" },
                { "<leader>,", "<cmd>FzfLua buffers previewer=false<cr>", desc = "Switch buffer" },
                { "<leader>.", function() Utils.find_files_from_here() end, desc = "Find file from here" },
                { "<leader>/", function() Utils.grep_in_project() end, desc = "Search in project" },
                { "<leader><cr>", function() Utils.bookmarks() end, desc = "Jump to bookmark" },
                { "<leader><space>", function() Utils.find_files_in_project() end, desc = "Find project file" },
                { "<leader>`", "<cmd>buffer#<cr>", desc = "Switch to last buffer" },

                -- <leader> b --- buffer
                { "<leader>b", group = "Buffers" },
                { "<leader>bb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch buffer" },
                { "<leader>bk", "<cmd>bd<cr>", desc = "Kill buffer" },
                { "<leader>bK", "<cmd>%bd!<cr>", desc = "Kill all buffer" },
                { "<leader>br", "<cmd>edit!<cr>", desc = "Revert buffer" },
                { "<leader>bs", "<cmd>w<cr>", desc = "Save buffer" },
                { "<leader>bS", "<cmd>wa<cr>", desc = "Save all buffers" },
                { "<leader>bu", "<cmd>SudaWrite<cr>", desc = "Save buffer as root" },
                { "<leader>bO", "<cmd>%bd <bar> e#<cr>", desc = "Kill other buffers" },

                -- <leader> c --- code
                { "<leader>c", group = "Code", desc = "Code" },
                { "<leader>ca", function() require("actions-preview").code_actions() end, desc = "Code Action", mode = { "n", "v" } },
                { "<leader>cd", vim.lsp.buf.definition, desc = "Jump to definition" },
                { "<leader>ce", vim.diagnostic.open_float, desc = "Line Diagnostics" },
                { "<leader>cf", function() require("conform").format({ async = false, lsp_fallback = false }) end, desc = "Format" },
                { "<leader>cp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
                { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
                { "<leader>cw", "<cmd>Trim<cr>", desc = "Delete trailing whitespaces" }, { "<leader>cx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Diagnostics" },
                { "<leader>cS", "<cmd>SymbolsOutline<cr>", desc = "Symbols" },
                { "<leader>cX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Project diagnostics" },

                -- <leader> f --- file
                { "<leader>f", group = "File" },
                { "<leader>fd", "<cmd>Oil<cr>", desc = "Find directory" },
                { "<leader>fD", "<cmd>call delete(expand('%')) <bar> bdelete!<cr>", desc = "Delete this file" },
                { "<leader>fy", function() Utils.copy_filename_to_clipboard() end, desc = "Copy file name" },
                { "<leader>fY", function() Utils.copy_filepath_to_clipboard() end, desc = "Copy file path" },
                { "<leader>fe", function() Utils.find_files_in_config() end, desc = "Find file in config" },
                { "<leader>ff", function() Utils.find_files_in_project() end, desc = "Find file" },
                { "<leader>fF", function() Utils.find_files_from_here() end, desc = "Find file from here" },
                { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent file" },
                { "<leader>fR", function() Utils.spectre_here() end, desc = "Replace in files" },
                { "<leader>fs", "<cmd>w<cr>", desc = "Save buffer" },
                { "<leader>fS", "<cmd>wa<cr>", desc = "Save all buffers" },

                -- <leader> g --- version control
                { "<leader>g", group = "VCS", icon = "" },
                { "<leader>gg", function() Utils.ngit_here() end, desc = "Neogit", icon = "" },
                { "<leader>gt", "<cmd>Tardis<cr>", desc = "Git time machine", icon = "" },

                -- <leader> h --- help
                { "<leader>h", group = "Help", icon = "󰞋" },
                { "<leader>hc", "<cmd>FzfLua commands<cr>", desc = "Commands", icon = "󰞋" },
                { "<leader>hh", "<cmd>FzfLua help_tags<cr>", desc = "Help", icon = "󰞋" },
                { "<leader>hk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps", icon = "󰞋" },
                { "<leader>hm", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages", icon = "󰞋" },

                -- <leader> i --- insert
                { "<leader>i", group = "Insert", icon = "󰏪" },
                { "<leader>id", "<cmd>exec 'normal! a' . strftime('%Y-%m-%d %H:%M')<cr>", desc = "Current date and time", icon = "󰏪" },
                { "<leader>if", "<cmd>exec 'normal! a' . expand('%:t')<cr>", desc = "Current file name", icon = "󰏪" },
                { "<leader>iF", "<cmd>exec 'normal! a' . expand('%:p')<cr>", desc = "Current file path", icon = "󰏪" },

                -- <leader> o --- open
                { "<leader>o", group = "Open", icon = " " },
                { "<leader>od", "<cmd>Oil<cr>", desc = "File manager from here", icon = " " },
                { "<leader>op", function() Utils.ntree_here() end, desc = "Side panel", icon = " " },
                { "<leader>oo", function() Utils.open_with(Path.current_dir()) end, desc = "GUI File manager", icon = " " },

                -- <leader> p --- project
                { "<leader>p", group = "Project", icon = "" },
                { "<leader>pf", function() Utils.find_files_in_project() end, desc = "Find project file", icon = "" },
                { "<leader>pp", function() Utils.bookmarks() end, desc = "Open workdirs", icon = "" },
                { "<leader>ps", function() Utils.grep_in_project() end, desc = "Search in project", icon = "" },

                -- <leader> q --- quit
                { "<leader>q", group = "Quit" },
                -- Avoid accidental presses of lowercase 'q'
                { "<leader>qQ", "<cmd>wa <bar> qa<cr>", desc = "Quit" },

                -- <leader> s --- search
                { "<leader>s", group = "Search" },
                { "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command history" },
                { "<leader>sC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
                { "<leader>sg", function() Utils.grep_from_here() end, desc = "Search" },
                { "<leader>sr", "<cmd>FzfLua marks<cr>", desc = "Marks" },
                { "<leader>ss", "<cmd>FzfLua spell_suggest<cr>", desc = "Spell candidate" },
                { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Visual undo" },
                { "<leader>sK", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },

                -- <leader> t --- toggle
                { "<leader>t", group = "Toggle" },
                { "<leader>tc", function() Utils.toggle_opt("conceallevel") end, desc = "Conceal" },
                { "<leader>tC", "<cmd>ColorizerToggle<cr>", desc = "Rainbow color" },
                { "<leader>td", function() Utils.toggle_diagnostics() end, desc = "Diagnostics" },
                { "<leader>tf", function() Utils.toggle_autoformat() end, desc = "Auto format" },
                { "<leader>th", function() Utils.toggle_inlay_hints() end, desc = "Inlay Hints", },
                { "<leader>tl", function() Utils.toggle_line_number() end, desc = "Line numbers" },
                { "<leader>tL", function() Utils.toggle_opt("relativenumber") end, desc = "Relative line numbers" },
                { "<leader>ts", function() Utils.toggle_opt("spell") end, desc = "Spelling" },
                { "<leader>tw", function() Utils.toggle_opt("wrap") end, desc = "Word wrap" },
                { "<leader>tT", function() Utils.toggle_treesitter() end, desc = "Treesitter" },

                -- <leader> w --- window
                { "<leader>w", group = "Window" },
                { "<leader>w<c-o>", "<c-w>o", desc = "Delete other window" },
                { "<leader>wd", "<c-w>c", desc = "Delete window" },
                { "<leader>wo", "<c-w>o", desc = "Delete other window" },
                { "<leader>ws", "<c-w>s", desc = "Horizontal Split" },
                { "<leader>wv", "<c-w>v", desc = "Vertical Split" },
                -- `C-W p` doesn't work if the next buffer is opened via `Telescope`.
                -- However, it works when opened from `oil.nvim` or `:e .`.
                -- I am not the only one experiencing this issue; others have resorted to using `C-w hjkl`.
                -- But my Doom Emacs muscle memory is so strong that I don't want to abandon it.
                -- Thus, the wizards of the Neovim core team come to my rescue with this `expr` hackery.
                -- Thank you, Sean Dewar (seandewar).
                { "<leader>ww", "winnr('#') != 0 && winnr('#') != winnr() ? '<C-W>p' : '<C-W>w'", desc = "Other window", expr = true, replace_keycodes = false },


                -- <leader> W --- Workspace
                { "<leader>W", group = "Workspace" },
                { "<leader>Wa", function() Utils.add_cwd_to_workspace() end, desc = "Add Workspace" },
                { "<leader>Wx", function() Utils.remove_cwd_from_workspace() end, desc = "Remove Workspace" },
                { "<leader>Ww", function() Utils.workspaces() end, desc = "Open Workspace" },

                -- misc
                { "<leader>m", "<cmd>MCstart<cr>", desc = "Multiple cursors", mode = "v" },
            })
            -- stylua: ignore end
        end,
    },
}
