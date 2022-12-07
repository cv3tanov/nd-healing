local NDCore = exports['nd-core']:GetCoreObject()

RegisterServerEvent('nd-healing:server:billing', function()
    local src = source
    local Player = NDCore.Functions.GetPlayer(src)
    
    Player.Functions.RemoveMoney(Config.MoneyType, Config.Price, 'revived')
    TriggerClientEvent('NDCore:Notify', src, 'Плати на баба $'..Config.Price, 'success')
end)