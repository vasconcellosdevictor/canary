--[[local config = {
	[ITEM_COPPER_COIN] = { changeTo = ITEM_SILVER_COIN },
	[ITEM_SILVER_COIN] = { changeBack = ITEM_COPPER_COIN, changeTo = ITEM_GOLD_COIN },
	[ITEM_GOLD_COIN] = { changeBack = ITEM_SILVER_COIN },
}

local changeGold = Action()

function changeGold.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local coin = config[item:getId()]
	if coin.changeTo and item.type == 100 then
		item:remove()
		player:addItem(coin.changeTo, 1)
		return true
	elseif coin.changeBack then
		item:remove(1)
		player:addItem(coin.changeBack, 100)
		return true
	end
	return false
end
XXXXX
changeGold:id(ITEM_COPPER_COIN, ITEM_SILVER_COIN, ITEM_GOLD_COIN)
changeGold:register()
---SCRIPT DE TROCA DE MOEDAS COM USE. REMOVIDO]]
