Dispatch = function(data)
    exports["ps-dispatch"]:CustomAlert({
        coords = data.pos.xyz,
        message = data.message,
        dispatchCode = data.dispatch_code,
        description =  data.message,
        radius = 25.0,
        sprite = data.sprite,
        color = data.color,
        scale = data.scale,
        length = data.time,
    })
end 

return Dispatch