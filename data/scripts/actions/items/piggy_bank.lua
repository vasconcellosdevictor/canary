local piggyBank = Action()

function piggyBank.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if math.random(6) == 1 then
		fromPosition:sendMagicEffect(CONST_ME_POFF)
		item:transform(2996)

		player:addItem(ITEM_COPPER_COIN, 1)
		player:addAchievementProgress("Allowance Collector", 50)
	else
		fromPosition:sendMagicEffect(CONST_ME_SOUND_YELLOW)
		player:addItem(ITEM_SILVER_COIN, 1)
	end
	return true
end

piggyBank:id(2995)
piggyBank:register()
