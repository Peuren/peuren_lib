TextUI = {
    Draw = function(text, pos)
        exports['qb-core']:DrawText(text, 'right')
    end,
    Stop = function()
        exports['qb-core']:HideText()
    end
}

return TextUI