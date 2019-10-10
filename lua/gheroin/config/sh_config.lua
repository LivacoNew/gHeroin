--[[
-- gHeroin Config
-- Drop a ticket if you need any help.
]]--

-- If you want to edit/change the DarkRP F4 entities, goto gheroin/core/sh_darkrp.lua and edit that file. If you want to disable it, just simply delete the file.


--[[
-- General Config
]]--

-- The prefix for all chat messages.
gHeroin.Config.Prefix = "[gHeroin]"

-- The color of the prefix.
gHeroin.Config.PrefixColor = Color(255, 0, 255)

-- The color of the rest of the message.
gHeroin.Config.ChatColor = Color(255, 255, 255)

-- The currency to use.
gHeroin.Config.Currency = "$"

-- The font for all the visuals.
gHeroin.Config.Font = "Roboto"

-- If false, 3D2Ds will not look at the player, and just stay looking forward.
gHeroin.Config.StareAtPlayer = true



--[[
-- Entity Config
]]--

-- The time it takes for the Extractor to extract.
gHeroin.Config.Entities.ExtractorTime = 30

-- The time it takes for the ingredients to dissolve in the Barrel.
gHeroin.Config.Entities.IngredientDissolveTime = 50

-- The time it takes for the ingredients to mix in the Mixer.
gHeroin.Config.Entities.IngredientMixTime = 60

-- The unit Heroin is mesured in.
gHeroin.Config.Entities.HeroinUnit = "g"

-- The minimum/maximum amount a heroin packet can contain. This is in whatever units you specified above.
gHeroin.Config.Entities.HeroinMin = 1 -- Minimum
gHeroin.Config.Entities.HeroinMax = 5 -- Maximum

-- The maximum amount of heroin a Package can contain. This is in whatever units you specified above.
gHeroin.Config.Entities.MaxHeroin = 75

-- How long a player should be high after taking heroin.
gHeroin.Config.Entities.HeroinHighTime = 60

-- The health for all the entities (alphabetical order).
gHeroin.Config.Entities.EntityHealth = {}
gHeroin.Config.Entities.EntityHealth["acetic"] = 15 -- Acetic Anhydride
gHeroin.Config.Entities.EntityHealth["acid"] = 25 -- Hydrochloric Acid
gHeroin.Config.Entities.EntityHealth["ammoina"] = 25 -- Ammoina Solution
gHeroin.Config.Entities.EntityHealth["barrel"] = 250 -- Barrel
gHeroin.Config.Entities.EntityHealth["extractor"] = 150 -- Extractor
gHeroin.Config.Entities.EntityHealth["heroinBase"] = 50 -- Heroin Base
gHeroin.Config.Entities.EntityHealth["heroin"] = 75 -- Regular Heroin
gHeroin.Config.Entities.EntityHealth["mixer"] = 250 -- Mixer
gHeroin.Config.Entities.EntityHealth["morphine"] = 15 -- Morphine
gHeroin.Config.Entities.EntityHealth["package"] = 50 -- Package
gHeroin.Config.Entities.EntityHealth["seed"] = 15 -- Poppy Seed
gHeroin.Config.Entities.EntityHealth["sodium"] = 15 -- Sodium Carbonate



--[[
-- NPC Config
]]--

-- The model for the NPC.
gHeroin.Config.NPC.Model = "models/Humans/Group03/Male_01.mdl"

-- Whether to check if the player is a CP or not. If they are, the NPC will just say a message specified in the lang file.
gHeroin.Config.NPC.CheckCP = true

-- The minimum/maximum value for the NPC's payout per unit of heroin.
gHeroin.Config.NPC.PayoutMin = 100 -- Minimum
gHeroin.Config.NPC.PayoutMax = 1000 -- Maximum

-- If true, a 'Whitelist' will be enabled, meaining only certain jobs will be allowed to use the NPC.
gHeroin.Config.NPC.Whitelist = true

-- If above is true, what jobs are allowed to use the NPC.
gHeroin.Config.NPC.WhitelistJobs = {}
hook.Add("loadCustomDarkRPItems", "gheroin.config.npcjobs", function() -- Ignore this line.
    gHeroin.Config.NPC.WhitelistJobs[TEAM_GANG] = true -- Gangster
    gHeroin.Config.NPC.WhitelistJobs[TEAM_MOB] = true -- Mob Boss
end) -- Ignore this line.