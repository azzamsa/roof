local opt = vim.opt

-- Enable roof! auto format
vim.g.autoformat = true

-- `autochdir` is not reliable enough
-- It doesn't update the `pwd` even in the event of buffer change
--
-- opt.autochdir = true

-- Enable auto write
opt.autowrite = true
-- Sync with system clipboard
opt.clipboard = "unnamedplus"
-- Set completeopt for 'cmp' plugin
opt.completeopt = "menu,menuone,noselect"

-- Hide * markup for bold and italic
-- opt.conceallevel = 3

-- Confirm to save changes before exiting modified buffer
opt.confirm = true

-- Cursorline highlighting make the text somewhat hard to read
--
-- Enable highlighting of the current line
-- opt.cursorline = true

-- Use spaces instead of tabs
opt.expandtab = true
-- Define format options
opt.formatoptions = "jcroqlnt" -- tcqj
-- Configure grep format
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
-- Ignore case in search patterns
opt.ignorecase = true
-- Preview incremental substitute
opt.inccommand = "nosplit"
-- Global statusline
opt.laststatus = 3
-- Show some invisible characters (tabs, spaces, and newlines)
opt.list = true
-- Enable mouse mode
opt.mouse = "a"
-- Print line number
opt.number = true
-- Popup blend
opt.pumblend = 10
-- Maximum number of entries in a popup
opt.pumheight = 10
-- Relative line numbers
opt.relativenumber = true
-- Lines of context
opt.scrolloff = 4
-- Define session options
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
-- Default $SHELL
opt.shell = "fish"
-- Larger recentfiles
opt.shada = { "!", "'1000", "<50", "s10", "h" }
-- Round indent
opt.shiftround = true
-- Size of an indent
opt.shiftwidth = 2
-- Configure shortmess
opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- Don't show mode since we have a statusline
opt.showmode = false
-- Columns of context
opt.sidescrolloff = 8
-- Always show the signcolumn, otherwise it would shift the text each time
opt.signcolumn = "yes"
-- Don't ignore case with capitals
opt.smartcase = true
-- Insert indents automatically
opt.smartindent = true
-- Set spellcheck language
opt.spelllang = { "en" }
-- Put new windows below current
opt.splitbelow = true
-- Keep windows split by screen
opt.splitkeep = "screen"
-- Put new windows right of current
opt.splitright = true
-- Number of spaces tabs count for
opt.tabstop = 2
-- True color support
opt.termguicolors = true
-- Set time to wait for a mapped sequence to complete
opt.timeoutlen = 300
-- Enable persistent undo
opt.undofile = true
opt.undolevels = 10000
-- Save swap file and trigger CursorHold
opt.updatetime = 200
-- Allow cursor to move where there is no text in visual block mode
opt.virtualedit = "block"
-- Command-line completion mode
opt.wildmode = "longest:full,full"
-- Minimum window width
opt.winminwidth = 5
-- Disable line wrap
opt.wrap = false
-- Customize fillchars
opt.fillchars = {
    foldopen = "",
    foldclose = "",
    -- fold = "⸱",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}

if vim.fn.has("nvim-0.10") == 1 then
    opt.smoothscroll = true
end

-- Put anything you want to happen only in Neovide here
if vim.g.neovide then
    -- Set the font for graphical Neovim applications
    -- Include the Emoji font to display colored emojis
    opt.guifont = "Iosevka Nerd Font,Noto Color Emoji:h19"
    vim.g.neovide_cursor_vfx_mode = "railgun"

    -- Unlike Terminals, Neovide doesn't add or remove any keybindings to Neovim.
    local map = vim.keymap.set
    -- This is so strange, it doesn't work when I only try to put one of the mode.
    -- I need to put them all.
    map({ "c", "n", "v", "i" }, "<C-y>", "<c-r>*", { desc = "Paste" }) -- In search prompt, telescope.
    map("t", "<c-y>", [[<C-\><C-n>p]], { desc = "Paste" })
end
