-- To get list of vim modes: `h: modes`
--[[
(n) Normal
(v) Visual and Select
(s) Select
(x) Visual
(o) Operator-pending
(i) Insert
(c) Command-line
(t) Terminal
--]]

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigation
--     ^
--     i
-- < n   o >
--     e
--     v
map({ "n", "v", "o" }, "n", "h", { desc = "" })
map({ "n", "v", "o" }, "e", "j", { desc = "" })
map({ "n", "v", "o" }, "i", "k", { desc = "" })
map({ "n", "v", "o" }, "o", "l", { desc = "" })

-- Search next/previous
map({ "n", "v", "o" }, "k", "n", { desc = "" })
map({ "n", "v", "o" }, "K", "N", { desc = "" })

-- Insert
map({ "n", "v" }, "u", "i", { desc = "" })
map({ "n", "v" }, "U", "I", { desc = "" })

map({ "n", "v" }, "m", "o", { desc = "" })
map({ "n", "v" }, "M", "O", { desc = "" })

-- Marks
map({ "n" }, "h", "m", { desc = "" })
map({ "n" }, "h", "m", { desc = "" })

-- Undo operations
map({ "n" }, "l", "u", { desc = "" })

-- Join lines
map({ "n", "v" }, "N", "J", { desc = "" })

-- Lookup
map({ "n", "v" }, "E", "K", { desc = "" })

-- Jump to bottom of window
map({ "n", "v", "o" }, "I", "L", { desc = "" })

-- Downcase/upcase
map({ "v" }, "l", "u", { desc = "" })
map({ "v" }, "L", "U", { desc = "" })

-- Inner text object keymap
map({ "o" }, "u", "i", { desc = "" })

-- Jump to end of word
map({ "n", "v", "o" }, "f", "e", { desc = "" })
map({ "n", "v", "o" }, "F", "E", { desc = "" })

-- Jump to character
map({ "n", "v", "o" }, "t", "f", { desc = "" })
map({ "n", "v", "o" }, "T", "F", { desc = "" })

-- jump until character
map({ "n", "v", "o" }, "j", "T", { desc = "" })
map({ "n", "v", "o" }, "j", "T", { desc = "" })

--
-- Handy keymap
--

-- Better up/down
map({ "n", "x" }, "e", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map({ "n", "x" }, "i", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> mnei keys
map("n", "<C-w>n", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-w>e", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-w>i", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-w>o", "<C-w>l", { desc = "Go to right window", remap = true })

-- Move Lines
map("n", "<A-e>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-i>", "<cmd>m .-2<cr>==", { desc = "Move up" })

map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })

map("i", "<A-e>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-i>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })

map("v", "<A-e>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-i>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Save file
map({ "i", "v", "n" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

--
-- Plugins
--
