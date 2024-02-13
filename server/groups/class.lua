Groups = {
    Data = {},

    ---Gets group data
    ---@param id string
    ---@return unknown
    Get = function(id)
        if not Groups.Data[id] then return end
        return Groups.Data[id]
    end,

    CreateGroupId = function()
        local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        local id = ""
    
        for i = 1, 6 do
            local index = math.random(1, #characters)
            id = id .. string.sub(characters, index, index)
        end

        if Groups.Data[id] then 
            return Groups.CreateGroupId() 
        end
    
        return id
    end,

    ---Creates a new group
    ---@param data table
    Create = function(data)
        local groupId = Groups.CreateGroupId()
        data.groupId = groupId
        data.resource = GetInvokingResource()
        Groups.Data[groupId] = data
        Groups.Data[groupId].args.groupId = groupId
        return groupId, data
    end,

    ---Add player to a group
    ---@param source number
    ---@param id string
    AddPlayer = function(source, id)
        local user = Core.Framework.GetIdentifier(source)

        if not Groups.Data[id] then return end

        Groups.Data[id].players[user] = { 
            name = Core.Framework.GetCharName(source),
            source = source,
            id = user 
        }
    end,

    ---Removes player from a group
    ---@param source number
    ---@param id string
    RemovePlayer = function(source, id)
        local user = Core.Framework.GetIdentifier(source)

        if not Groups.Data[id] then return end

        Groups.Data[id].players[user] = nil
    end,

    ---Checks if a player is not in a group already
    ---@param source number
    ---@param job string
    IsPlayerInAnyGroup = function(source, job)
        for _,v in pairs(Groups.Data) do 
            if v.job == job then 
                for id,_ in pairs(v.players) do 
                    if tonumber(id) == source then return true end
                end
            end
        end
        return false
    end,

    ---Sends a event to all group members
    ---@param id string 
    ---@param name string
    ---@param args table
    SendEvent = function(id, name, args)
        if not Groups.Data[id] then return end
        local users = Groups.Get(id).players

        for _, v in pairs(users) do 
            if args ~= nil then
                TriggerClientEvent(name, v.source, args, v.owner)
            else 
                TriggerClientEvent(name, v.source, v.owner)
            end
        end
    end,

    ---Creates new blip for all group members
    ---@param id string
    ---@param name string
    ---@param blip table
    CreateBlip = function(id, name, blip)
        if not Groups.Data[id] then return end
        local users = Groups.Get(id).players

        for _, v in pairs(users) do 
            TriggerClientEvent("peuren_lib:Groups:CreateBlip", v.source, name, blip)
        end
    end,

    ---Removes blip for all group members
    ---@param id string
    ---@param name string
    RemoveBlip = function(id, name)
        if not Groups.Data[id] then return end
        local users = Groups.Get(id).players

        for _, v in pairs(users) do 
            TriggerClientEvent("peuren_lib:Groups:RemoveBlip", v.source, name)
        end
    end
}

return Groups