local M = {}

M.quotes = {
    "Practice. It is Practice. Practice.", -- Sarah Andersen
    "Do it scared.",
    "Don't fear moving slowly. Fear standing still.",
    "Be brave enough to suck at something new.",
    "If you don't struggle, you don't improve.",
    "You miss 100% of the shots you don't take.", -- Wayne Gretzky
    "Your past does not equal your future.",
    "Without self-discipline, success is impossible.",
    "Confidence is quiet. Insecurities are loud.",
    "The master has failed more than the beginner", -- Stephen McCranie
}

local personal_quotes = require("configs.personal").quotes

-- Concatenate the two quotes
for _, quote in ipairs(personal_quotes) do
    table.insert(M.quotes, quote)
end

function M.random()
    local random_index = math.random(1, #M.quotes)
    return M.quotes[random_index]
end

return M
