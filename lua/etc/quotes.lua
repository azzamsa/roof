local M = {}

local quotes = {
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

function M.random()
    local random_index = math.random(1, #quotes)
    return quotes[random_index]
end

return M
