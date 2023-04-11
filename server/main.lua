RegisterServerEvent('AG_REPORTSYSTEM:NewReport')
AddEventHandler('AG_REPORTSYSTEM:NewReport', function(playerID, message)
    for k,v in ipairs(GetPlayers()) do
        local id = v
        if v == playerID then
            local player = source
            local playerName = GetPlayerName(player)
            local playerReported = playerID
            local playerReportedName = GetPlayerName(playerReported)
            if Config.EnableDiscordNotifications then
                if Config.UseTaggedRole then
                    PerformHttpRequest(Config.NotificationWebhook, function(err, text, headers) end, 'POST', json.encode({username = 'Player Report', content = "<@&" .. Config.TaggedRoleID .. ">\n**" .. playerName .. " (" .. player .. ")** has just filed a player report. \n\n**Player:** *" .. playerReportedName .. " (" .. playerID .. ")* \n**Reason:** *" .. message .. "*" }), { ['Content-Type'] = 'application/json' })
                else
                    PerformHttpRequest(Config.NotificationWebhook, function(err, text, headers) end, 'POST', json.encode({username = 'Player Report', content = "**" .. playerName .. " (" .. player .. ")** has just filed a player report. \n\n**Player:** *" .. playerReportedName .. " (" .. playerID .. ")* \n**Reason:** *" .. message .. "*" }), { ['Content-Type'] = 'application/json' })
                end
            end
        end
    end
end)