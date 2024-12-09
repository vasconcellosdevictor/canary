VOCATION = {
	ID = {
		NONE = 0,
		SORCERER = 1,
		DRUID = 2,
		PALADIN = 3,
		KNIGHT = 4,
		MASTER_SORCERER = 5,
		ELDER_DRUID = 6,
		ROYAL_PALADIN = 7,
		ELITE_KNIGHT = 8,
		ADVENTURER = 9,
		WIZARD = 10,
		ARCHER = 11,
		BARD = 12,
	},
	CLIENT_ID = {
		NONE = 0,
		KNIGHT = 1,
		PALADIN = 2,
		SORCERER = 3,
		DRUID = 4,
		ELITE_KNIGHT = 11,
		ROYAL_PALADIN = 12,
		MASTER_SORCERER = 13,
		ELDER_DRUID = 14,
		ADVENTURER = 0,
		WIZARD = 0,
		ARCHER = 0,
		BARD = 0,
	},
	BASE_ID = {
		NONE = 0,
		SORCERER = 1,
		DRUID = 2,
		PALADIN = 3,
		KNIGHT = 4,
		ADVENTURER = 5,
		WIZARD = 6,
		ARCHER = 7,
		BARD = 8,
	},
}

function Vocation.getBase(self)
	local base = self
	while base:getDemotion() do
		base = base:getDemotion()
	end
	return base
end
