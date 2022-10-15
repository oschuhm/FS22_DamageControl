--
-- Damage Control for LS 22
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

	local damageValue = superFunc(self, dt)
	local difficultyFactor = Utils.getNoNil(EconomyManager.getCostMultiplier(),1)
	local reductionFactor = 0.5 * difficultyFactor
	local reducedDamageValue = damageValue * reductionFactor
    -- print("damageValue -> " .. damageValue .. " difficultyFactor -> " .. difficultyFactor .. " reductionFactor -> " .. reductionFactor .. " reducedDamageValue -> " .. reducedDamageValue)

    return reducedDamageValue

end

