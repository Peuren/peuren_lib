Inventory = {
    AddItem = function(source, item, amount, metadata) 
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.Functions.AddItem(item, amount, nil, metadata)
    end,
    RemoveItem = function(source, item, amount, metadata)
        local Player = QBCore.Functions.GetPlayer(source)
        local slot = nil
        if metadata then
            local items = Player.Functions.GetItemsByName(item)
            for k, v in pairs(items) do
                if Utils.CompareTables(v.info, metadata) then slot = v.slot end
            end
        end
        return Player.Functions.RemoveItem(item, amount, slot)
    end,
    GetItem = function(source, item, metadata)
        local Player = QBCore.Functions.GetPlayer(source)
        if not metadata then
            local item = Player.Functions.GetItemByName(item)
            if not item then return nil end
            return {
                item = itemData.name,
                count = itemData.amount,
                metadata = itemData.info,
            }
        else
            local items = Player.Functions.GetItemsByName(item)
            for k, v in pairs(items) do
                if Utils.CompareTables(v.info, metadata) then 
                    return {
                        item = v.name,
                        count = v.amount,
                        metadata = v.info
                    }
                end
            end
        end

        return nil
    end,
    GetItems = function(source)
        local items = QBCore.Functions.GetPlayer(source).PlayerData.items
        if not items then return {} end

        local formattedItems = {}
        for k, v in pairs(items) do
            formattedItems[#formattedItems+1] = {
                item = v.name,
                count = v.amount,
                metadata = v.info,
            }
        end
        return formattedItems
    end,
    HasPlayerItem = function(source, itemName, count)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player then return false end
        local item = Player.Functions.GetItemByName(itemName)
        if not item then return false end
        if not count and item then return true end
        return count <= item.amount
    end,
    RegisterUsableItem = function(item, callback)
        QBCore.Functions.CreateUseableItem(item, callback)
    end
}

return Inventory