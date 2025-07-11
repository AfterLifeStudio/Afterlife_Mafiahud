
local Active = false
local voicemode = 1

---@class Frameworkstatus
Frameworkstatus = {
    hunger = 0,
    thirst = 0,
    stress = 0
}

CreateThread(function()
    while true do
        local PauseMenuActive = IsPauseMenuActive()
        if PauseMenuActive and not Active then
            Active = true
            NuiMessage('visible', false)
        elseif Active and not PauseMenuActive then
            Active = false
            NuiMessage('visible', true)
        end

        local health = GetEntityHealth(cache.ped)
        local armour = GetPedArmour(cache.ped)
        local oxygen

        if not IsEntityInWater(cache.ped) then
            oxygen = 100 - GetPlayerSprintStaminaRemaining(cache.playerId)
        end
        -- Oxygen
        if IsEntityInWater(cache.ped) then
            oxygen = GetPlayerUnderwaterTimeRemaining(cache.playerId) * 10
        end

        local voice = NetworkIsPlayerTalking(cache.playerId)

        if cache.vehicle then
            DisplayRadar(true)
        else
            DisplayRadar(false)
        end
        local data = {
            show = cache.vehicle and true or false,
            health = health - 100,
            armour = armour,
            oxygen = oxygen,
            hunger = Frameworkstatus.hunger,
            thirst = Frameworkstatus.thirst,
            stress = Frameworkstatus.stress,
            voice = voice,
            voicemode = voicemode
        }

        NuiMessage('player', data)

        Wait(800)
    end
end)




AddEventHandler('pma-voice:setTalkingMode', function(mode)
   voicemode = mode
end)


CreateThread(function()
    SetHudComponentSize(6, 0, 0)
    SetHudComponentSize(7, 0, 0)
    SetHudComponentSize(8, 0, 0)
    SetHudComponentSize(9, 0, 0)
end)
