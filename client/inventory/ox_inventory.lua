Inventory = {
    GetItemLabel = function(item)
        if not exports[Config.InventoryResource]:Items(item) then return "NO_LABEL" end
        return exports[Config.InventoryResource]:Items(item).label
    end,
    AddCarriableItem = CarryItems.AddCarriableItem,
    RemoveCarriableItem = CarryItems.RemoveCarriableItem,
    OpenStash = function(stashName, maxWeight, slots)
        local response = Core.Framework.Callbacks.Trigger("peuren_lib:inventory:RegisterStash", {
            stashName = stashName,
            slots = slots,
            weight = maxWeight,
        })

        exports.ox_inventory:openInventory('stash', {id = stashName})
    end
}

AddEventHandler('ox_inventory:itemCount', function(itemName, totalCount) 
    if totalCount > 0 then
        CarryItems.ItemAdded(itemName)
    else
        CarryItems.ItemRemoved(itemName)
    end

    CarryItems.UpdateAnimation()
end)



return Inventory