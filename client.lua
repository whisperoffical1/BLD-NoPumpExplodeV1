CreateThread(function()
    while true do
        Wait(1000) -- Reduced resource usage
        local pumps = GetGamePool("CObject")

        for _, pump in pairs(pumps) do
            local model = GetEntityModel(pump)

            -- List of gas pump models
            if model == `prop_gas_pump_1a` or model == `prop_gas_pump_1b` or model == `prop_gas_pump_1c` or model == `prop_gas_pump_2a` then
                SetEntityInvincible(pump, true) -- Make the pump indestructible
                SetEntityProofs(pump, true, true, true, true, true, true, true, true) -- Fully explosion/fire/bullet proof
                FreezeEntityPosition(pump, true) -- Prevents movement
            end
        end
    end
end)

-- Block explosion damage on pumps
AddEventHandler("explosionEvent", function(sender, ev)
    for _, pumpModel in pairs({`prop_gas_pump_1a`, `prop_gas_pump_1b`, `prop_gas_pump_1c`, `prop_gas_pump_2a`}) do
        local nearbyPump = GetClosestObjectOfType(ev.posX, ev.posY, ev.posZ, 10.0, pumpModel, false, false, false)

        if nearbyPump ~= 0 then
            CancelEvent() -- Prevent the explosion
            return
        end
    end
end)

print "Script Started | This is the V1 Version, Recommended to switch to the V2 Version."
