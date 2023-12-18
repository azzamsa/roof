-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- List of vim modes
--[[
n  Normal mode map.
i  Insert mode map.
v  Visual and select mode map.
x  Visual mode map.
s  Select mode map.
c  Command-line mode map.
o  Operator pending mode map.
--]]
local map = vim.keymap.set

-- Insert Key
map({ "n", "x" }, "u", "i", { desc = "" })
map({ "n", "x" }, "U", "I", { desc = "" })

-- Undo operations
--
map({ "n", "x" }, "l", "u", { desc = "" })
map({ "n", "x" }, "L", "U", { desc = "" })

-- Cursor Movement
--     ^
--     e
-- < m   i >
--     n
--     v

map({ "n", "x" }, "m", "h", { desc = "" })
map({ "n", "x" }, "M", "H", { desc = "" })

map({ "n", "x" }, "n", "j", { desc = "" })
map({ "n", "x" }, "N", "J", { desc = "" })

map({ "n", "x" }, "e", "k", { desc = "" })
map({ "n", "x" }, "E", "K", { desc = "" })

map({ "n", "x" }, "i", "l", { desc = "" })
map({ "n", "x" }, "I", "L", { desc = "" })

map({ "n", "x" }, "n", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map({ "n", "x" }, "e", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Search
map("n", "k", "n", { desc = "" })
map("n", "K", "N", { desc = "" })

---- Move to window using the <ctrl> hjkl keys
map("n", "<C-m>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-n>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-e>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-i>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Move Lines
map("n", "<A-n>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-e>", "<cmd>m .-2<cr>==", { desc = "Move up" })

map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })

map("i", "<A-n>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-e>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })

map("v", "<A-n>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-e>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
