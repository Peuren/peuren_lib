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
        return {
            first = string.split(xPlayer.getName(), " ")[1],
            last = string.split(xPlayer.getName(), " ")[2],
            full = xPlayer.getName()
        }
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
            return xPlayer.addAccountMoney(account, money)
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
            if xPlayer.getAccount(account).balance < amount then return false end

            xPlayer.removeAccountMoney(account, money)
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
    },
    GetItemLabel = function(item)
        if not QBCore.Shared.Items[item] then return "NO_LABEL" end
        return QBCore.Shared.Items[item].label
    end
}

return Framework