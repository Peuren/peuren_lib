Inventory = {
    GetItemLabel = function(item)
        local items = exports[Config.InventoryResource]:GetItemList()
        for k,v in pairs(items) do 
            if k == item or v.name == item then return v.label end
        end
        return "NO_LABEL"
    end,
    AddCarriableItem = function() print("CARRAIBLE ITEMS FOR CODEM-INVENTORY ARE NOT SUPPORTED AT THE MOMENT") end,
    RemoveCarriableItem = function() print("CARRAIBLE ITEMS FOR CODEM-INVENTORY ARE NOT SUPPORTED AT THE MOMENT") end,
}

return Inventory