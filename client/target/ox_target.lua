function TransformOnSelect(callback)
    return function(data)
        callback(data?.entity)
    end
end

Target = {
    AddEntity = function(entities, options, distance)
        local tOptions = {}
        for k, v in pairs(options) do
            tOptions[#tOptions + 1] = {
                name = v.name,
                icon = v.icon,
                label = v.label,
                canInteract = v.canInteract,
                onSelect = TransformOnSelect(v.onSelect),
                distance = distance
            }
        end
        return exports[Config.TargetResource]:addLocalEntity(entities, tOptions)
    end,
    AddBone = function(bones, options, distance)
        local tOptions = {}
        for k, v in pairs(options) do
            tOptions[#tOptions + 1] = {
                name = v.name,
                icon = v.icon,
                label = v.label,
                canInteract = v.canInteract,
                onSelect = TransformOnSelect(v.onSelect),
                bones = bones,
                distance = distance
            }
        end
        return exports[Config.TargetResource]:addGlobalVehicle(tOptions)
    end,
    AddModel = function(models, options, distance)
        local tOptions = {}
        for k, v in pairs(options) do
            tOptions[#tOptions + 1] = {
                name = v.name,
                icon = v.icon,
                label = v.label,
                canInteract = v.canInteract,
                onSelect = TransformOnSelect(v.onSelect),
                distance = distance
            }
        end
        return exports[Config.TargetResource]:addModel(models, tOptions)
    end,
    AddBoxZone = function(boxData, options, distance)
        local tOptions = {}
        for k, v in pairs(options) do
            tOptions[#tOptions + 1] = {
                name = v.name,
                icon = v.icon,
                label = v.label,
                canInteract = v.canInteract,
                onSelect = TransformOnSelect(v.onSelect),
                distance = distance
            }
        end
        return exports[Config.TargetResource]:addBoxZone({
            name = boxData.name,
            coords = boxData.coords,
            size = boxData.size,
            rotation = boxData.heading,
            options = tOptions,
            debug = Config.Debug,
            resource = GetInvokingResource(),
            drawSprite = Config.Debug
        })
    end,
    RemoveZone = function(data)
        exports[Config.TargetResource]:removeZone(DatafileDelete)
    end,
    RemoveEntityZone = function(entities, names)
        exports[Config.TargetResource]:removeLocalEntity(entities, names)
    end
}

return Target