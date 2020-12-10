--================================--
--          GASMASK v2.0          --
--          by JellyJam           --
--      License: GNU GPL 3.0      --
--================================--

Citizen.CreateThread(function()
	TriggerServerEvent('Gasmask:CheckPerms')
end)

local isAllowed = false

RegisterNetEvent("Gasmask:CheckPerms:Return")
AddEventHandler("Gasmask:CheckPerms:Return", function(Allowed)
    if Allowed then
    	isAllowed = true
    else
    	isAllowed = false
    end
end)


local gasMaskOn = false

function notify(string)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(string)
        DrawNotification(true, false)
    end

local function PlayEmote()
    local playerped = GetPlayerPed(-1)
    RequestAnimDict('mp_masks@standard_car@ds@')
        TaskPlayAnim(playerped, 'mp_masks@standard_car@ds@', 'put_on_mask', 8.0, 8.0, 800, 16, 0, false, false, false)
    end 

RegisterCommand("gasmask", function(Source, args, rawCommand)
	if isAllowed ~= false and isAllowed == true then
		if args[1] == "on" then
      	 	if not gasMaskOn then
       	  		gasMaskOn = true
       	    	local playerped = GetPlayerPed(-1)
       	    	SetEntityProofs(playerped, false, false, false, false, false, false, true, true, false)
                PlayEmote()              
                SetPedComponentVariation(PlayerPedId(), 1, Config.mask, 0, 1)
       	    	notify("Gasmask ~g~equipped")
        	else
        		notify("Your mask ~w~is already ~g~on")
        	end
    	elseif args[1] == "off" then
    		if gasMaskOn then
            	gasMaskOn = false
            	local playerped = GetPlayerPed(-1)
            	SetEntityProofs(playerped, false, false, false, false, false, false, false, false, false)
                PlayEmote()
                SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 1)
            	notify("Gasmask ~r~unequipped")
        	else 
        		notify("Your mask ~w~is already ~r~off")
        	end
    	elseif args[1] == nil then
    		if not gasMaskOn then
                gasMaskOn = true
                local playerped = GetPlayerPed(-1)
                SetEntityProofs(playerped, false, false, false, false, false, false, true, true, false)
                PlayEmote()
                SetPedComponentVariation(PlayerPedId(), 1, Config.mask, 0, 1)
                notify("Gasmask ~g~equipped")
            else
                gasMaskOn = false
                local playerped = GetPlayerPed(-1)
                SetEntityProofs(playerped, false, false, false, false, false, false, false, false, false)
                PlayEmote()
                SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 1)
                notify("Gasmask ~r~unequipped")
            end
   		else
    		notify("This command is not recognized")
    	end
    else
        notify("You are not ~b~certified ~w~to do this!")
    end
end) 

TriggerEvent('chat:addSuggestion', '/gasmask', 'Toggle a gasmask on or off')

TriggerEvent('chat:addSuggestion', '/gasmask off', 'Toggle a gasmask off')

TriggerEvent('chat:addSuggestion', '/gasmask on', 'Toggle a gasmask on')
