-- I am using Lua instead of plain-text because I want to have
-- expressions here, such hiding my $USER, etc.

local M = {}

local ext1 = "/run/media/" .. os.getenv("USER") .. "/exts1"

M.bookmarks = {
    "~/.config",
    "~/playground",
    "~/projects",
    "~/office",
    ext1,
}

return M
