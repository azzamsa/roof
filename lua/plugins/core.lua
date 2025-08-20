local Path = require("configs.utils.path")
local Utils = require("configs.utils")

return {
    {
        "folke/which-key.nvim",
        tag = "stable",
        event = "VeryLazy",
        config = function()
            local Snacks = require("snacks")
            local which_key = require("which-key")
            which_key.setup({})
            -- https://github.com/doomemacs/doomemacs/blob/master/modules/config/default/%2Bevil-bindings.el

            -- stylua: ignore start
            which_key.add({
                {"gs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash"},
                {"gS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter"},

                -- LSP
                { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
                { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
                { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
                { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
                { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },

                { "<leader>x", function() Snacks.scratch() end, desc = "Toggle scratch buffer" },
                { "<leader>.", function() Utils.find_files_from_here() end, desc = "Find file from here" },
                { "<leader>'", function() Snacks.picker.resume() end, desc = "Resume last search" },
                { "<leader>,", function() Snacks.picker.buffers() end, desc = "Switch buffer" },
                { "<leader>/", function() Utils.grep_in_project() end, desc = "Search in project" },
                { "<leader><space>", function() Utils.find_files_in_project() end, desc = "Find project file" },
                { "<leader>`", "<cmd>buffer#<cr>", desc = "Switch to last buffer" },

                -- <leader> b --- buffer
                { "<leader>b", group = "Buffers" },
                { "<leader>bb", function() Snacks.picker.buffers() end, desc = "Switch buffer" },
                { "<leader>bk", function() Snacks.bufdelete() end, desc = "Kill buffer" },
                { "<leader>bk", function() Snacks.bufdelete.all() end, desc = "Kill all buffers" },
                { "<leader>br", "<cmd>edit!<cr>", desc = "Revert buffer" },
                { "<leader>bs", "<cmd>w<cr>", desc = "Save buffer" },
                { "<leader>bS", "<cmd>wa<cr>", desc = "Save all buffers" },
                { "<leader>bu", "<cmd>SudaWrite<cr>", desc = "Save buffer as root" },
                { "<leader>bO", function() Snacks.bufdelete.other() end, desc = "Kill other buffers" },

                -- <leader> c --- code
                { "<leader>c", group = "Code", desc = "Code" },
                { "<leader>ca", function() require("actions-preview").code_actions() end, desc = "Code Action", mode = { "n", "v" } },
                { "<leader>cd", vim.lsp.buf.definition, desc = "Jump to definition" },
                { "<leader>ce", vim.diagnostic.open_float, desc = "Line Diagnostics" },
                { "<leader>cf", function() require("conform").format({ async = false, lsp_fallback = false }) end, desc = "Format" },
                { "<leader>cp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
                { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
                { "<leader>cS", "<cmd>SymbolsOutline<cr>", desc = "Symbols" },
                { "<leader>cw", "<cmd>Trim<cr>", desc = "Delete trailing whitespaces" },
                { "<leader>cx", function() Snacks.toggle.diagnostics() end, desc = "Diagnostics" },
                { "<leader>cX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Project diagnostics" },

                -- <leader> f --- file
                { "<leader>f", group = "File" },
                { "<leader>fd", "<cmd>Yazi<cr>", desc = "Find directory" },
                { "<leader>fD", "<cmd>call delete(expand('%')) <bar> bdelete!<cr>", desc = "Delete this file" },
                { "<leader>fy", function() Utils.copy_filename_to_clipboard() end, desc = "Copy file name" },
                { "<leader>fY", function() Utils.copy_filepath_to_clipboard() end, desc = "Copy file path" },
                { "<leader>ff", function() Snacks.picker.files() end, desc = "Find file" },
                { "<leader>fF", "<cmd>Yazi cwd<cr>", desc = "Find file from here" },
                { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent file" },
                { "<leader>fR", function() Utils.spectre_here() end, desc = "Replace in files" },
                { "<leader>fs", "<cmd>w<cr>", desc = "Save buffer" },
                { "<leader>fS", "<cmd>wa<cr>", desc = "Save all buffers" },

                -- <leader> g --- version control
                { "<leader>g", group = "VCS", icon = "" },
                { "<leader>gg", function() Utils.vcs_status() end, desc = "Neogit", icon = "" },
                { "<leader>gt", "<cmd>Tardis<cr>", desc = "Git time machine", icon = "" },

                -- <leader> h --- help
                { "<leader>h", group = "Help", icon = "󰞋" },
                { "<leader>hc", function() Snacks.picker.commands() end, desc = "Commands", icon = "󰞋" },
                { "<leader>hk", function() Snacks.picker.keymaps() end, desc = "Keymaps", icon = "󰞋" },

                -- <leader> i --- insert
                { "<leader>i", group = "Insert", icon = "󰏪" },
                { "<leader>id", "<cmd>exec 'normal! a' . strftime('%Y-%m-%d %H:%M')<cr>", desc = "Current date and time", icon = "󰏪" },
                { "<leader>if", "<cmd>exec 'normal! a' . expand('%:t')<cr>", desc = "Current file name", icon = "󰏪" },
                { "<leader>iF", "<cmd>exec 'normal! a' . expand('%:p')<cr>", desc = "Current file path", icon = "󰏪" },

                -- <leader> o --- open
                { "<leader>o", group = "Open", icon = " " },
                { "<leader>op", function() Utils.file_tree() end, desc = "Side panel", icon = " " },
                { "<leader>oo", function() Utils.open_with(Path.current_dir()) end, desc = "GUI File manager", icon = " " },

                -- <leader> p --- project
                { "<leader>p", group = "Project", icon = "" },
                { "<leader>pf", function() Utils.find_files_in_project() end, desc = "Find project file", icon = "" },
                { "<leader>pp", function() Snacks.picker.projects() end, desc = "Open workdirs", icon = "" },
                { "<leader>ps", function() Utils.grep_in_project() end, desc = "Search in project", icon = "" },

                -- <leader> q --- quit
                { "<leader>q", group = "Quit" },
                { "<leader>qq", "<cmd>wa <bar> qa<cr>", desc = "Quit" },

                -- <leader> s --- search
                { "<leader>s", group = "Search" },
                { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
                { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
                { "<leader>sr", function() Snacks.picker.marks() end, desc = "Marks" },
                { "<leader>ss", function() Snacks.picker.spelling() end, desc = "Spell candidate" },
                { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
                { "<leader>sK", function() Snacks.picker.keymaps() end, desc = "Keymaps" },

                -- <leader> t --- toggle
                { "<leader>t", group = "Toggle" },
                { "<leader>tc", function() Snacks.toggle.option("conceallevel") end, desc = "Conceal" },
                { "<leader>tC", "<cmd>ColorizerToggle<cr>", desc = "Rainbow color" },
                { "<leader>td", function() Snacks.toggle.diagnostics() end, desc = "Diagnostics" },
                { "<leader>tf", function() Utils.toggle_autoformat() end, desc = "Auto format" },
                { "<leader>th", function() Snacks.toggle.inlay_hints() end, desc = "Inlay Hints", },
                { "<leader>tl", function() Snacks.toggle.line_number() end, desc = "Line numbers" },
                { "<leader>tL", function() Snacks.toggle.option("relativenumber") end, desc = "Relative line numbers" },
                { "<leader>ts", function() Snacks.toggle.option("spell") end, desc = "Spelling" },
                { "<leader>tw", function() Snacks.toggle.option("wrap") end, desc = "Word wrap" },
                { "<leader>tT", function() Snacks.toggle.treesitter() end, desc = "Treesitter" },

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

                -- misc
                { "<leader>m", "<cmd>MCstart<cr>", desc = "Multiple cursors", mode = "v" },
            })
            -- stylua: ignore end
        end,
    },
}
