Inventory = {
    GetItemLabel = function(item)
        if not QBCore.Shared.Items[item] then return "NO_LABEL" end
        return QBCore.Shared.Items[item].label
    end
}

return Inventory