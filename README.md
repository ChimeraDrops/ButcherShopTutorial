# ButcherShopTutorial
 Files referenced in my Butcher Shop Tutorial
# ksuie_trader_shops
RedM Fishing Shack made for redem_roleplay and redemrp_inventory v2.0
- Get a fishing rod
- Buy Bait
- Do some fishing...
- Sell Fish for $ and XP

# Installation
1. Put ksuie_trader_shops to your resource folder.
2. Add "ksuie_trader_shops" in your "server.cfg".
3. In redemrp_inventory/Config.lua under Config.Items ensure the items are added :

Config.Items = {

	 ["p_baitBread01x"] =
    {
        label = "Bread Bait",
        description = "used with fishing rod",
        weight = 0.01,
        canBeDropped = true,
        canBeUsed = true,
        requireLvl = 0,
        limit = 32,
        imgsrc = "items/bread_bait.png",
        type = "item_standard",
    },

    ["p_baitCheese01x"] =
    {
        label = "Cheese Bait",
        description = "used with fishing rod",
        weight = 0.01,
        canBeDropped = true,
        canBeUsed = true,
        requireLvl = 0,
        limit = 48,
        imgsrc = "items/cheese_bait.png",
        type = "item_standard",
    },

    ["p_baitCorn01x"] =
    {
        label = "Corn Bait",
        description = "used with fishing rod",
        weight = 0.01,
        canBeDropped = true,
        canBeUsed = true,
        requireLvl = 0,
        limit = 48,
        imgsrc = "items/corn_bait.png",
        type = "item_standard",
    },
	
    ["p_baitCricket01x"] =
    {
        label = "Cricket Bait",
        description = "used with fishing rod",
        weight = 0.01,
        canBeDropped = true,
        canBeUsed = true,
        requireLvl = 0,
        limit = 32,
        imgsrc = "items/cricket_bait.png",
        type = "item_standard",
    },

    ["p_finishedragonfly01x"] =
    {
        label = "River Bait",
        description = "used with fishing rod",
        weight = 0.05,
        canBeDropped = true,
        canBeUsed = true,
        requireLvl = 0,
        limit = 5,
        imgsrc = "items/river_bait.png",
        type = "item_standard",
    },

    ["p_FinisdFishlure01x"] =
    {
        label = "Lake Bait",
        description = "used with fishing rod",
        weight = 0.05,
        canBeDropped = true,
        canBeUsed = true,
        requireLvl = 0,
        limit = 5,
        imgsrc = "items/lake_bait.png",
        type = "item_standard",
    },

    ["p_finishdcrawd01x"] =
    {
        label = "Swamp Bait",
        description = "used with fishing rod",
        weight = 0.05,
        canBeDropped = true,
        canBeUsed = true,
        requireLvl = 0,
        limit = 5,
        imgsrc = "items/swamp_bait.png",
        type = "item_standard",
    },
	
	["smallfish"] =
    {
        label = "Small Fish",
        description = "sell your fish at the fishing shack",
        weight = 0.3,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 20,
        imgsrc = "items/smallfish.png",
        type = "item_standard",
    },

    ["mediumfish"] =
    {
        label = "Medium Fish", 
        description = "sell your fish at the fishing shack",
        weight = 2.3,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 15,
        imgsrc = "items/mediumfish.png",
        type = "item_standard",
    },

    ["largefish"] =
    {
        label = "Large Fish",
        description = "sell your fish at the fishing shack",
        weight = 4.5,
        canBeDropped = true,
        canBeUsed = false,
        requireLvl = 0,
        limit = 10,
        imgsrc = "items/largefish.png",
        type = "item_standard",
    },

	["WEAPON_FISHINGROD"] =
	{
		label = "Rod",
		description = "A mans second best friend",
		weight = 0.9,
		canBeDropped = true,
		requireLvl = 1,
		weaponHash = GetHashKey("WEAPON_FISHINGROD"),
		  imgsrc = "items/WEAPON_FISHINGROD.png",
		type = "item_weapon"
	},
}

# Required resources
- redem_roleplay : https://github.com/RedEM-RP/redem_roleplay/
- redemrp_inventory v2.0 : https://github.com/RedEM-RP/redemrp_inventory
- redemrp_notification : https://github.com/Ktos93/redemrp_notification
- redemrp_fishing : https://github.com/RedEM-RP/redemrp_fishing

# Made by
- KSUIE_Gaming : Discord : https://discord.gg/vydyEUgeDw
- Tutorial on youtube channel : https://www.youtube.com/channel/UCE57PFHrwfbTZ2YblzQdv5w
- Twitch: https://www.twitch.tv/ksuie