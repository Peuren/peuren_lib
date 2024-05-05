Inventory = {
    GetItemLabel = function(item)
        if not exports[Config.InventoryResource]:GetRegisteredItem(item) then return "NO_LABEL" end
        return exports[Config.InventoryResource]:GetRegisteredItem(item).label
    end,
    AddCarriableItem = CarryItems.AddCarriableItem,
    RemoveCarriableItem = CarryItems.RemoveCarriableItem
}

AddEventHandler('avp_inv:onItemAdded', function(item) 
    if not item then return end

    if item.quantity > 0 then
        CarryItems.ItemAdded(item.name)
    end

    CarryItems.UpdateAnimation()
end)

AddEventHandler('avp_inv:onItemRemoved', function(item) 
    if not item then return end
    CarryItems.ItemRemoved(item.name)
    CarryItems.UpdateAnimation()
end)

return Inventory