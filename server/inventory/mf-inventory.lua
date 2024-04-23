Inventory = {
    AddItem = function(source, item, amount, metadata) 
        local id = Framework.GetIdentifier(source)
        exports[Config.InventoryResource]:addInventoryItem(id, item, amount, source, 100)
    end,
    RemoveItem = function(source, item, amount, metadata)
        local id = Framework.GetIdentifier(source)
        exports[Config.InventoryResource]:removeInventoryItem(id, item, amount, source)
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
        local id = Framework.GetIdentifier(source)
        local items = exports[Config.InventoryResource]:getInventory(id).items
        if not items then return {} end

        local formattedItems = {}
        for k, v in pairs(items) do
            formattedItems[#formattedItems+1] = {
                item = v.name,
                count = v.count,
                metadata = v.info,
            }
        end
        return formattedItems
    end,
    HasPlayerItem = function(source, item, count)    
        local id = Framework.GetIdentifier(source) 
        return exports[Config.InventoryResource]:getInventoryItem(id, item, count)
    end,
    RegisterUsableItem = function(item, callback)
        ESX.RegisterUsableItem(item, callback)
    end
}

Core.Framework.RegisterCallback("peuren_lib:GetPlayerInventory", function(player, cb)
    cb(Inventory.GetItems(player))
end)

return Inventory