Target = {
    AddEntity = function(entities, options, distance)
        local tOptions = {}
        for k, v in pairs(options) do
            tOptions[#tOptions + 1] = {
                icon = v.icon,
                label = v.label,
                canInteract = v.canInteract,
                action = v.onSelect
            }
        end
        exports["qb-target"]:AddTargetEntity(entities, {
            options = tOptions,
            distance = distance
        })
    end,
    AddBone = function(bones, options, distance)
        local tOptions = {}
        for k, v in pairs(options) do
            tOptions[#tOptions + 1] = {
                icon = v.icon,
                label = v.label,
                canInteract = v.canInteract,
                action = v.onSelect
            }
        end
        exports["qb-target"]:AddTargetBone(bones, {
            options = tOptions,
            distance = distance
        })
    end,
    AddModel = function(models, options, distance)
        local tOptions = {}
        for k, v in pairs(options) do
            tOptions[#tOptions + 1] = {
                icon = v.icon,
                label = v.label,
                canInteract = v.canInteract,
                action = v.onSelect
            }
        end
        exports['qb-target']:AddTargetModel(models, {
            options = tOptions,
            distance = distance
        })
    end,
    AddBoxZone = function(boxData, options, distance)
        local tOptions = {}
        for k, v in pairs(options) do
            tOptions[#tOptions + 1] = {
                icon = v.icon,
                label = v.label,
                canInteract = v.canInteract,
                action = v.onSelect
            }
        end
        exports['qb-target']:AddBoxZone(boxData.name, boxData.coords, boxData.size.x, boxData.size.y, {
            resource = GetInvokingResource(),
            name = boxData.name,
            heading = boxData.heading,
            debugPoly = Config.Debug,
            minZ = boxData.coords.z,
            maxZ = boxData.coords.z + boxData.size.z
        }, {
            options = tOptions,
            distance = distance
        })
    end,
    RemoveZone = function(id)
        exports['qb-target']:RemoveZone(id)
    end,
    RemoveEntityZone = function(entities, names)
        exports['qb-target']:RemoveTargetEntity(entities, names)
    end
}

return Target