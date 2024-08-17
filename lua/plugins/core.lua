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
                -- Every keymap that uses a custom functionmeans the default `FzfLua ...`
                -- always starts from the `cwd`.
                { "<leader>x", function() Utils.toggle_scratch_buffer() end, desc = "Open scratch buffer",   remap = false },
                { "<leader>'", "<cmd>FzfLua live_grep_resume<cr>", desc = "Resume last search",   remap = false },
                { "<leader>,", "<cmd>FzfLua buffers previewer=false<cr>", desc = "Switch buffer", remap = false },
                { "<leader>.", function() Utils.find_files_from_here() end, desc = "Find file from here",   remap = false },
                { "<leader>/", function() Utils.grep_in_project() end, desc = "Search in project",   remap = false },
                { "<leader><cr>", function() Utils.bookmarks() end, desc = "Jump to bookmark",   remap = false },
                { "<leader><space>", function() Utils.find_files_in_project() end, desc = "Find project file",   remap = false },
                { "<leader>`", "<cmd>buffer#<cr>", desc = "Switch to last buffer",   remap = false },

                -- <leader> b --- buffer
                { "<leader>b", group = "Buffers",   remap = false },
                { "<leader>bb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch buffer",   remap = false },
                { "<leader>bk", "<cmd>bd<cr>", desc = "Kill buffer",   remap = false },
                { "<leader>bK", "<cmd>%bd!<cr>", desc = "Kill all buffer",   remap = false },
                { "<leader>br", "<cmd>edit!<cr>", desc = "Revert buffer",   remap = false },
                { "<leader>bs", "<cmd>w<cr>", desc = "Save buffer",   remap = false },
                { "<leader>bS", "<cmd>wa<cr>", desc = "Save all buffers",   remap = false },
                { "<leader>bu", "<cmd>SudaWrite<cr>", desc = "Save buffer as root",   remap = false },
                { "<leader>bO", "<cmd>%bd <bar> e#<cr>", desc = "Kill other buffers",   remap = false },

                -- <leader> c --- code
                { "<leader>c", group = "Code",   remap = false },
                { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
                { "<leader>cd", vim.lsp.buf.definition, desc = "Jump to definition",   remap = false },
                { "<leader>ce", vim.diagnostic.open_float, desc = "Line Diagnostics",   remap = false },
                { "<leader>cf", function() require("conform").format({ async = false, lsp_fallback = false }) end, desc = "Format",   remap = false },
                { "<leader>cp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview",   remap = false },
                { "<leader>cr", vim.lsp.buf.rename, desc = "Rename",   remap = false },
                { "<leader>cw", "<cmd>Trim<cr>", desc = "Delete trailing whitespaces",   remap = false }, { "<leader>cx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Diagnostics",   remap = false },
                { "<leader>cS", "<cmd>SymbolsOutline<cr>", desc = "Symbols",   remap = false },
                { "<leader>cX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Project diagnostics",   remap = false },

                -- <leader> f --- file
                { "<leader>f", group = "File",   remap = false },
                { "<leader>fd", "<cmd>Oil<cr>", desc = "Find directory",   remap = false },
                { "<leader>fD", "<cmd>call delete(expand('%')) <bar> bdelete!<cr>", desc = "Delete this file",   remap = false },
                { "<leader>fy", function() Utils.copy_filename_to_clipboard() end, desc = "Copy file name",   remap = false },
                { "<leader>fY", function() Utils.copy_filepath_to_clipboard() end, desc = "Copy file path",   remap = false },
                { "<leader>fe", function() Utils.find_files_in_config() end, desc = "Find file in config",   remap = false },
                { "<leader>ff", function() Utils.find_files_in_project() end, desc = "Find file",   remap = false },
                { "<leader>fF", function() Utils.find_files_from_here() end, desc = "Find file from here",   remap = false },
                { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent file",   remap = false },
                { "<leader>fR", "<cmd>MurenToggle<cr>", desc = "Replace in files",   remap = false },
                { "<leader>fs", "<cmd>w<cr>", desc = "Save buffer",   remap = false },
                { "<leader>fS", "<cmd>wa<cr>", desc = "Save all buffers",   remap = false },

                -- <leader> g --- version control
                { "<leader>g", group = "VCS", icon = "",   remap = false },
                { "<leader>gg", function() Utils.ngit_here() end, desc = "Neogit", icon = "",   remap = false },
                { "<leader>gt", "<cmd>Tardis<cr>", desc = "Git time machine", icon = "",   remap = false },

                -- <leader> h --- help
                { "<leader>h", group = "Help", icon = "󰞋",   remap = false },
                { "<leader>hc", "<cmd>FzfLua commands<cr>", desc = "Commands", icon = "󰞋",   remap = false },
                { "<leader>hh", "<cmd>FzfLua help_tags<cr>", desc = "Help", icon = "󰞋",   remap = false },
                { "<leader>hk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps", icon = "󰞋",   remap = false },
                { "<leader>hm", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages", icon = "󰞋",   remap = false },

                -- <leader> i --- insert
                { "<leader>i", group = "Insert", icon = "󰏪",   remap = false },
                { "<leader>id", "<cmd>exec 'normal! a' . strftime('%Y-%m-%d %H:%M')<cr>", desc = "Current date and time", icon = "󰏪",   remap = false },
                { "<leader>if", "<cmd>exec 'normal! a' . expand('%:t')<cr>", desc = "Current file name", icon = "󰏪",   remap = false },
                { "<leader>iF", "<cmd>exec 'normal! a' . expand('%:p')<cr>", desc = "Current file path", icon = "󰏪",   remap = false },

                -- <leader> o --- open
                { "<leader>o", group = "Open", icon = " ",   remap = false },
                { "<leader>od", "<cmd>Oil<cr>", desc = "File manager from here", icon = " ",   remap = false },
                { "<leader>op", function() Utils.ntree_here() end, desc = "Side panel", icon = " ",   remap = false },
                { "<leader>ox", function() Utils.open_with(Path.current_dir()) end, desc = "GUI File manager", icon = " ",   remap = false },

                -- <leader> p --- project
                { "<leader>p", group = "Project", icon = "",   remap = false },
                { "<leader>pf", function() Utils.find_files_in_project() end, desc = "Find project file", icon = "",   remap = false },
                { "<leader>pp", function() Utils.projects() end, desc = "Switch project", icon = "",   remap = false },
                { "<leader>ps", function() Utils.grep_in_project() end, desc = "Search in project", icon = "",   remap = false },

                -- <leader> q --- quit
                { "<leader>q", group = "Quit",   remap = false },
                -- Avoid accidental presses of lowercase 'q'
                { "<leader>qQ", "<cmd>wa <bar> qa<cr>", desc = "Quit",   remap = false },

                -- <leader> s --- search
                { "<leader>s", group = "Search",   remap = false },
                { "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command history",   remap = false },
                { "<leader>sC", "<cmd>FzfLua commands<cr>", desc = "Commands",   remap = false },
                { "<leader>sg", function() Utils.grep_from_here() end, desc = "Search",   remap = false },
                { "<leader>sr", "<cmd>FzfLua marks<cr>", desc = "Marks",   remap = false },
                { "<leader>ss", "<cmd>FzfLua spell_suggest<cr>", desc = "Spell candidate",   remap = false },
                { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Visual undo",   remap = false },
                { "<leader>sK", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps",   remap = false },

                -- <leader> t --- toggle
                { "<leader>t", group = "Toggle",   remap = false },
                { "<leader>tc", function() Utils.toggle_opt("conceallevel") end, desc = "Conceal",   remap = false },
                { "<leader>tC", "<cmd>ColorizerToggle<cr>", desc = "Rainbow color",   remap = false },
                { "<leader>td", function() Utils.toggle_diagnostics() end, desc = "Diagnostics",   remap = false },
                { "<leader>tf", function() Utils.toggle_autoformat() end, desc = "Auto format",   remap = false },
                { "<leader>th", function() Utils.toggle_inlay_hints() end, desc = "Inlay Hints",   remap = false, },
                { "<leader>tl", function() Utils.toggle_line_number() end, desc = "Line numbers",   remap = false },
                { "<leader>tL", function() Utils.toggle_opt("relativenumber") end, desc = "Relative line numbers",   remap = false },
                { "<leader>ts", function() Utils.toggle_opt("spell") end, desc = "Spelling",   remap = false },
                { "<leader>tw", function() Utils.toggle_opt("wrap") end, desc = "Word wrap",   remap = false },
                { "<leader>tT", function() Utils.toggle_treesitter() end, desc = "Treesitter",   remap = false },

                -- <leader> w --- window
                { "<leader>w", group = "Window",   remap = false },
                { "<leader>w<c-o>", "<c-w>o", desc = "Delete other window",   remap = false },
                { "<leader>wd", "<c-w>c", desc = "Delete window",   remap = false },
                { "<leader>wo", "<c-w>o", desc = "Delete other window",   remap = false },
                { "<leader>ws", "<c-w>s", desc = "Horizontal Split",   remap = false },
                { "<leader>wv", "<c-w>v", desc = "Vertical Split",   remap = false },
                -- `C-W p` doesn't work if the next buffer is opened via `Telescope`.
                -- However, it works when opened from `oil.nvim` or `:e .`.
                -- I am not the only one experiencing this issue; others have resorted to using `C-w hjkl`.
                -- But my Doom Emacs muscle memory is so strong that I don't want to abandon it.
                -- Thus, the wizards of the Neovim core team come to my rescue with this `expr` hackery.
                -- Thank you, Sean Dewar (seandewar).
                { "<leader>ww", "winnr('#') != 0 && winnr('#') != winnr() ? '<C-W>p' : '<C-W>w'", desc = "Other window", expr = true,   remap = false, replace_keycodes = false },

                -- misc
                { "<leader>m", "<cmd>MCstart<cr>", desc = "Multiple cursors", mode = "v",   remap = false },
            })
            -- stylua: ignore end
        end,
    },
}
