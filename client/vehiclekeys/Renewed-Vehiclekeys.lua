CarKeys = {
    Give = function(veh, plate)
        exports[Config.VehicleKeysResource]:addKey(plate)
    end
}

RegisterNetEvent('peuren_lib:RemoveVehKeys', function(veh, plate)
    exports[Config.VehicleKeysResource]:RemoveKeys(veh)
    exports[Config.VehicleKeysResource]:removeKey(plate)
end)

return CarKeys