local dir = "client/%s/%s.lua"
local resource = "peuren_lib"

function LoadModule(module, selection)
    if not selection then
        print(("No selection provided for module: %s. Please set the correct resource or install one of the supported resources"):format(module))
        return nil
    end
    local chunk = LoadResourceFile(resource, dir:format(module, string.lower(selection)))
    if not chunk then
        return error(("Couldn't load module file: %s - %s"):format(module, string.lower(selection)), 3)
    end

    local fn, err = load(chunk, ("@@peuren_lib/client/%s/%s.lua"):format(module, string.lower(selection)))

    if not fn and err then
        return error(("Error loading module: %s - %s"):format(module, string.lower(selection)), 3)
    end

    return fn()
end

Core = {}
Core.Framework = LoadModule("framework", Config.Framework)
Core.Inventory = LoadModule("inventory", Config.Inventory)
Core.VehicleKeys = LoadModule("vehiclekeys", Config.VehicleKeys)
Core.ProgressBar = LoadModule("progressbar", Config.ProgessBar)
Core.Notify = LoadModule("notifications", Config.Notifications)
Core.Weather = LoadModule("weathersync", Config.WeatherSync)
Core.Dispatch = LoadModule("dispatch", Config.Dispatch)
Core.Target = LoadModule("target", Config.Target)
Core.Input = LoadModule("input", Config.Input)
Core.Menu = LoadModule("menu", Config.Menu)
Core.Fuel = LoadModule("fuel", Config.Fuel)
Core.Poly = LoadModule("poly", Config.Poly)
Core.TextUI = LoadModule("textui", Config.TextUI)
Core.Clothing = LoadModule("clothing", Config.Clothing)
Core.VehicleProperties = LoadModule("vehicleproperties", Config.VehicleProperties)
Core.EntitySync = EntitySync
Core.LoadLocales = loadLocales
Core.GetLocales = getLocales
Core.Locale = locale
Core.Print = Utils.Print

Core.LoadLocales()

local pendingCallbacks = {}
local cbEvent = 'peuren_lib:callback:%s'
local callbackTimeout = 600000

RegisterNetEvent('peuren_lib:callbackHandler', function(key, ...)
    if source == '' then return end

    local cb = pendingCallbacks[key]

    if not cb then return end

    pendingCallbacks[key] = nil

    cb(...)
end)

Core.Framework.Callbacks = {
    Trigger = function(event, ...)
        local key

        repeat
            key = ('%s:%s'):format(event, math.random(0, 100000))
        until not pendingCallbacks[key]

        TriggerServerEvent(cbEvent:format(event), key, ...)

        local cbPromise = promise.new()

        pendingCallbacks[key] = function(response, ...)
            response = { response, ... }

            if cbPromise then
                return cbPromise:resolve(response)
            end
        end

        if cbPromise then
            SetTimeout(callbackTimeout, function() cbPromise:reject(("callback %s timed out"):format(key)) end)

            return table.unpack(Citizen.Await(cbPromise))
        end
    end,
    TriggerAsync = function(name, cb, ...)
        local key

        repeat
            key = ('%s:%s'):format(event, math.random(0, 100000))
        until not pendingCallbacks[key]

        TriggerServerEvent(cbEvent:format(event), currentResource, key, ...)

        pendingCallbacks[key] = function(response, ...)
            response = { response, ... }

            if cb then
                cb(table.unpack(response))
            end
        end
    end
}

RegisterNetEvent("peuren_lib:notify", function(title, desc, type)
    Core.Notify(title, desc, type)
end)

exports("Core", function() return Core end)