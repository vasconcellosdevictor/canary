local miningIds = { 6721 } --Icy Mountain
local guangueIds = { 5880 } --trash
local mininglootCommon = { 5880 } --common loot from sea: sardine, squid, red tuna
local mininglootRare = { 5880 } --rare loot from sea: red squid, flying fish, barracuda, bluefin
local mininglootVeryRare = { 5880 } --veryrare loot from sea: codfish >>> adicionar marlin


local miningSpecials = {
	chances = {
		{ from = 0, to = 500, itemId = 3026 }, -- white pearl
		{ from = 501, to = 801, itemId = 3029 }, -- small sapphire
		{ from = 802, to = 1002, itemId = 3032 }, -- small emerald
		{ from = 1003, to = 1053, itemId = 281 }, -- giant shimmering pearl (green)
		{ from = 1054, to = 1104, itemId = 282 }, -- giant shimmering pearl (brown)
		{ from = 1105, to = 1115, itemId = 9303 }, -- leviathan's amulet
	},
}

local usePick = true

local mining = Action()

function mining.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not (table.contains(miningIds, target.itemid)) then
		return false
	end

	if math.random(100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_MINING) - 10) * 0.597, 10), 50) then
		if usePick --[[and not player:removeItem("pick", 1)]] then
			return true
			
		end
	end

		if player:getItemCount(5880) > 1 then
			player:addSkillTries(SKILL_MINING, 1, true)
		return true	
		end

		if table.contains(miningIds, target.itemid) then
			local rareChance = math.random(100)
			if rareChance == 1 then
				toPosition:sendMagicEffect(CONST_ME_MAGIC_POWDER)
				player:say("Waaah", TALKTYPE_MONSTER_SAY)
				player:addItem(mininglootVeryRare[math.random(#mininglootVeryRare)], 1)
			elseif rareChance == 2 then
				player:addItem(mininglootRare[math.random(#mininglootRare)], 1)
			elseif rareChance <= 10 then
				player:addItem(mininglootCommon[math.random(#mininglootCommon)], 1)
			else
				player:addItem(gangueIds[math.random(#gangueIds)], 1)
			end
			return true
		end

		--[[if table.contains(riverIds, target.itemid) then
			local rareChance1 = math.random(100)
			if rareChance1 == 1 then
				toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
				player:say("Test 1.", TALKTYPE_MONSTER_SAY)
				player:addItem(riverlootVeryRare[math.random(#riverlootVeryRare)], 1)
			elseif rareChance1 == 2 then
				player:addItem(riverlootRare[math.random(#riverlootRare)], 1)
			elseif rareChance1 <= 10 then
				player:addItem(riverlootCommon[math.random(#riverlootCommon)], 1)
			else
				player:addItem(riverlootFood[math.random(#riverlootFood)], 1)
			end
			return true
		end
	end]]

	--[[if table.contains(seaIds, target.itemid) or table.contains(riverIds, target.itemid) then
		toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
		local targetId = target.itemid
		target:transform(targetId + 1)
		if targetId == 6721 then
			target:transform(4597)
			target:decay()
		elseif targetId == 4614 then
			target:transform(4609)
			target:decay()
		end
		if targetId == 21307 then
			target:transform(21302)
			target:decay()
		elseif targetId == 21315 then
			target:transform(21311)
			target:decay()
		end]
	end
	return true]]
end

mining:id(3456)
mining:allowFarUse(false)
mining:register()
