local dir = "server/%s/%s.lua"
local resource = "peuren_lib"

function LoadModule(module, selection)
    local chunk = LoadResourceFile(resource, dir:format(module, string.lower(selection)))
    if not chunk then
        return error(("Couldn't load module file: %s - %s"):format(module, string.lower(selection)), 3)
    end

    local fn, err = load(chunk, ("@@peuren_lib/server/%s/%s.lua"):format(module, string.lower(selection)))

    if not fn and err then
        return error(("Error loading module: %s - %s"):format(module, string.lower(selection)), 3)
    end

    return fn()
end

Core = {}
Core.Framework = LoadModule("framework", Config.Framework)
Core.Database = LoadModule("database", Config.SQLConnector)
Core.GetItemLabel = GetItemLabel

exports("Core", function() return Core end)