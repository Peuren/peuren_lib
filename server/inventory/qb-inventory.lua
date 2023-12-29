Inventory = {
    AddItem = function(source, item, amount) 
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.Functions.AddItem(item, amount)
    end,
    RemoveItem = function(source, item, amount)
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.Functions.RemoveItem(item, amount)
    end,
    GetItem = function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.Functions.GetItemByName(item)
    end,
    HasPlayerItem = function(source, itemName, count)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player then return false end
        local item = Player.Functions.GetItemByName(itemName)
        if not item then return false end
        if not count and item then return true end
        return count <= item.amount
    end,
    RegisterUsableItem = function(item, callback)
        QBCore.Functions.CreateUseableItem(item, callback)
    end
}

return Inventory