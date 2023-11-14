Inventory = {
    GetItemLabel = function(item)
        if not exports[Config.InventoryResource]:Items(item) then return "NO_LABEL" end
        return exports[Config.InventoryResource]:Items(item).label
    end
}

return Inventory