TextUI = {
    Draw = function(text, pos)
        lib.showTextUI(text)
    end,
    Stop = function()
        lib.hideTextUI()
    end
}

return TextUI