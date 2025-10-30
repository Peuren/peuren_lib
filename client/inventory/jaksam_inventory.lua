Inventory = {
    GetItemLabel = function(item)
        if Config.Framework == 'esx' then 
            if not ItemLabels[item] then return "NO_LABEL" end
            return ItemLabels[item]
        elseif Config.Framework == 'qb' or Config.Framework == 'qbx' then
            if not QBCore.Shared.Items[item] then return "NO_LABEL" end
            return QBCore.Shared.Items[item].label
        end
    end,
    AddCarriableItem = CarryItems.AddCarriableItem,
    RemoveCarriableItem = CarryItems.RemoveCarriableItem,
    OpenStash = function(stashName, maxWeight, slots)
        exports[Config.InventoryResource]:openInventory(stashName)
    end
}

if Config.Framework == 'esx' then 
    RegisterNetEvent('esx:addInventoryItem', function(itemName, totalCount) 
        if totalCount > 0 then
            CarryItems.ItemAdded(itemName)
        else
            CarryItems.ItemRemoved(itemName)
        end

        CarryItems.UpdateAnimation()
    end)

    RegisterNetEvent('esx:removeInventoryItem', function(itemName, totalCount) 
        if totalCount > 0 then
            CarryItems.ItemAdded(itemName)
        else
            CarryItems.ItemRemoved(itemName)
        end

        CarryItems.UpdateAnimation()
    end)
elseif Config.Framework == 'qb' or Config.Framework == 'qbx' then
    RegisterNetEvent('QBCore:Player:SetPlayerData', function(PlayerData)
        local carriableItems = {}
        for k, v in pairs(PlayerData.items) do
            if CarryItems.Items[v.name] then
                carriableItems[v.name] = true
            end
        end
    
        for k, v in pairs(CarryItems.InInventory) do
            if not carriableItems[k] then
                CarryItems.ItemRemoved(k)
            end
        end
    
        for k, v in pairs(carriableItems) do
            if not CarryItems.InInventory[k] then
                CarryItems.ItemAdded(k)
            end
        end
    
        CarryItems.UpdateAnimation()
    end)
end

return Inventory