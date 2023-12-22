local opt = vim.opt

-- `autochdir` is not reliable enough
-- It doesn't update the `pwd` even in the event of buffer change
-- opt.autochdir = true

-- Enable auto write
opt.autowrite = true
-- Disable backup files
opt.backup = false
-- Sync with system clipboard
opt.clipboard = "unnamedplus"
-- Increase neovim command line height for better message visibility
opt.cmdheight = 1
-- Set completeopt for 'cmp' plugin
opt.completeopt = { "menuone", "noselect" }
-- Ensure conceal characters are visible in markdown files
opt.conceallevel = 0

-- Set file encoding to UTF-8
-- opt.fileencoding = "utf-8"

-- Highlight all matches on previous search pattern
opt.hlsearch = true
-- Ignore case in search patterns
opt.ignorecase = true
-- Allow the mouse to be used in Neovim
opt.mouse = "a"
-- Set pop-up menu height
opt.pumheight = 10
-- Set pop-up menu blend
opt.pumblend = 10
-- Hide mode display
opt.showmode = false
-- Always show tabs
opt.showtabline = 1
-- Enable smart case in search patterns
opt.smartcase = true
-- Enable smart indentation
opt.smartindent = true
-- Force horizontal splits to go below current window
opt.splitbelow = true
-- Force vertical splits to go to the right of the current window
opt.splitright = true
-- Disable swap files
opt.swapfile = false
-- Set term gui colors
opt.termguicolors = true
-- Set time to wait for a mapped sequence to complete
opt.timeoutlen = 300
-- Enable persistent undo
opt.undofile = true
-- Set update time for faster completion
opt.updatetime = 100
-- Disable backup file creation
opt.writebackup = false
-- Convert tabs to spaces
opt.expandtab = true
-- Set number of spaces inserted for each indentation
opt.shiftwidth = 2
-- Set spaces for a tab
opt.tabstop = 2
-- Highlight the current line
opt.cursorline = true
-- Display line numbers
opt.number = true
-- Set last status
opt.laststatus = 3
-- Hide command display
opt.showcmd = false
-- Hide ruler
opt.ruler = false
-- Set relative numbered lines
opt.relativenumber = true
-- Set number column width
opt.numberwidth = 4
-- Always show the sign column
opt.signcolumn = "yes"
-- Disable line wrapping
opt.wrap = false
-- Set scrolloff
opt.scrolloff = 0
-- Set sidescrolloff
opt.sidescrolloff = 8
-- Set the font for graphical Neovim applications
-- Include the Emoji font to display colored emojis
opt.guifont = "Iosevka Nerd Font,Noto Color Emoji:h19"
-- Disable window title
opt.title = false
-- Set shell to fish
opt.shell = "/usr/bin/fish"

-- Customize fillchars
opt.fillchars = opt.fillchars + "eob: "
opt.fillchars:append({
    stl = " ",
})

-- Add shortmess option
opt.shortmess:append("c")
-- Set whichwrap
vim.cmd("set whichwrap+=<,>,[,],h,l")
-- Set iskeyword
vim.cmd([[set iskeyword+=-]])

-- Autoformat
vim.g.autoformat = true

-- Configure netrw options
vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2

-- Check if Neovide is present and configure specific options
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_cursor_vfx_mode = "railgun"
end
