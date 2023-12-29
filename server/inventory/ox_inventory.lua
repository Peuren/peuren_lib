Inventory = {
    AddItem = function(source, item, amount, metadata) 
        exports[Config.InventoryResource]:AddItem(source, item, amount, metadata)
    end,
    RemoveItem = function(source, item, amount, metadata)
        exports[Config.InventoryResource]:RemoveItem(source, item, amount, metadata)
    end,
    GetItem = function(source, item, metadata)
        local itemData = exports[Config.InventoryResource]:GetItem(source, item, metadata)
        if not itemData then return nil end
        return {
            item = itemData.name,
            count = itemData.count,
            metadata = itemData.metadata,
        }
    end,
    GetItems = function(source)
        local items = exports[Config.InventoryResource]:GetInventoryItems(source)
        if not items then return {} end

        local formattedItems = {}
        for k, v in pairs(items) do
            formattedItems[#formattedItems+1] = {
                item = v.name,
                count = v.count,
                metadata = v.metadata,
            }
        end
        return formattedItems
    end,
    HasPlayerItem = function(source, item, count)
        return count <= exports[Config.InventoryResource]:GetItem(source, item).count
    end,
    RegisterUsableItem = function(item, callback)
        if Config.Framework == "qb" then
            QBCore.Functions.CreateUseableItem(item, callback)
        elseif Config.Framework == "esx" then
            ESX.RegisterUsableItem(item, callback)
        end
    end
}

return Inventory