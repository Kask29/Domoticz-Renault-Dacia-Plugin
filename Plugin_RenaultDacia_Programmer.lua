return {
	on = {
		devices = {},
		timer = {},
		variables = {},
		scenes = {},
		groups = {},
		security = {},
		httpResponses = {},
		shellCommandResponses = {},
		customEvents = {
            'plugin_Programmer_charge_RenaultDacia',
            'plugin_Deprogrammer_charge_RenaultDacia'},
		system = {},
	},
	data = {},
	logging = {},
	execute = function(domoticz, triggeredItem)
        if (triggeredItem.trigger == 'plugin_Deprogrammer_charge_RenaultDacia') then
            local splittedResult = domoticz.utils.stringSplit(triggeredItem.data,'---')
            domoticz.log("Annulation des programmation pour les idx " .. splittedResult[1] .. " et " .. splittedResult[2] .. " pour " .. splittedResult[7])
            domoticz.devices(tonumber(splittedResult[1])).cancelQueuedCommands()
            domoticz.devices(tonumber(splittedResult[2])).cancelQueuedCommands()
        elseif (triggeredItem.trigger == 'plugin_Programmer_charge_RenaultDacia') then
            -- {idxButStart}---{idxButStop}---{startH]---{startD}---{stopH}---{stopD}---{Name}
            local splittedResult = domoticz.utils.stringSplit(triggeredItem.data,'---')
            domoticz.log("Programmation de début de charge le " .. splittedResult[4] .. " à " .. splittedResult[3] .. " et fin de charge le " .. splittedResult[6] .. " à " .. splittedResult[5] .. " pour " .. splittedResult[7])
            domoticz.devices(tonumber(splittedResult[1])).cancelQueuedCommands()
            domoticz.devices(tonumber(splittedResult[2])).cancelQueuedCommands()
            domoticz.devices(tonumber(splittedResult[1])).switchOn().at(splittedResult[3] .. " on " .. splittedResult[4])
            domoticz.devices(tonumber(splittedResult[2])).switchOff().at(splittedResult[5] .. " on " .. splittedResult[6])
        else
            local splittedResult = domoticz.utils.stringSplit(triggeredItem.data,'---')
            domoticz.log("Annulation des programmation pour idx " .. splittedResult[1] .. " et " .. splittedResult[2] .. " pour " .. splittedResult[7])
            domoticz.devices(tonumber(splittedResult[1])).cancelQueuedCommands()
            domoticz.devices(tonumber(splittedResult[2])).cancelQueuedCommands()
        end
	end
}
