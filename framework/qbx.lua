if not (Framework == 'qbx') then return end


RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    Frameworkstatus.stress = QBX.PlayerData.metadata.stress
    Frameworkstatus.hunger = QBX.PlayerData.metadata.hunger
    Frameworkstatus.thirst = QBX.PlayerData.metadata.thirst
    StreamMinimap()
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()

end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    if QBX.PlayerData then
        Frameworkstatus.stress = QBX.PlayerData.metadata.stress
        Frameworkstatus.hunger = QBX.PlayerData.metadata.hunger
        Frameworkstatus.thirst = QBX.PlayerData.metadata.thirst
        StreamMinimap()
    end
end)


RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst)
    Frameworkstatus.hunger = newHunger
    Frameworkstatus.thirst = newThirst
end)

RegisterNetEvent('hud:client:UpdateStress', function(newStress)
    Frameworkstatus.stress = newStress
end)
