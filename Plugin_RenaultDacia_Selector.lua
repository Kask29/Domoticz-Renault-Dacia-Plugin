return {
	on = {
		devices = {
			1,
			17
		}
	},
	logging = {
		level = domoticz.LOG_INFO,
		marker = 'template',
	},
	execute = function(domoticz, device)
		domoticz.log('Spring - Charge : ' .. domoticz.devices(1).percentage .. '% / ' .. domoticz.devices(17).levelName .. '%', domoticz.LOG_INFO)
		
		
		if ( tonumber(domoticz.devices(1).percentage) >= tonumber(domoticz.devices(17).levelName)) then
            if ( tonumber(domoticz.devices(7).sensorValue) >= 1 ) then
                domoticz.log("Charge atteinte -> Arrêt de la charge")
                domoticz.devices(14).switchOff()
            else
                domoticz.log("Charge déjà arrêtée")
            end
        else
            if ( tonumber(domoticz.devices(7).sensorValue) >= 1 ) then
                domoticz.log("Charge en cours")
            else
                if ( tonumber(domoticz.devices(6).sensorValue) >= 1) then
                    domoticz.log("Charge arrêtée ! Voiture branchée")
                else
                    domoticz.log("Charge arrêtée ! Voiture débranchée")
                end
                
                
            end
        end
        
	end
}