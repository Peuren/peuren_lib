Poly = {
    AddBoxZone = function(pos, height, width, heading, cb)
        local zone = BoxZone:Create(pos, height, width, {
            name = "peuren_lib:"..math.random(100, 999),
            heading = heading,
            debugPoly = Config.Debug,
            minZ = pos.z - height,
            maxZ = pos.z + height
        })

        zone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
            cb(isPointInside, point)
        end)

        return zone
    end, 

    AddCircularZone = function(pos, radius, cb)
        local zone = CircleZone:Create(pos, radius, {
            name = "peuren_lib:"..math.random(100, 999),
            debugPoly = Config.Debug,
            useZ = true
        })

        zone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
            cb(isPointInside, point)
        end)

        return zone
    end
}

return Poly