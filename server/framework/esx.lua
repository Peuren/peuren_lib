ESX = nil

if Config.IsOldESX then 
    TriggerEvent('esx:getSharedObject', function(obj) 
        ESX = obj 
    end)
else 
    ESX = exports[Config.FrameworkResource]:getSharedObject()
end

Framework = {
    RegisterCallback = function(name, cb, ...)
        ESX.RegisterServerCallback(name, cb, ...)
    end,
    GetIdentifier = function(player)
        local xPlayer = ESX.GetPlayerFromId(player)
        if not xPlayer then return end
        return xPlayer.getIdentifier()
    end,
    GetIdentifierID = function(identifier)
        local player = ESX.GetPlayerFromIdentifier(identifier)
        if not player then return false end
        return player.playerId
    end,
    GetCharName = function(player)
        local xPlayer = ESX.GetPlayerFromId(player)
        if not xPlayer then return end
        local firstname, lastname = string.match(xPlayer.getName(), "([^%s]+) ([^%s]+)")
        return {
            first = firstname,
            last = lastname,
            full = xPlayer.getName()
        }
    end,
    GetJobPlayerCount = function(jobs)
        local count = 0

        for id, _ in pairs(ESX.GetPlayers()) do 
            local xPlayer = ESX.GetPlayerFromId(id)
            if not xPlayer then goto continue end

            for _, job in pairs(jobs) do 
                if xPlayer.getJob().name == job then 
                    count += 1
                end
            end
            :: continue ::
        end
        return count
    end,
    GetPlayers = function()
        return ESX.GetPlayers()
    end,
    HasGroup = function(player, group)
        local xPlayer = ESX.GetPlayerFromId(player)
        if not xPlayer then return end
        return xPlayer.getGroup() == group
    end,
    Money = {
        Give = function(player, amount, account)
            if account ~= "cash" and account ~= "bank" and account ~= "black_money" then
                return error("Wrong money account: cash, bank, or black_money required.", 3)
            end

            if account == "cash" then account = "money" end

            local xPlayer = ESX.GetPlayerFromId(player)
            if not xPlayer then return end
            return xPlayer.addAccountMoney(account, amount)
        end,
        Get = function(player, account)
            if account ~= "cash" and account ~= "bank" and account ~= "black_money" then
                return error("Wrong money account: cash, bank, or black_money required.", 3)
            end
            
            if account == "cash" then account = "money" end

            local xPlayer = ESX.GetPlayerFromId(player)
            if not xPlayer then return end
            return xPlayer.getAccount(account).money
        end,
        Remove = function(player, amount, account)
            if account ~= "cash" and account ~= "bank" and account ~= "black_money" then
                return error("Wrong money account: cash, bank, black_money required.", 3)
            end

            if account == "cash" then account = "money" end

            local xPlayer = ESX.GetPlayerFromId(player)
            if not xPlayer then return end
            if xPlayer.getAccount(account).money < amount then return false end

            xPlayer.removeAccountMoney(account, amount)
            return true
        end,
    },
    Job = {
        Get = function(player)
            local xPlayer = ESX.GetPlayerFromId(player)
            if not xPlayer then return end
            return xPlayer.getJob().name
        end,
        GetLabel = function(player)
            local xPlayer = ESX.GetPlayerFromId(player)
            if not xPlayer then return end
            return xPlayer.getJob().label
        end,
        GetGrade = function(player)
            local xPlayer = ESX.GetPlayerFromId(player)
            if not xPlayer then return end
            return xPlayer.getJob().grade
        end,
        GetGradeLabel = function(player)
            local xPlayer = ESX.GetPlayerFromId(player)
            if not xPlayer then return end
            return xPlayer.getJob().grade_label
        end
    }
}

return Framework