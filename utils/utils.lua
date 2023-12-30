Utils = {
    CompareTables = function(first, second)
        for k, v in pairs(first) do
            if not second[k] then return false end
            if type(v) == "table"  then
                if not Utils.CompareTables(v, second[k]) then return false end
            else
                if second[k] ~= v then
                    return false
                end
            end
        end
        
        return true
    end
}