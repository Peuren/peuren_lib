Fuel = {
    GetFuel = function(veh, plate)
        if not veh or not plate then return 0 end
        return math.ceil((100 / GetVehicleHandlingFloat(veh, 'CHandlingData', 'fPetrolTankVolume')) * math.ceil(GetVehicleFuelLevel(veh)))       
    end,

    SetFuel = function(veh, plate, level)
        SetVehicleFuelLevel(veh, level + 0.0)
    end
}

return Fuel