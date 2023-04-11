---------- COMMANDS ----------
RegisterCommand('report-player', function()
    TriggerEvent('AG_ReportSystem:MainMenu')
end, false)

---------- EVENTS ----------
RegisterNetEvent('AG_ReportSystem:MainMenu')
AddEventHandler('AG_ReportSystem:MainMenu', function()
	TriggerEvent("nh-context:createMenu", {
        {
            header = "------------------ Report System ------------------",
        },
        {
            header = "Please note that all reports will be reviewed by staff. You might be contacted to obtain further information regarding your report.",
        },
        {
            header = "___________________________________________________",
        },
        {
            header = "File Report",
            context = "File a new player report",
            event = "AG_ReportSystem:CreateReport",
            image = "",
            args = {1,2}
        }
    })
end)

RegisterNetEvent('AG_ReportSystem:CreateReport', function()
	local keyboard, playerID, message = exports["nh-keyboard"]:Keyboard({
        header = "Create Report", 
        rows = {"Player ID", "Report Message"}
    })
    if keyboard ~= nil then
        if playerID and message then
			local personalID = PlayerPedId()
			TriggerServerEvent('AG_REPORTSYSTEM:NewReport', playerID, message)
        end
    end
end)