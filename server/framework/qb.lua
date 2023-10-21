QBCore = exports[Config.FrameworkResource]:GetCoreObject()

Framework = {
    RegisterCallback = function(name, cb, ...)
        QBCore.Functions.CreateCallback(name, cb, ...)
    end
}

return Framework