local enabled = false

RegisterNetEvent('Miranda:Update')
AddEventHandler('Miranda:Update', function(en)
	enabled = en
	SendNUIMessage({
	type = "ui",
	display = en
	})
end)
  
Citizen.CreateThread(function()
	Citizen.Wait(500)
	TriggerEvent("Miranda:Update", false)
	while true do
		Citizen.Wait(0)
		if enabled == true then
			if IsControlPressed(0, 38) then
        			TriggerEvent("Miranda:Update", false)
				enabled = false
			end
		end
	end
end)

RegisterCommand("miranda", function()
	TriggerEvent('Miranda:Update', true)
	enabled = true
end)