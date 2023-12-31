Inventory = {
    AddItem = function(source, item, amount, metadata) 
        exports[Config.InventoryResource]:AddItem(source, item, amount, nil, metadata)
    end,
    RemoveItem = function(source, item, amount, metadata)
        exports[Config.InventoryResource]:RemoveItem(source, item, amount, nil, metadata)
    end,
    GetItem = function(source, item)
        local amount = exports[Config.InventoryResource]:GetItemTotalAmount(source, item)
        return {
            item = item,
            count = amount,
            metadata = nil,
        }
    end,
    GetItems = function(source)
        local items = exports[Config.InventoryResource]:GetInventory(source)
        if not items then return {} end

        local formattedItems = {}
        for k, v in pairs(items) do
            formattedItems[#formattedItems+1] = {
                item = v.name,
                count = v.amount,
                metadata = v.info,
            }
        end
        return formattedItems
    end,
    HasPlayerItem = function(source, item, count)
        local xPlayer = ESX.GetPlayerFromId(source)
        return count <= xPlayer.getInventoryItem(item).count
    end,
    RegisterUsableItem = function(item, callback)
        exports[Config.InventoryResource]:CreateUsableItem(item, callback)
    end
}

return Inventory