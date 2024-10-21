local config = {
	[ITEM_COPPER_COIN] = { changeTo = ITEM_SILVER_COIN },
	[ITEM_SILVER_COIN] = { changeBack = ITEM_COPPER_COIN, changeTo = ITEM_GOLD_COIN },
	[ITEM_GOLD_COIN] = { changeBack = ITEM_SILVER_COIN },
}

local copperConverter = Action()

function copperConverter.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local coin = config[target.itemid]
	if not coin then
		return false
	end

	local charges = item:getCharges()
	if coin.changeTo and target.type == 100 then
		target:remove()
		player:addItem(coin.changeTo, 1)
		item:transform(item:getId(), charges - 1)
	elseif coin.changeBack then
		target:transform(target.itemid, target.type - 1)
		player:addItem(coin.changeBack, 100)
		item:transform(item:getId(), charges - 1)
	else
		return false
	end

	if charges == 0 then
		item:remove()
	end
	return true
end

copperConverter:id(23722, 25719)
copperConverter:register()
