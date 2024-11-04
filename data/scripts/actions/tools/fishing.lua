local seaIds = { 4597, 4598, 4599, 4600, 4601, 4602, 4609, 4610, 4611, 4612, 4613, 4614, 7236 } --sea water
local riverIds = { 21302, 21303, 21304, 21305, 21306, 21307, 21311, 21312, 21313, 21314, 21315 } --river water
local sealootFood = { 49285 } --just food loot from sea: sardine
local sealootCommon = { 49285, 49279, 49286 } --common loot from sea: sardine, squid, red tuna
local sealootRare = { 49280, 49289, 49288, 49287 } --rare loot from sea: red squid, flying fish, barracuda, bluefin
local sealootVeryRare = { 49284 } --veryrare loot from sea: codfish >>> adicionar marlin
local riverlootFood = { 49290 } --just food loot from river: saint-peter
local riverlootCommon = { 49290, 49292 } --common loot from river: saint-peter, black bass
local riverlootRare = { 49291, 49282 } --rare loot from river: rainbow trout, blue catfish
local riverlootVeryRare = { 49283 } --veryrare loot from river: jack dempsey

local specials = {
	chances = {
		{ from = 0, to = 500, itemId = 3026 }, -- white pearl
		{ from = 501, to = 801, itemId = 3029 }, -- small sapphire
		{ from = 802, to = 1002, itemId = 3032 }, -- small emerald
		{ from = 1003, to = 1053, itemId = 281 }, -- giant shimmering pearl (green)
		{ from = 1054, to = 1104, itemId = 282 }, -- giant shimmering pearl (brown)
		{ from = 1105, to = 1115, itemId = 9303 }, -- leviathan's amulet
	},
}

local useWorms = true

local fishing = Action()

function fishing.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not (table.contains(seaIds, target.itemid) or table.contains(riverIds, target.itemid)) then
		return false
	end

	if math.random(100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
		if useWorms and not player:removeItem("worm", 1) then
			return true
		end

		if player:getItemCount(3492) > 0 then
			player:addSkillTries(SKILL_FISHING, 1, true)
		end

		if table.contains(seaIds, target.itemid) then
			local rareChance = math.random(100)
			if rareChance == 1 then
				toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
				player:say("My great-grandmother's favorite fish.", TALKTYPE_MONSTER_SAY)
				player:addItem(sealootVeryRare[math.random(#sealootVeryRare)], 1)
			elseif rareChance == 2 then
				player:addItem(sealootRare[math.random(#sealootRare)], 1)
			elseif rareChance <= 10 then
				player:addItem(sealootCommon[math.random(#sealootCommon)], 1)
			else
				player:addItem(sealootFood[math.random(#sealootFood)], 1)
			end
			return true
		end

		if table.contains(riverIds, target.itemid) then
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
	end

	if table.contains(seaIds, target.itemid) or table.contains(riverIds, target.itemid) then
		toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
		local targetId = target.itemid
		target:transform(targetId + 1)
		if targetId == 4602 then
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
		end
	end
	return true
end

fishing:id(3483)
fishing:allowFarUse(true)
fishing:register()
