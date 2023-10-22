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
}

return Inventory