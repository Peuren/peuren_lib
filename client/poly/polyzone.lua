Poly = {
    Data = {},

    AddBoxZone = function(pos, height, width, heading, cb)
        local id = "peuren_lib:"..math.random(100, 999)

        if Poly.Data[id] then return Poly.AddBoxZone(pos, height, width, heading, cb) end
        
        Poly.Data[id] = BoxZone:Create(pos, height, width, {
            name = id,
            heading = heading,
            debugPoly = Config.Debug,
            minZ = pos.z - height,
            maxZ = pos.z + height
        })

        Poly.Data[id]:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
            cb(isPointInside, point)
        end)

        return id
    end, 

    AddCircularZone = function(pos, radius, cb)
        local id = "peuren_lib:"..math.random(100, 999)

        if Poly.Data[id] then return Poly.AddCircularZone(pos, radius, cb) end

        Poly.Data[id] = CircleZone:Create(pos, radius, {
            name = id,
            debugPoly = Config.Debug,
            useZ = true
        })

        Poly.Data[id]:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
            cb(isPointInside, point)
        end)

        return id
    end,

    RemoveZone = function(id)
        if not id then return end 
        if not Poly.Data[id] then return end 
        Poly.Data[id]:destroy()
    end,
}

return Poly