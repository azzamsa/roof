local Util = require("lazyvim.util")

local function get_daily_quote()
  math.randomseed(os.time())

  local lines = vim.fn.readfile(vim.fn.stdpath("config") .. "/etc/quotes")
  local filtered_lines = vim.tbl_filter(function(line)
    return not line:match("^%s*$") and not line:match("^%s*#")
  end, lines)

  return "    " .. filtered_lines[math.random(#filtered_lines)]
end

return {

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local daily_quote = get_daily_quote()
      local logo = [[
          ██████╗  ██████╗  ██████╗ ███████╗██╗
          ██╔══██╗██╔═══██╗██╔═══██╗██╔════╝██║
          ██████╔╝██║   ██║██║   ██║█████╗  ██║
          ██╔══██╗██║   ██║██║   ██║██╔══╝  ╚═╝
          ██║  ██║╚██████╔╝╚██████╔╝██║     ██╗
          ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n" .. daily_quote .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
            { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
            { action = "Telescope projects",                                       desc = " Recent projects", icon = "", key = "p" },
            { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
            }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
