Inventory = {
    AddItem = function(source, item, amount) 
        exports[Config.InventoryResource]:AddItem(source, item, amount)
    end,
    RemoveItem = function(source, item, amount)
        exports[Config.InventoryResource]:RemoveItem(source, item, amount)
    end,
    GetItem = function(source, item)
        return exports[Config.InventoryResource]:GetItem(source, item)
    end,
    HasPlayerItem = function(source, item, count)
        return count <= exports[Config.InventoryResource]:GetItem(source, item).count
    end
}

return Inventory