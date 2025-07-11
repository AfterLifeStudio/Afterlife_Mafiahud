

RegisterCommand("revive", function(source, args, rawCommand)
    TriggerClientEvent('ResourceName:Revive', args[1] and args[1] or source)
end)


RegisterCommand("reviveall", function ()
    TriggerClientEvent('ResourceName:Revive', -1)
end)