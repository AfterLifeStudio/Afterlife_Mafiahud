if not (Framework == 'ox') then return end

PlayerLoaded = false

RegisterNetEvent("ox:playerLoaded", function()
    Wait(1000)
    StreamMinimap()
end)

AddEventHandler('onResourceStart', function(resourceName)
    Wait(1000)
    if resourceName ~= GetCurrentResourceName() then return end
    StreamMinimap()
end)

AddEventHandler('ox:statusTick', function(values)
    Frameworkstatus.thirst = values.thirst
    Frameworkstatus.hunger = values.hunger
    Frameworkstatus.stress = values.stress
end)
