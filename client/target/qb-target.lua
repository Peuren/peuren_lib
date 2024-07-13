Target = {
    FormatJobs = function(jobs)
        local data = {}
        if not jobs then return end
        for _,job in pairs(jobs) do 
            data[job] = 0
        end
        return data
    end,
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
                icon = v.icon,
                label = v.label,
                item = v.item,
                canInteract = v.canInteract,
                action = v.onSelect,
                job = Target.FormatJobs(v.jobs),
            }
        end
        return exports[Config.TargetResource]:AddTargetEntity(entities, {
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
                item = v.item,
                canInteract = v.canInteract,
                action = v.onSelect,
                job = Target.FormatJobs(v.jobs),
            }
        end
        return exports[Config.TargetResource]:AddTargetBone(bones, {
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
                item = v.item,
                canInteract = v.canInteract,
                action = v.onSelect,
                job = Target.FormatJobs(v.jobs),
            }
        end
        return exports[Config.TargetResource]:AddTargetModel(models, {
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
                item = v.item,
                canInteract = v.canInteract,
                action = v.onSelect,
                job = Target.FormatJobs(v.jobs),
            }
        end
        return exports[Config.TargetResource]:AddBoxZone(boxData.name, boxData.coords, boxData.size.x, boxData.size.y, {
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
    AddPlayer = function(options, distance)
        local tOptions = {}
        for k, v in pairs(options) do
            tOptions[#tOptions + 1] = {
                icon = v.icon,
                label = v.label,
                item = v.item,
                canInteract = v.canInteract,
                action = v.onSelect,
                job = Target.FormatJobs(v.jobs),
            }
        end

        return exports[Config.TargetResource]:AddGlobalPlayer({
            options = tOptions,
            distance = distance
        })
    end,
    AddVehicle = function(options, distance)
        local tOptions = {}
        for k, v in pairs(options) do
            tOptions[#tOptions + 1] = {
                icon = v.icon,
                label = v.label,
                item = v.item,
                canInteract = v.canInteract,
                action = v.onSelect,
                job = Target.FormatJobs(v.jobs),
            }
        end

        return exports[Config.TargetResource]:AddGlobalVehicle({
            options = tOptions,
            distance = distance
        })
    end,
    RemoveZone = function(data)
        exports[Config.TargetResource]:RemoveZone(data.name)
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
        
        exports[Config.TargetResource]:RemoveTargetEntity(entities, names)
    end,
    RemoveBone = function(bones, names)
        exports[Config.TargetResource]:RemoveTargetBone(bones, names)
    end,
    RemovePlayer = function(names) 
        exports[Config.TargetResource]:RemoveGlobalPlayer(names)
    end,
    RemoveVehicle = function(names)
        exports[Config.TargetResource]:RemoveGlobalVehicle(names)
    end
}

return Target