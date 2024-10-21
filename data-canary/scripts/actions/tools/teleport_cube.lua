local config = {
	{ name = "Strongarm", position = Position(1943, 1346, 7) },
	{ name = "Montag", position = Position(5001, 5000, 7) },
	{ name = "Alexandria", position = Position(5521, 5124, 6) },
}

local teleportCube = Action()
function teleportCube.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local window = ModalWindow({
		title = "Teleport Modal",
		message = "Locations",
	})
	for i, info in pairs(config) do
		window:addChoice(string.format("%s", info.name), function(player, button, choice)
			if button.name ~= "Select" then
				return true
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported to " .. info.name)
			player:teleportTo(info.position)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end)
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return true
end
teleportCube:id(31633)
teleportCube:register()
