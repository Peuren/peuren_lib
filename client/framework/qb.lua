QBCore = exports[Config.FrameworkResource]:GetCoreObject()

Framework = {
    Callbacks = {
        Trigger = function(name, ...)
            local p = promise:new()
            QBCore.Functions.TriggerCallback(name, function(...)
                p:resolve(...)
            end, ...)
            return Citizen.Await(p)
        end,
        TriggerAsync = function(name, cb, ...)
            QBCore.Functions.TriggerCallback(name, cb, ...)
        end
    },

    SpawnVehicle = function(model, pos, cb, networked)
        QBCore.Functions.SpawnVehicle(model, cb, pos, networked)
    end
}

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('peuren_lib:PlayerLoaded')
end)

return Framework