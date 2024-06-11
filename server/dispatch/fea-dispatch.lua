Dispatch = function(data)
    TriggerEvent('fae-dispatch:alert', data.dispatch_code.." - "..data.message, data.message, data.pos.xyz, exports[Config.DispatchResource]:CoordToString(data.pos.xyz))
end 

return Dispatch