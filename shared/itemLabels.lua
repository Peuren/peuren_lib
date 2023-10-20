ItemLabels = {
    ["itemname"] = "itemlabel"
}

function GetItemLabel(itemName)
    local itemlabel = ItemLabels[itemName]
    if not itemLabel then
        return itemname
    end

    return itemLabel
end