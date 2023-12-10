Dispatch = function(data)
    for k, v in pairs(data.police_jobs) do
        exports[Config.DispatchResource]:addCall(data.dispatch_code, data.message, {}, data.pos.xyz, data.police_jobs, data.time * 1000, data.sprite, data.color)
    end
end 

return Dispatch