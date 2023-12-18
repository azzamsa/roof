-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- It is the 21st century; should I save files manually?
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  command = "silent! wa",
})

-- ~/.config/nvim/lua/config/autocmds.lua
vim.cmd([[
  autocmd BufReadPre * hi TrailingWhitespace guibg=red|match TrailingWhitespace /\s\+$/
]])

-- Change working directory
vim.api.nvim_create_user_command("Cwd", function()
  vim.cmd(":cd %:p:h")
  vim.cmd(":pwd")
end, { desc = "cd current file's directory" })

-- Set working directory (alias)
vim.api.nvim_create_user_command("Swd", function()
  vim.cmd(":cd %:p:h")
  vim.cmd(":pwd")
end, { desc = "cd current file's directory" })
