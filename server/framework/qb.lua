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
    GetIdentifierID = function(identifier)
        local Player = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if not Player then return false end
        return Player.PlayerData.source
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
        local count = 0

        for id, _ in pairs(QBCore.Functions.GetPlayers()) do 
            local player = QBCore.Functions.GetPlayer(id)
            if not player then goto continue end

            local hasJob = false

            for _, job in pairs(jobs) do
                if player.PlayerData.job.type == job or player.PlayerData.job.name == job then 
                    hasJob = true
                end
            end

            if hasJob then count += 1 end
            :: continue ::
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