Inventory = {
    AddItem = function(source, item, amount) 
        exports[Config.InventoryResource]:AddItem(source, item, amount)
    end,
    RemoveItem = function(source, item, amount)
        exports[Config.InventoryResource]:RemoveItem(source, item, amount)
    end,
    GetItem = function(source, item)
        local amount = exports[Config.InventoryResource]:GetItemTotalAmount(source, item)
        return { count = amount }
    end,
    HasPlayerItem = function(source, item, count)
        return count <= exports[Config.InventoryResource]:GetItemTotalAmount(source, item)
    end
}

return Inventory