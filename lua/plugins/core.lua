local Path = require("configs.utils.path")
local Utils = require("configs.utils")

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local which_key = require("which-key")
            which_key.setup({})

            -- stylua: ignore start
            which_key.add({
                -- Every keymap that uses a custom functionmeans the default `Telescope <*>`
                -- always starts from the `cwd`.
                { "<leader>x", function() Utils.toggle_scratch_buffer() end, desc = "Open scratch buffer", nowait = true, remap = false },
                { "<leader>'", "<cmd>Telescope resume<cr>", desc = "Resume last search", nowait = true, remap = false },
                { "<leader>,", "<cmd>Telescope buffers previewer=false<cr>", desc = "Switch buffer", nowait = true, remap = false },
                { "<leader>.", function() Utils.find_files_from_here() end, desc = "Find file from here", nowait = true, remap = false },
                { "<leader>/", function() Utils.grep_in_project() end, desc = "Search in project", nowait = true, remap = false },
                { "<leader><cr>", function() local bookmarks = require("etc.bookmarks").bookmarks require("configs.utils.picker").bookmarks({ bookmarks = bookmarks }) end, desc = "Jump to bookmark", nowait = true, remap = false },
                { "<leader><space>", function() Utils.find_files_in_project() end, desc = "Find project file", nowait = true, remap = false },
                { "<leader>`", "<cmd>buffer#<cr>", desc = "Switch to last buffer", nowait = true, remap = false },

                -- <leader> b --- buffer
                { "<leader>b", group = "Buffers", nowait = true, remap = false },
                { "<leader>bb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch buffer", nowait = true, remap = false },
                { "<leader>bk", "<cmd>bd<cr>", desc = "Kill buffer", nowait = true, remap = false },
                { "<leader>bK", "<cmd>%bd!<cr>", desc = "Kill all buffer", nowait = true, remap = false },
                { "<leader>br", "<cmd>edit!<cr>", desc = "Revert buffer", nowait = true, remap = false },
                { "<leader>bs", "<cmd>w<cr>", desc = "Save buffer", nowait = true, remap = false },
                { "<leader>bS", "<cmd>wa<cr>", desc = "Save all buffers", nowait = true, remap = false },
                { "<leader>bu", "<cmd>SudaWrite<cr>", desc = "Save buffer as root", nowait = true, remap = false },
                { "<leader>bO", "<cmd>%bd <bar> e#<cr>", desc = "Kill other buffers", nowait = true, remap = false },

                -- <leader> c --- code
                { "<leader>c", group = "Code", nowait = true, remap = false },
                { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
                { "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Jump to definition", nowait = true, remap = false },
                { "<leader>ce", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Line Diagnostics", nowait = true, remap = false },
                { "<leader>cf", function() require("conform").format({ async = false, lsp_fallback = false }) end, desc = "Format", nowait = true, remap = false },
                { "<leader>cp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview", nowait = true, remap = false },
                { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
                { "<leader>cw", "<cmd>Trim<cr>", desc = "Delete trailing whitespaces", nowait = true, remap = false }, { "<leader>cx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Diagnostics", nowait = true, remap = false },
                { "<leader>cS", "<cmd>SymbolsOutline<cr>", desc = "Symbols", nowait = true, remap = false },
                { "<leader>cX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Project diagnostics", nowait = true, remap = false },

                -- <leader> f --- file
                { "<leader>f", group = "File", nowait = true, remap = false },
                { "<leader>fd", "<cmd>Oil<cr>", desc = "Find directory", nowait = true, remap = false },
                { "<leader>fD", "<cmd>call delete(expand('%')) <bar> bdelete!<cr>", desc = "Delete this file", nowait = true, remap = false },
                { "<leader>fy", function() Utils.copy_filename_to_clipboard() end, desc = "Copy file name", nowait = true, remap = false },
                { "<leader>fY", function() Utils.copy_filepath_to_clipboard() end, desc = "Copy file path", nowait = true, remap = false },
                { "<leader>fe", function() Utils.find_files_in_config() end, desc = "Find file in config", nowait = true, remap = false },
                { "<leader>ff", function() Utils.find_files_in_project() end, desc = "Find file", nowait = true, remap = false },
                { "<leader>fF", function() Utils.find_files_from_here() end, desc = "Find file from here", nowait = true, remap = false },
                { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent file", nowait = true, remap = false },
                { "<leader>fR", "<cmd>MurenToggle<cr>", desc = "Replace in files", nowait = true, remap = false },
                { "<leader>fs", "<cmd>w<cr>", desc = "Save buffer", nowait = true, remap = false },
                { "<leader>fS", "<cmd>wa<cr>", desc = "Save all buffers", nowait = true, remap = false },

                -- <leader> g --- version control
                { "<leader>g", group = "VCS", icon = "", nowait = true, remap = false },
                { "<leader>gg", function() Utils.ngit_here() end, desc = "Neogit", icon = "", nowait = true, remap = false },
                { "<leader>gt", "<cmd>Tardis<cr>", desc = "Git time machine", icon = "", nowait = true, remap = false },

                -- <leader> h --- help
                { "<leader>h", group = "Help", icon = "󰞋", nowait = true, remap = false },
                { "<leader>hc", "<cmd>Telescope commands<cr>", desc = "Commands", icon = "󰞋", nowait = true, remap = false },
                { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help", icon = "󰞋", nowait = true, remap = false },
                { "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", icon = "󰞋", nowait = true, remap = false },
                { "<leader>hm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", icon = "󰞋", nowait = true, remap = false },

                -- <leader> i --- insert
                { "<leader>i", group = "Insert", icon = "󰏪", nowait = true, remap = false },
                { "<leader>id", "<cmd>exec 'normal! a' . strftime('%Y-%m-%d %H:%M')<cr>", desc = "Current date and time", icon = "󰏪", nowait = true, remap = false },
                { "<leader>if", "<cmd>exec 'normal! a' . expand('%:t')<cr>", desc = "Current file name", icon = "󰏪", nowait = true, remap = false },
                { "<leader>iF", "<cmd>exec 'normal! a' . expand('%:p')<cr>", desc = "Current file path", icon = "󰏪", nowait = true, remap = false },

                -- <leader> o --- open
                { "<leader>o", group = "Open", icon = " ", nowait = true, remap = false },
                { "<leader>od", "<cmd>Oil<cr>", desc = "File manager from here", icon = " ", nowait = true, remap = false },
                { "<leader>op", function() Utils.ntree_here() end, desc = "Side panel", icon = " ", nowait = true, remap = false },
                { "<leader>ox", function() Utils.open_with(Path.current_dir()) end, desc = "GUI File manager", icon = " ", nowait = true, remap = false },

                -- <leader> p --- project
                { "<leader>p", group = "Project", icon = "", nowait = true, remap = false },
                { "<leader>pf", function() Utils.find_files_in_project() end, desc = "Find project file", icon = "", nowait = true, remap = false },
                { "<leader>pp", "<cmd>Telescope projects<cr>", desc = "Switch project", icon = "", nowait = true, remap = false },
                { "<leader>ps", function() Utils.grep_in_project() end, desc = "Search in project", icon = "", nowait = true, remap = false },

                -- <leader> q --- quit
                { "<leader>q", group = "Quit", nowait = true, remap = false },
                -- Avoid accidental presses of lowercase 'q'
                { "<leader>qQ", "<cmd>wa <bar> qa<cr>", desc = "Quit", nowait = true, remap = false },

                -- <leader> s --- search
                { "<leader>s", group = "Search", nowait = true, remap = false },
                { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
                { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command history", nowait = true, remap = false },
                { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
                { "<leader>sg", function() Utils.grep_from_here() end, desc = "Search", nowait = true, remap = false },
                { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
                { "<leader>ss", "<cmd>Telescope spell_suggest<cr>", desc = "Spell candidate", nowait = true, remap = false },
                { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Visual undo", nowait = true, remap = false },
                { "<leader>sK", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },

                -- <leader> t --- toggle
                { "<leader>t", group = "Toggle", nowait = true, remap = false },
                { "<leader>tc", function() Utils.toggle_opt("conceallevel") end, desc = "Conceal", nowait = true, remap = false },
                { "<leader>tC", "<cmd>ColorizerToggle<cr>", desc = "Rainbow color", nowait = true, remap = false },
                { "<leader>td", function() Utils.toggle_diagnostics() end, desc = "Diagnostics", nowait = true, remap = false },
                { "<leader>tf", function() Utils.toggle_autoformat() end, desc = "Auto format", nowait = true, remap = false },
                { "<leader>th", function() Utils.toggle_inlay_hints() end, desc = "Inlay Hints", nowait = true, remap = false, },
                { "<leader>tl", function() Utils.toggle_line_number() end, desc = "Line numbers", nowait = true, remap = false },
                { "<leader>tL", function() Utils.toggle_opt("relativenumber") end, desc = "Relative line numbers", nowait = true, remap = false },
                { "<leader>ts", function() Utils.toggle_opt("spell") end, desc = "Spelling", nowait = true, remap = false },
                { "<leader>tw", function() Utils.toggle_opt("wrap") end, desc = "Word wrap", nowait = true, remap = false },
                { "<leader>tT", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, desc = "Treesitter", nowait = true, remap = false },

                -- <leader> w --- window
                { "<leader>w", group = "Window", nowait = true, remap = false },
                { "<leader>w<c-o>", "<c-w>o", desc = "Delete other window", nowait = true, remap = false },
                { "<leader>wd", "<c-w>c", desc = "Delete window", nowait = true, remap = false },
                { "<leader>wo", "<c-w>o", desc = "Delete other window", nowait = true, remap = false },
                { "<leader>ws", "<c-w>s", desc = "Horizontal Split", nowait = true, remap = false },
                { "<leader>wv", "<c-w>v", desc = "Vertical Split", nowait = true, remap = false },
                -- `C-W p` doesn't work if the next buffer is opened via `Telescope`.
                -- However, it works when opened from `oil.nvim` or `:e .`.
                -- I am not the only one experiencing this issue; others have resorted to using `C-w hjkl`.
                -- But my Doom Emacs muscle memory is so strong that I don't want to abandon it.
                -- Thus, the wizards of the Neovim core team come to my rescue with this `expr` hackery.
                -- Thank you, Sean Dewar (seandewar).
                { "<leader>ww", "winnr('#') != 0 && winnr('#') != winnr() ? '<C-W>p' : '<C-W>w'", desc = "Other window", expr = true, nowait = true, remap = false, replace_keycodes = false },
            })
            -- stylua: ignore end
        end,
    },
}
