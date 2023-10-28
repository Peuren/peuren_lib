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
}

return Inventory