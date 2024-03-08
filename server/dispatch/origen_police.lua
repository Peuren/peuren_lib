Dispatch = function(data)
    exports["origen_police"]:SendAlert({
        coords = data.pos.xyz, -- Coordinates vector3(x, y, z) in which the alert is triggered
        title = data.dispatch_code.." - "..data.message, -- Title in the alert header
        type = "GENERAL", -- Alert type (GENERAL, RADARS, 215, DRUGS, FORCE, 48X) This is to filter the alerts in the dashboard
        message = data.message, -- Alert message
    })
end 

return Dispatch