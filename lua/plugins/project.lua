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
        -- Don't use `lsp` as detection method.
        -- It will use a buffer's directory as a root project.
        detection_methods = { "pattern" },
        --  `.project` and `.projectile` are part of the Emacs's project detection system.
        patterns = { ".git", "justfile", "Makefile", "package.json", ".project", ".projectile" },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = true,
        -- Set to `true` to enable debugging.
        -- But it is too noisy when switching between buffers a lot.
        silent_chdir = true,
        scope_chdir = "global",
    })
end

return M
