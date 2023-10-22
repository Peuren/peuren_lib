QBCore = exports[Config.FrameworkResource]:GetCoreObject()

Framework = {
    RegisterCallback = function(name, cb, ...)
        QBCore.Functions.CreateCallback(name, cb, ...)
    end,
    GetIdentifier = function(player)
        local Player = QBCore.Functions.GetPlayer(player)
        if not Player then return end
        return Player.PlayerData.citizenid
    end,
    GetCharName = function(player)
        local Player = QBCore.Functions.GetPlayer(player)
        if not Player then return end
        return {
            first = Player.PlayerData.charinfo.firstname,
            last = Player.PlayerData.charinfo.lastname,
            full = ("%s %s"):format(Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname)
        }
    end,
    HasGroup = function(player, group)
        return QBCore.Functions.HasPermission(player, group)
    end,
    Money = {
        Give = function(player, amount, account)
            if account ~= "cash" or account ~= "bank" then
                return error("Wrong money account: cash or bank required.", 3)
            end

            local Player = QBCore.Functions.GetPlayer(player)
            if not Player then return end
            return Player.Functions.AddMoney(amount, account)
        end,
        Get = function(player, account)
            if account ~= "cash" or account ~= "bank" then
                return error("Wrong money account: cash or bank required.", 3)
            end

            local Player = QBCore.Functions.GetPlayer(player)
            if not Player then return end
            return Player.Functions.GetMoney(account)
        end,
        Remove = function(player, amount, account)
            if account ~= "cash" or account ~= "bank" then
                return error("Wrong money account: cash or bank required.", 3)
            end

            local Player = QBCore.Functions.GetPlayer(player)
            if not Player then return end
            return Player.Functions.RemoveMoney(amount, account)
        end,
    },
    Job = {
        Get = function(player)
            local Player = QBCore.Functions.GetPlayer(player)
            if not Player then return end
            return Player.PlayerData.job.name
        end,
        GetLabel = function(player)
            local Player = QBCore.Functions.GetPlayer(player)
            if not Player then return end
            return Player.PlayerData.job.label
        end,
        GetGrade = function(player)
            local Player = QBCore.Functions.GetPlayer(player)
            if not Player then return end
            return Player.PlayerData.job.grade.level
        end,
        GetGradeLabel = function(player)
            local Player = QBCore.Functions.GetPlayer(player)
            if not Player then return end
            return Player.PlayerData.job.grade.name
        end
    }
}

return Framework