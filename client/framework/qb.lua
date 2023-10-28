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
    GetItemlabel = function(item)
        if not QBCore.Shared.Items[item] then return "NO_LABEL" end
        return QBCore.Shared.Items[item].label
    end
}

return Framework