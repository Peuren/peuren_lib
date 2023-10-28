Inventory = {
    AddItem = function(source, item, amount) 
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer.canCarryItem(item, amount) then return false end
        xPlayer.addInventoryItem(item, amount)
        return true
    end,
    RemoveItem = function(source, item, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(item).count < amount then return false end
        xPlayer.removeInventoryItem(item, amount)
        return true
    end,
    GetItem = function(source, item)
        local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.getInventoryItem(item)
    end
}

return Inventory