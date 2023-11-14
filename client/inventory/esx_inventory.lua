Inventory = {
    GetItemLabel = function(item)
        if not ItemLabels[item] then return "NO_LABEL" end
        return ItemLabels[item]
    end
}

return Inventory