Dispatch = function(data)
    exports[Config.DispatchResource]:CustomAlert({
        coords = data.pos.xyz,
        message = data.message,
        alert = {
            displayCode = data.dispatch_code,
            description = data.message,
            sprite = data.sprite,
            color = data.color,
            scale = data.scale,
            length = data.time,
            flash = true
        },
        jobs = data.police.groups[1]
    })
end 

return Dispatch