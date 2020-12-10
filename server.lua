--================================--
--          GASMASK v2.0          --
--          by JellyJam           --
--      License: GNU GPL 3.0      --
--================================--

AddEventHandler('playerDropped', function (reason) 
  -- Clear their lists 
  local src = source;
end)
RegisterNetEvent('Gasmask:CheckPerms')
AddEventHandler('Gasmask:CheckPerms', function()
    local src = source;
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end
    -- TriggerClientEvent("FaxDisVeh:CheckPermission:Return", src, true, false)
    if identifierDiscord then
        local roles = exports.discord_perms:GetRoles(src)
        if not (roles == false) then
            for roleName, roleID in pairs(Config.rolelist) do
                for i = 1, #roles do
                    if tostring(roles[i]) == tostring(roleID) then
                        -- Return the index back to the Client script
                        TriggerClientEvent("Gasmask:CheckPerms:Return", src, true)
                        print(GetPlayerName(src) .. " is able to use Gasmask")
                    end
                end
            end
        else
            print(GetPlayerName(src) .. " is not able to use Gasmask because missing role")
        end
    elseif identifierDiscord == nil then
        print("Discord not found")
    end
end)
