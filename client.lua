--================================--
--          GASMASK v1.0          --
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

RegisterCommand("gasmask", function(Source, args, rawCommand)
	if isAllowed ~= false and isAllowed == true then
		if args[1] == "on" then
      	 	if not gasMaskOn then
       	  		gasMaskOn = true
       	    	local playerped = GetPlayerPed(-1)
       	    	SetEntityProofs(playerped, false, false, false, false, false, false, true, true, false)
       	    	notify("Gasmask ~g~equipped")
        	else
        		notify("Your mask ~w~is already ~g~on")
        	end
    	elseif args[1] == "off" then
    		if gasMaskOn then
            	gasMaskOn = false
            	local playerped = GetPlayerPed(-1)
            	SetEntityProofs(playerped, false, false, false, false, false, false, false, false, false)
            	notify("Gasmask ~r~unequipped")
        	else 
        		notify("Your mask ~w~is already ~r~off")
        	end
    	elseif args[1] == nil then
    		notify("Use /gasmask ~g~on ~w~or /gasmask ~r~off")
   		else
    		notify("This command is not recognized")
    	end
    else
    	notify("You are not ~b~certified ~w~to do this!")
    end
end) 

TriggerEvent('chat:addSuggestion', '/gasmask', 'Take a gasmask on/off')
