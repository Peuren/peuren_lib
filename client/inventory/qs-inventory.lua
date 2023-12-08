Inventory = {
    GetItemLabel = function(item)
        local items = exports[Config.InventoryResource]:GetItemList()
        for k,v in pairs(items) do 
            if k == item then return v.label end
        end
        return "NO_LABEL"
    end
}

return Inventory