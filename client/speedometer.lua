local vehicle,seatbelt = false,false

local GetEntitySpeed = GetEntitySpeed
local GetVehicleFuelLevel = GetVehicleFuelLevel
local GetVehicleClass = GetVehicleClass
local SetFlyThroughWindscreenParams = SetFlyThroughWindscreenParams

CreateThread(function()
    while true do
        local sleep = 100
        if cache.vehicle then
            local speed = math.ceil(GetEntitySpeed(cache.vehicle) * 2.2)
            local fuel = math.ceil(GetVehicleFuelLevel(cache.vehicle))
            local data = {
                show = true,
                speed = speed,
                fuel = fuel,
                distance = 0
            }
            NuiMessage('speedometer', data)
        else
            NuiMessage('speedometer', { show = false })
        end

        Wait(sleep)
    end
end)

---@return boolean
local VehicleTypeCheck = function()
    local class = GetVehicleClass(cache.vehicle)
    if class == (8 and 13 and 14) then
        return false
    end
    return true
end


local ToggleSeatbelt = function()
    if vehicle then
        if VehicleTypeCheck(cache.vehicle) then
            seatbelt = not seatbelt
            if seatbelt then
                SetFlyThroughWindscreenParams(1000.0, 1000.0, 0.0, 0.0)
            else
                SetFlyThroughWindscreenParams(15.0, 20.0, 17.0, -500.0)
            end
        end
    end
end



lib.addKeybind({
    name = 'seatbelt',
    description = 'Toggle vehicle seatbelt',
    defaultKey = 'b',
    onPressed = function(self)
        ToggleSeatbelt()
    end,
})


