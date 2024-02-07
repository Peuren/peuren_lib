TextUI = {
    Draw = function(text, pos)
        exports[Config.TextUIResource]:DisplayText(text)
    end,
    Stop = function()
        exports[Config.TextUIResource]:HideText()
    end
}

return TextUI