ESX = exports["es_extended"]:getSharedObject()

-- ESX.RegisterUsableItem('noskill_parachute', function(source)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
--     local playerPed = GetPlayerPed(-1)
--     GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("GADGET_PARACHUTE"), true)
-- 	xPlayer.removeInventoryItem('noskill_parachute', 1)
--     print(xPlayer)
--     print(playerPed)
-- end)

ESX.RegisterUsableItem('noskill_parachute', function(source)
	
    if Config.RemoveParachute then
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('noskill_parachute', 1)
    end

	TriggerClientEvent('noskill_parachute:activateFallschirm', source)
end)

-- RegisterServerEvent('noskill_parachute:handleItem')
-- AddEventHandler('noskill_parachute:handleItem', function()
--     local xPlayer = ESX.GetPlayerFromId(source)
--     xPlayer.addInventoryItem('noskill_parachute', 1)

-- end)


