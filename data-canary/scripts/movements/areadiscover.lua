--[[ Keep a range of storages available for this script
-- Make sure you set actionids in your map editor and configure the script!

local regions = {
    ["Bree"] = {
        tiles = {
            {
                id = 251,
                actionid = 1013,
                name = "The City of Bree",
                position = Position(3084, 1921, 7)
            },
            {
                id = 252,
                actionid = 1014,
                name = "The City of Bree",
                position = Position(3085, 1921, 7)
            },
            {
                id = 253,
                actionid = 1015,
                name = "The City of Bree",
                position = Position(3085, 1919, 7)
            },
        },
        storageId = 251, -- Storage to keep track of discovered locations in Bree
    },
    ["TheOldForest"] = {
        tiles = {
            {
                id = 254,
                actionid = 1004,
                name = "The Old Forest",
                position = Position(2758, 2021, 7)
            },
            {
                id = 255,
                actionid = 1005,
                name = "The Old Forest",
                position = Position(2738, 1914, 7)
            },
            {
                id = 256,
                actionid = 1006,
                name = "The Old Forest",
                position = Position(2739, 1914, 7)
            },
            {
                id = 257,
                actionid = 1007,
                name = "The Old Forest",
                position = Position(2740, 1914, 7)
            },
            {
                id = 258,
                actionid = 1008,
                name = "The Old Forest",
                position = Position(2741, 1914, 7)
            },
        },
        storageId = 254, -- Storage to keep track of discovered locations in TheOldForest
    },
    ["TheBarrowDowns"] = {
        tiles = {
            {
                id = 259,
                actionid = 1009,
                name = "The Barrow-Downs",
                position = Position(3004, 1823, 7)
            },
            {
                id = 260,
                actionid = 1010,
                name = "The Barrow-Downs",
                position = Position(3005, 1823, 7)
            },
            {
                id = 261,
                actionid = 1011,
                name = "The Barrow-Downs",
                position = Position(3006, 1823, 7)
            },
            {
                id = 262,
                actionid = 1012,
                name = "The Barrow-Downs",
                position = Position(3007, 1823, 7)
            },
        },
        storageId = 259 -- Storage to keep track of discovered locations in TheBarrowDowns
    },
}

local test = MoveEvent()
test:type("stepin")

function isPositionInRegion(position, region)
    for _, tile in ipairs(region.tiles) do
        if tile.position == position then
            return true
        end
    end
    return false
end

function test.onStepIn(cid, item, position, fromPos)
    local player = Player(cid)
    if not player then
        return false
    end

    local startQuest = 249
    local DiscoveredLocations = 250

    for regionName, region in pairs(regions) do
        if isPositionInRegion(position, region) then
            if player:getStorageValue(region.storageId) == -1 then
                player:setStorageValue(region.storageId, 1)
                player:setStorageValue(DiscoveredLocations, player:getStorageValue(DiscoveredLocations) + 1)
                local tileName = region.tiles[1].name
                doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have discovered a new location: " .. tileName .. ".")
            end
            break  -- No need to check other regions if the player is in one
        end
    end

    if player:getStorageValue(DiscoveredLocations) == -1 then
        if player:getStorageValue(startQuest) ~= 1 then
            player:setStorageValue(startQuest, 1)
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have discovered a new location.") -- Probably can delete this whole "if" but using it for a quest myself.
        end
    end

    return true]]
--

print("Hello, World!")
