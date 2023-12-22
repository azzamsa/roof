local spec = require("configs.launch").spec

require("configs.options")
-- Colemak-DH keymap
require("configs.keymaps")
require("configs.autocmds")

--
-- Core
--

-- Keybinding guides and menus.
spec("plugins.whichkey")

-- Magit for Neovim.
spec("plugins.neogit")
-- Display VCS changes in the gutter.
spec("plugins.gitsigns")
-- Floating terminal
spec("plugins.toggleterm")
-- Dired for Nvim.
spec("plugins.oil")
-- Project management.
spec("plugins.project")
-- Fuzzy find things.
spec("plugins.telescope")
-- Extends Telescope for navigating tabs.
spec("plugins.telescope-tabs")
-- Find and replace across files.
spec("plugins.spectre")
-- NeoTree alternative
spec("plugins.nvimtree")

-- Jump around
spec("plugins.flash")
-- Surround actions
spec("plugins.surround")
-- Multiple cursors
spec("plugins.visualmulti")
-- Trim tailing whitespaces
spec("plugins.trim")

--
-- UI
--

-- Dashboard
spec("plugins.alpha")
-- Customizes the status line.
spec("plugins.lualine")
-- Specifies the colorscheme for the editor.
spec("plugins.colorscheme")
-- Enhances file icons in the editor.
spec("plugins.devicons")

-- Replaces the UI for messages, cmdline and the popupmenu.
spec("plugins.noice")

--
-- Programming
--

-- Treesitter support..
spec("plugins.treesitter")
-- LSP support.
spec("plugins.lspconfig")
--  Completion plugin, possibly nvim-cmp.
spec("plugins.cmp")
-- A formatter
spec("plugins.conform")
-- A linter
spec("plugins.lint")
-- Find the the linter errors
spec("plugins.trouble")
-- Displays vertical lines to indicate indentation levels.
spec("plugins.indentline")
-- Color highlighter
spec("plugins.rainbow")
-- Highlight matching word.
spec("plugins.illuminate")
-- Automatic pairing of brackets, quotes, etc.
spec("plugins.autopairs")
-- Enhances commenting functionality.
spec("plugins.comment")

-- LSP servers package manager
spec("plugins.mason")
-- A winbar that uses LSP to display current code context.
spec("plugins.navic")
-- Breadcrumbs navigation.
spec("plugins.breadcrumbs")

--
-- Data
--

-- Markdown support
spec("plugins.markdown")
-- KDL support
spec("plugins.kdl")
-- justfile support
spec("plugins.just")

require("configs.utils")
-- Nvim package manager
require("plugins.lazy")
