ESX = exports[Config.FrameworkResource]:getSharedObject()

Framework = {
    RegisterCallback = function(name, cb, ...)
        ESX.RegisterServerCallback(name, cb, ...)
    end
}

return Framework