if not (Framework == 'standalone') then return end

AddEventHandler('onResourceStart', function(resourceName)
    Wait(1000)
    if resourceName ~= GetCurrentResourceName() then return end
    StreamMinimap()
end)
