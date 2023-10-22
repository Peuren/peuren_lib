Inventory = {
    AddItem = function(source, item, amount) 
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem(item, amount)
    end,
    RemoveItem = function(source, item, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem(item, amount)
    end,
    GetItem = function(source, item)
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.getInventoryItem(item)
    end
}

return Inventory