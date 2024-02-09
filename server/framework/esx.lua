ESX = exports[Config.FrameworkResource]:getSharedObject()

Framework = {
    RegisterCallback = function(name, cb, ...)
        ESX.RegisterServerCallback(name, cb, ...)
    end,
    GetIdentifier = function(player)
        local xPlayer = ESX.GetPlayerFromId(player)
        if not xPlayer then return end
        return xPlayer.getIdentifier()
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

        for id,_ in pairs(ESX.GetPlayers()) do 
            local xPlayer = ESX.GetPlayerFromId(id)
            if not xPlayer then goto continue end

            for job in pairs(jobs) do 
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
            if account ~= "cash" and account ~= "bank" then
                return error("Wrong money account: cash or bank required.", 3)
            end

            if account == "cash" then account = "money" end

            local xPlayer = ESX.GetPlayerFromId(player)
            if not xPlayer then return end
            return xPlayer.addAccountMoney(account, amount)
        end,
        Get = function(player, account)
            if account ~= "cash" and account ~= "bank" then
                return error("Wrong money account: cash or bank required.", 3)
            end
            
            if account == "cash" then account = "money" end

            local xPlayer = ESX.GetPlayerFromId(player)
            if not xPlayer then return end
            return xPlayer.getAccount(account).balance
        end,
        Remove = function(player, amount, account)
            if account ~= "cash" and account ~= "bank" then
                return error("Wrong money account: cash or bank required.", 3)
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