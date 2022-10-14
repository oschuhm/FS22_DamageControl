--
-- FuelLevel Warning for LS 22
--
-- # Author:  	LS-Farmers.de
-- # date: 		13.10.2022
--

damageControl = {}
damageControl.MOD_NAME = g_currentModName


function damageControl.prerequisitesPresent(specializations)
  return true
end

function damageControl.registerEventListeners(vehicleType)
	SpecializationUtil.registerEventListener(vehicleType, "onLoadFinished", damageControl)
end

function damageControl:onLoadFinished(savegame)

  if self.updateDamageAmount ~= nil then
    self.updateDamageAmount = Utils.overwrittenFunction(self.updateDamageAmount, damageControl.updateDamageAmount)
  end

end

function damageControl:updateDamageAmount(superFunc, dt)
    --print("overwritten getDamageAmount function")

	local damageValue = superFunc(self, dt) / 10
    --print("damageValue -> " .. damageValue)

    return damageValue

end

