ESX = exports[Config.FrameworkResource]:getSharedObject()

Framework = {
    Callbacks = {
        Trigger = function(name, ...)
            local p = promise:new()
            ESX.TriggerServerCallback(name, function(...)
                p:resolve(...)
            end, ...)
            return Citizen.Await(p)
        end,
        TriggerAsync = function(name, cb, ...)
            ESX.TriggerServerCallback(name, cb, ...)
        end
    },
}

AddEventHandler('esx:onPlayerSpawn', function()
    TriggerEvent('peuren_lib:PlayerLoaded')
end)

return Framework