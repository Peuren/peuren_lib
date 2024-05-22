function TransformOnSelect(callback)
    return function(data)
        callback(data?.entity)
    end
end

Target = {
    AddEntity = function(entities, options, distance)
        if type(entities) == 'table' then
            for k,v in pairs(entities) do 
                if not DoesEntityExist(v) then
                    entities[k] = NetworkGetEntityFromNetworkId(v)
                end
            end
        else 
            if not DoesEntityExist(entities) then 
                entities = NetworkGetEntityFromNetworkId(entities)
            end
        end

        local tOptions = {}
        for k, v in pairs(options) do
            tOptions[#tOptions + 1] = {
                name = v.name,
                icon = v.icon,
                label = v.label,
                items = v.item,
                canInteract = v.canInteract,
                onSelect = TransformOnSelect(v.onSelect),
                distance = distance,
                groups = v.jobs,
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
                items = v.item,
                canInteract = v.canInteract,
                onSelect = TransformOnSelect(v.onSelect),
                bones = v.bones,
                distance = distance,
                groups = v.jobs,
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
                items = v.item,
                canInteract = v.canInteract,
                onSelect = TransformOnSelect(v.onSelect),
                distance = distance,
                groups = v.jobs,
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
                items = v.item,
                canInteract = v.canInteract,
                onSelect = TransformOnSelect(v.onSelect),
                distance = distance,
                groups = v.jobs,
            }
        end

        return exports[Config.TargetResource]:addBoxZone({
            name = boxData.name,
            coords = vector3(boxData.coords.x, boxData.coords.y, boxData.coords.z + boxData.size.z / 2),
            size = vector3(boxData.size.y, boxData.size.x, boxData.size.z),
            rotation = boxData.heading,
            options = tOptions,
            debug = Config.Debug,
            resource = GetInvokingResource(),
            drawSprite = Config.Debug
        })
    end,
    RemoveZone = function(data)
        exports[Config.TargetResource]:removeZone(data)
    end,
    RemoveEntityZone = function(entities, names)
        if type(entities) == 'table' then
            for k,v in pairs(entities) do 
                if not DoesEntityExist(v) then
                    entities[k] = NetworkGetEntityFromNetworkId(v)
                end
            end
        else 
            if not DoesEntityExist(entities) then 
                entities = NetworkGetEntityFromNetworkId(entities)
            end
        end        
        exports[Config.TargetResource]:removeLocalEntity(entities, names)
    end,
    RemoveBone = function(bones, names)
        exports[Config.TargetResource]:removeGlobalVehicle(bones)
    end
}

return Target