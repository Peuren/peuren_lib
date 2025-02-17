Groups = {
    Data = {},
    
    Get = function(source, groupId)
        if not source then return end 

        local resource = GetInvokingResource()
        if not resource then return end

        local id = Framework.GetIdentifier(source)
        if not id then return end

        if not Groups.Data[resource] then
            Groups.Data[resource] = {}
        end

        if Groups.Data[resource][id] then
            return Groups.Data[resource][id]
        end

        for _, data in pairs(Groups.Data[resource]) do
            if data.groupId == groupId then return data end
        end

        return nil
    end,

    Update = function(source, groupId, data)
        if not source or not groupId then return end 

        local result = Groups.Get(source, groupId)
        if not result then return end

        local resource = GetInvokingResource()
        if not resource then return end

        Groups.Data[resource][result.owner] = data

        return data
    end,

    GetMember = function(source, groupId)
        if not source or not groupId then return end

        local data = Groups.Get(source, groupId)
        if not data then return end

        local id = Framework.GetIdentifier(source)
        if not id then return end

        return data.players[id]
    end,

    GetJobGroups = function()
        local resource = GetInvokingResource()
        if not resource then return end

        return Groups.Data[resource]
    end,

    Set = function(source, args)
        if not source then return end

        local resource = GetInvokingResource()
        if not resource then return end

        local data = Groups.Get(source, resource)
        if data then return end

        local id = Framework.GetIdentifier(source)
        if not id then return end

        local password = Groups.CreatePassword()
        local groupId = Groups.CreateGroupId()
        local pName = Framework.GetCharName(source)

        args.groupId = groupId

        Groups.Data[resource][id] = {
            groupId = groupId,
            pass = password,
            owner = id,
            args = args,
            started = false,
            players = {
                [source] = {
                    source = source,
                    id = id,
                    name = pName,
                    owner = true,
                    progress = 0
                }
            }
        }

        return Groups.Data[resource][id]
    end,

    Remove = function(source, groupId)
        if not source or not groupId then return end 

        local data = Groups.Get(source, groupId)
        if not data then return end

        local resource = GetInvokingResource()
        if not resource then return end
        
        Groups.SendEvent(source, groupId, resource..':group:Deleted')

        Groups.Data[resource][data.owner] = nil
        return true
    end,

    AddMember = function(source, groupId, password)
        if not source or not groupId then return end

        local data = Groups.Get(source, groupId)
        if not data then return end

        if password and tostring(password) ~= tostring(data.pass) then
            return 'wrong_pass'
        end

        local id = Framework.GetIdentifier(source)
        if not id then return end

        local resource = GetInvokingResource()
        if not resource then return end

        local pName = Framework.GetCharName(source)

        if #data.players >= Config.Groups.MemberLimit then 
            return 'full'
        end

        Groups.Data[resource][data.owner].players[source] = {
            soruce = source,
            id = id,
            name = pName
        }

        local resource = GetInvokingResource()
        if not resource then return end

        TriggerClientEvent(resource..':group:MemberAdded', source, {}, data.owner == id)
        return data
    end,

    RemoveMember = function(source, groupId)
        if not source or not groupId then return end

        local id = Framework.GetIdentifier(source)
        if not id then return end

        local data = Groups.Get(source, groupId)
        if not data then return end

        local resource = GetInvokingResource()
        if not resource then return end

        Groups.Data[resource][data.owner].players[source] = nil
        TriggerClientEvent(resource..':group:MemberRemoved', source, {}, data.owner == id)

        return data
    end,
    
    MemberDisconnected = function(source, groupId)
        if not source or not groupId then return end 

        local resource = GetInvokingResource()
        if not resource then return end

        local id = Framework.GetIdentifier(source)
        if not id then return end

        local timeout = os.time() + (0 * 60) + 20

        CreateThread(function()
            while timeout > os.time() do
                Wait(1000)
            end

            local isOnline = Framework.GetIdentifier(source)
            if isOnline then return end

            Groups.RemoveMember(source, groupId)

            local data = Groups.Data[job][id]
            if not data then return end
            
            local newOwner = data.players[math.random(1, #data.players)]

            if not newOwner then 
                Groups.Data[job][id] = nil
                return
            end

            data.owner = newOwner.id
            data.players[newOwner.source].owner = true

            Groups.SendEvent(source, groupId, 'peuren_lib:group:OwnerChanged', newOwner) 
        end)
    end,

    SendEvent = function(source, groupId, event, args)
        if not source or not groupId then return end

        local data = Groups.Get(source, groupId)
        if not data then return end

        for _, v in pairs(data.players) do
            TriggerClientEvent(event, v.source, args, v.owner)
            Wait(100)
        end

        return true
    end,

    IsPlayerInGroup = function(source)
        if not source then return end

        local resource = GetInvokingResource()
        if not resource then return end

        local data = Groups.Data[resource]
        if not data then return false end

        for _, v in pairs(data) do
            if v.players[source] then return true end
        end

        return false
    end,

    --Generates a random 6 letter password
    CreatePassword = function()
        local id = ""

        if Config.Groups.password.type == 'char' then 
            math.randomseed(os.time())
            local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
            for i = 1, Config.Groups.password.length do
                local index = math.random(1, #characters)
                id = id .. string.sub(characters, index, index)
            end
        else 
            math.randomseed(os.time())    

            for i = 1, Config.Groups.password.length do
                id = id .. tostring(math.random(0, 9))
            end
        end
    
        return id
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
}

return Groups