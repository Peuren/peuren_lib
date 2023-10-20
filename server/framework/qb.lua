QBCore = exports['qb-core']:GetCoreObject()

Framework = {
    RegisterCallback = function(name, cb)
        QBCore.Functions.CreateCallback(name, cb)
    end
}

return Framework