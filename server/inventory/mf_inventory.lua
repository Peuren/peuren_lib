Inventory = {
    AddItem = function(source, item, amount) 

    end,
    RemoveItem = function(source, item, amount)

    end,
    GetItem = function(source, item)

    end,
    HasPlayerItem = function(source, item, count)
        local xPlayer = ESX.GetPlayerFromId(source)
        return count <= xPlayer.getInventoryItem(item).count
    end
}

return Inventory