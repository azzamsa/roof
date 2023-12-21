require("configs.launch")
require("configs.options")
-- Colemak-DH keymap
require("configs.keymaps")
require("configs.autocmds")

-- Specifies the colorscheme for the editor.
spec("plugins.colorscheme")
-- Enhances file icons in the editor.
spec("plugins.devicons")
-- Provides enhanced syntax highlighting using Treesitter.
spec("plugins.treesitter")
-- LSP servers package manager
spec("plugins.mason")
-- Access to the SchemaStore.org catalog.
spec("plugins.schemastore")
-- Configures Language Server Protocol (LSP) settings.
spec("plugins.lspconfig")
-- A winbar that uses LSP to display current code context.
spec("plugins.navic")
-- Breadcrumbs navigation.
spec("plugins.breadcrumbs")
-- Support for null-ls, a pluggable asynchronous completion framework.
spec("plugins.null-ls")
-- Enhances code highlighting and visibility.
spec("plugins.illuminate")
-- Integrates the Telescope plugin for fuzzy finding.
spec("plugins.telescope")
-- Extends Telescope for navigating tabs.
spec("plugins.telescope-tabs")
-- A file explorer tree.
spec("plugins.nvimtree")
-- Customizes the status line.
spec("plugins.lualine")
-- Keybinding guides and menus.
spec("plugins.whichkey")
-- Configures the completion plugin, possibly nvim-cmp.
spec("plugins.cmp")
-- Enhances automatic pairing of brackets, quotes, etc.
spec("plugins.autopairs")
-- Enhances commenting functionality.
spec("plugins.comment")
-- Integrates Git signs for displaying changes in the gutter.
spec("plugins.gitsigns")
-- Magit for Neovim.
spec("plugins.neogit")
-- Enhances the diff view functionality.
spec("plugins.diffview")
-- Displays vertical lines to indicate indentation levels.
spec("plugins.indentline")
-- Dashboard
spec("plugins.alpha")
-- Adds a layer of ✨bling✨ to netrw.
-- spec("plugins.netrw")
spec("plugins.oil")
-- Project management.
spec("plugins.project")
-- Floating terminal
spec("plugins.toggleterm")
-- Delete Neovim buffers without losing window layout
spec("plugins.bufdelete")
-- Trim tailing whitespaces
spec("plugins.trim")
-- Multiple cursors
spec("plugins.visualmulti")
-- Replaces the UI for messages, cmdline and the popupmenu.
spec("plugins.noice")
-- Surround actions
spec("plugins.surround")
-- Jump around
spec("plugins.flash")
-- Markdown support
spec("plugins.markdown")
-- KDL support
spec("plugins.kdl")
-- Color highlighter
spec("plugins.rainbow")

require("configs.utils")
-- Nvim package manager
require("plugins.lazy")
