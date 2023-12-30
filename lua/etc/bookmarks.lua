-- I am using Lua instead of plain-text because I want to have
-- expressions here, such hiding my $USER, etc.

local M = {}

M.bookmarks = {
    "/",
    "~/",
    "~/.config",
    "~/.local",
    "~/playground",
    "~/projects",
    "~/office",
}

local personal_bookmarks = require("configs.personal").bookmarks

-- Concatenate the two bookmarks
for _, bookmark in ipairs(personal_bookmarks) do
    table.insert(M.bookmarks, bookmark)
end

return M
