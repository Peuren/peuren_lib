Poly = {
    Data = {},

    AddBoxZone = function(pos, height, width, heading, cb)
        local id = "peuren_lib:"..math.random(100, 999)

        if Poly.Data[id] then return Poly.AddBoxZone(pos, height, width, heading, cb) end

        Poly.Data[id] = lib.zones.box({
            coords = pos,
            size = vec3(height, width, height),
            rotation = heading,
            debug = Config.Debug,
            onEnter = function(self)
                cb(true, self)
            end,
            onExit = function(self)
                cb(false, self)
            end,
        })
        return id
    end, 

    AddCircularZone = function(pos, radius, cb)
        local id = "peuren_lib:"..math.random(100, 999)

        if Poly.Data[id] then return Poly.AddCircularZone(pos, radius, cb) end

        Poly.Data[id] = lib.zones.sphere({
            coords = pos,
            radius = radius,
            debug = Config.Debug,
            onEnter = function(self)
                cb(true, self)
            end,
            onExit = function(self)
                cb(false, self)
            end,
        })
        return id
    end,

    RemoveZone = function(id)
        if not id then return end 
        if not Poly.Data[id] then return end
        Poly.Data[id]:remove()
    end,
}

return Poly