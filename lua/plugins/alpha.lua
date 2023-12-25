local M = {
    "goolord/alpha-nvim",
    event = "VimEnter",
    commit = "234822140b265ec4ba3203e3e0be0e0bb826dff5",
}

local function random_quote()
    return require("etc.quotes").random()
end

function M.config()
    local dashboard = require("alpha.themes.dashboard")
    local icons = require("plugins.icons")

    local function button(sc, txt, keybind, keybind_opts)
        local b = dashboard.button(sc, txt, keybind, keybind_opts)
        b.opts.hl_shortcut = "Macro"
        return b
    end

    -- To be colorized correctly, it must be a valid string.
    -- Using a table and concatenation doesn't work.
    local header = {
        [[      ★ ✯   🛸        🪐   .°•         ]],
        [[          ° ★  •       🛰              ]],
        [[ ██████╗  ██████╗  ██████╗ ███████╗██╗ ]],
        [[ ██╔══██╗██╔═══██╗██╔═══██╗██╔════╝██║ ]],
        [[ ██████╔╝██║   ██║██║   ██║█████╗  ██║ ]],
        [[ ██╔══██╗██║   ██║██║   ██║██╔══╝  ╚═╝ ]],
        [[ ██║  ██║╚██████╔╝╚██████╔╝██║     ██╗ ]],
        [[ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝ ]],
    }

    dashboard.section.buttons.val = {
        button("f", icons.ui.Files .. " Find file", ":Telescope find_files <CR>"),
        button("p", icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
        button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
        button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
    }

    dashboard.section.header.val = header
    dashboard.section.footer.val = ""
    dashboard.section.footer.val = random_quote()

    dashboard.section.header.opts.hl = "String"
    dashboard.section.buttons.opts.hl = "Macro"
    dashboard.section.footer.opts.hl = "Type"

    dashboard.opts.opts.noautocmd = true
    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd({ "User" }, {
        pattern = { "AlphaReady" },
        callback = function()
            vim.cmd([[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
        end,
    })
end

return M
