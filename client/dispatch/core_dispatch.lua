Dispatch = function(data)
    for k, v in pairs(data.police_jobs) do
        exports['core_dispach']:addCall(data.dispatch_code, data.message, {}, data.pos.xyz, data.police.groups[1], data.time * 1000, data.sprite, data.color)
    end
end 

return Dispatch