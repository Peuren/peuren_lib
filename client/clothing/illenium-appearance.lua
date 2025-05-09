Clothing = {
    Appearance = nil,

    Set = function(outfit)
        if not outfit then return end 

        local ped = PlayerPedId()

        if not Clothing.Appearance then
            Clothing.Appearance = exports[Config.ClothingResource]:getPedAppearance(ped)
        end

        Wait(100)

        local undershirt = {component_id = 8, texture = outfit.tshirt_2, drawable = outfit.tshirt_1}
        local arms = {component_id = 3, texture = 0, drawable = outfit.arms}
        local torso = {component_id = 11, texture = outfit.torso_2, drawable = outfit.torso_1}
        local pants = {component_id = 4, texture = outfit.pants_2, drawable = outfit.pants_1}
        local shoes = {component_id = 6, texture = outfit.shoes_2, drawable = outfit.shoes_1}
        local accesories = {component_id = 7, texture = outfit.chain_2, drawable = outfit.chain_1}
        local decals = {component_id = 10, texture = outfit.decals_2, drawable = outfit.decals_1}
        local props = {props = {{prop_id = 1, texture = outfit.glasses_2, drawable = outfit.glasses_1}, {prop_id = 2, texture = outfit.ears_2, drawable = outfit.ears_1}}}
        
        exports[Config.ClothingResource]:setPedComponents(ped, {torso, undershirt, pants, shoes, accesories, arms, decals, props})
    end,

    Reset = function()
        if Clothing.Appearance then
            exports[Config.ClothingResource]:setPedAppearance(PlayerPedId(), Clothing.Appearance)
            Clothing.Appearance = nil
        end
    end
}

return Clothing