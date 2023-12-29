-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    command = "checktime",
})

-- Highlight yanked text briefly after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
    end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- Go to last loc when opening a buffer (à la save-place mode)
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(event)
        local exclude = { "gitcommit", "NeogitStatus", "NeogitCommitMessage" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].roof_last_loc then
            return
        end
        vim.b[buf].roof_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Disable 'c', 'r', and 'o' formatoptions when entering a buffer/window
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.cmd("set formatoptions-=cro")
    end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = {
        "netrw",
        "Jaq",
        "qf",
        "git",
        "help",
        "man",
        "lspinfo",
        "spectre_panel",
        "lir",
        "DressingSelect",
        "tsplayground",
        "",
    },
    callback = function()
        vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
    end,
})

-- Automatically quit Vim when entering command-line mode
vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
    callback = function()
        vim.cmd("quit")
    end,
})

-- Wrap and `spell check` in these filetype
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Save all files silently on focus lost or buffer leave
-- It is the 21st century; should I save files manually?
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
    command = "silent! wa",
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Associate them to HTML
vim.cmd([[autocmd BufRead,BufNewFile *.njk set filetype=htmldjango]])
