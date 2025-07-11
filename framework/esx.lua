print(Framework)
if not (Framework == 'esx') then return end

local ESX = exports['es_extended']:getSharedObject()


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    
    Wait(1000)

    StreamMinimap()

end)

AddEventHandler('onResourceStart', function(resourceName)
   
    Wait(1000)

    if resourceName ~= GetCurrentResourceName() then return end

    if ESX.IsPlayerLoaded() then
        StreamMinimap()
    end

end)


AddEventHandler('esx_status:onTick', function(data)
    for i = 1, #data do
        if data[i].name == 'thirst' then Frameworkstatus.thirst = math.floor(data[i].percent) end
        if data[i].name == 'hunger' then Frameworkstatus.hunger = math.floor(data[i].percent) end
        if data[i].name == 'stress' then Frameworkstatus.stress = math.floor(data[i].percent) end
    end
end)
