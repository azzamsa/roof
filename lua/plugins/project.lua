local M = {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
}

function M.config()
    require("project_nvim").setup({
        active = true,
        on_config_done = nil,
        manual_mode = false,
        detection_methods = { "lsp", "pattern" },
        --  `.project` and `.projectile` are part of the Emacs's project detection system.
        patterns = { ".git", "justfile", "Makefile", "package.json", ".project", ".projectile" },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = "global",
    })
end

return M
