Poly = {
    AddBoxZone = function(pos, height, width, heading, cb)
        local zone = lib.zones.box({
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
        return zone
    end, 

    AddCircularZone = function(pos, radius, cb)
        local zone = lib.zones.sphere({
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
        return zone
    end
}

return Poly