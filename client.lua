local NDCore = exports['nd-core']:GetCoreObject()
local time = Config.HealingTime * 1000

RegisterNetEvent('nd-healing:client:healing', function()
    local player = PlayerPedId()
    local playerData = NDCore.Functions.GetPlayerData()
    
    if playerData.metadata['isdead'] or playerData.metadata['inlaststand'] then
        if playerData['money'][Config.MoneyType] >= Config.Price then

            NDCore.Functions.Progressbar('healing', 'Баба ти помага...', time, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                
                TriggerServerEvent('nd-healing:server:billing')
                TriggerEvent('hospital:client:Revive')
            end, function()

            end)
        else 
            NDCore.Functions.Notify('Нямате достатъчно пари!', 'error')
        end
    else
        NDCore.Functions.Notify('Бабе нищо ти няма!', 'error')
    end
end)