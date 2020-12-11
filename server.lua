--================================--
--          GASMASK v2.5          --
--          by JellyJam           --
--      License: GNU GPL 3.0      --
--================================--

RegisterServerEvent("Gasmask:getIsAllowed")
AddEventHandler("Gasmask:getIsAllowed", function()
    if IsPlayerAceAllowed(source, "perms.gasmask") then
        TriggerClientEvent("Gasmask:returnIsAllowed", source, true)
    else
        TriggerClientEvent("Gasmask:returnIsAllowed", source, false)
    end
end)
