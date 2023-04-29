-- Citizen.CreateThread(function()
--     while true do Citizen.Wait(1)
--        local playerPed = GetPlayerPed(-1)
--         if IsPedInAnyHeli(playerPed) or IsPedInAnyPlane(playerPed) then
--             GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("GADGET_PARACHUTE"), true)
--         end
--     end
-- end)
ESX = exports["es_extended"]:getSharedObject()

local inFreefall = false
local parachuteObject = nil

RegisterNetEvent('noskill_parachute:activateFallschirm')
AddEventHandler('noskill_parachute:activateFallschirm', function()
	local ped = PlayerPedId()
	inFreefall = IsPedInParachuteFreeFall(ped)

	if not inFreefall then
		local parachuteModel = GetHashKey('p_parachute1_sp_dec')

		RequestModel(parachuteModel)

		while not HasModelLoaded(parachuteModel) do
			Citizen.Wait(1)
		end

		parachuteObject = CreateObject(parachuteModel, 0.0, 0.0, 0.0, true, true, true)
		AttachEntityToEntity(parachuteObject, ped, GetPedBoneIndex(ped, 24816), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		TaskParachute(ped, true)
        
        
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		local isInVehicle = IsPedInAnyVehicle(ped, false)
		local isFalling = IsPedFalling(ped)
		local isParachute = IsPedInParachuteFreeFall(ped)

		if parachuteObject ~= nil then
			if isInVehicle or not isFalling or not isParachute then
				DeleteEntity(parachuteObject)
               	parachuteObject = nil
                -- TriggerServerEvent('noskill_parachute:handleItem')
			end
		end
	end
end)
