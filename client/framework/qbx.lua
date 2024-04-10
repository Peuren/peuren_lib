Framework = {
    PlayerLoaded = exports.qbx_core:GetPlayerData() ~= nil,
    Callbacks = {
        Trigger = function(name, ...)
            return lib.callback.await(name, false, ...)
        end,
        TriggerAsync = function(name, cb, ...)
            lib.callback(name, false, cb, ...)
        end
    },

    SpawnVehicle = function(model, pos, cb, networked)
        QBCore.Functions.SpawnVehicle(model, cb, pos, networked)
    end
}

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('peuren_lib:PlayerLoaded')
    Framework.PlayerLoaded = true
end)

return Framework