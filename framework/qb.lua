if not (Framework == 'qb') then return end

local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    local playerdata = QBCore.Functions.GetPlayerData()

    Frameworkstatus.stress = playerdata.metadata.stress
    Frameworkstatus.hunger = playerdata.metadata.hunger
    Frameworkstatus.thirst = playerdata.metadata.thirst

    StreamMinimap()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    local playerdata = QBCore.Functions.GetPlayerData()
    if playerdata then
        StreamMinimap()
        Frameworkstatus.stress = playerdata.metadata.stress
        Frameworkstatus.hunger = playerdata.metadata.hunger
        Frameworkstatus.thirst = playerdata.metadata.thirst
    end
end)


RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst)
    Frameworkstatus.hunger = newHunger
    Frameworkstatus.thirst = newThirst
end)

RegisterNetEvent('hud:client:UpdateStress', function(newStress)
    Frameworkstatus.stress = newStress
end)
