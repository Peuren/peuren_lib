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
    GetJobPlayerCount = function(jobs)
        local players = QBCore.Functions.GetPlayers()
        local count = 0

        for _, job in pairs(jobs) do 
            for id, _ in pairs(players) do
                local player = QBCore.Functions.GetPlayer(id)
                if player.PlayerData.job.name == job then
                    if player.PlayerData.job.onduty then
                        count += 1
                    end
                end
            end
        end 
        
        return count
    end,
    GetPlayers = function()
        return QBCore.Functions.GetPlayers()
    end,
    HasGroup = function(player, group)
        return QBCore.Functions.HasPermission(player, group)
    end,
    Money = {
        Give = function(player, amount, account)
            if account ~= "cash" and account ~= "bank" then
                return error("Wrong money account: cash or bank required.", 3)
            end

            local Player = QBCore.Functions.GetPlayer(player)
            if not Player then return end
            return Player.Functions.AddMoney(account, amount)
        end,
        Get = function(player, account)
            if account ~= "cash" and account ~= "bank" then
                return error("Wrong money account: cash or bank required.", 3)
            end

            local Player = QBCore.Functions.GetPlayer(player)
            if not Player then return end
            return Player.Functions.GetMoney(account)
        end,
        Remove = function(player, amount, account)
            if account ~= "cash" and account ~= "bank" then
                return error("Wrong money account: cash or bank required.", 3)
            end

            local Player = QBCore.Functions.GetPlayer(player)
            if not Player then return end
            return Player.Functions.RemoveMoney(account, amount)
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