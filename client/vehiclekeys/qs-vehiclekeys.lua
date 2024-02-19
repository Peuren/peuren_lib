CarKeys = {
    Give = function(veh, plate)
        local model = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
        exports[Config.VehicleKeysResource]:GiveKeys(plate, model, true)
    end
}

return CarKeys