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

    SpawnVehicle = function(model, pos, cb, networked)
        ESX.Game.SpawnVehicle(model, pos, heading, cb, networked)
    end
}

AddEventHandler('esx:onPlayerSpawn', function()
    TriggerEvent('peuren_lib:PlayerLoaded')
end)

return Framework