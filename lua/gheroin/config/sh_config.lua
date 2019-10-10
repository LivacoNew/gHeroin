--[[----------------------------------
--        gHeroin - By Livaco       --
--------------------------------------
-- If you need help, drop a ticket. --
]]------------------------------------

--[[
-- General Settings
]]--

-- Your language. en - English.
gHeroin.Config.Language = "en"

-- The chat prefix.
gHeroin.Config.Prefix = "[gHeroin]"

-- The color for the chat prefix.
gHeroin.Config.PrefixColor = Color(255, 0, 255)

-- The color for the rest of the message.
gHeroin.Config.MessageColor = Color(255, 255, 255)

-- The font to use for everything.
gHeroin.Config.Font = "Roboto"

-- The distance before 3d2d stops rendering.
gHeroin.Config.Distance3d2d = 750


--[[
-- Growing Settings
]]--

-- The percentage of light needed to determine too much light/not enough. In the middle means it grows.
gHeroin.Config.Plant.NotEnoughLight = 0.2 -- Not enough.
gHeroin.Config.Plant.TooMuchLight = 0.8 -- Too much.

-- If the light can be picked up with the physgun. This is HIGHLY recommeneded.
gHeroin.Config.Plant.LightPhys = true

-- The rate the light looses power at. Be careful not to set this too high.
gHeroin.Config.Plant.LampPowerRate = 0.1

-- The rate the plant grows at. Be careful not to set this too high.
gHeroin.Config.Plant.GrowRate = 1

-- The min and max amount of Opium that can be harvested from a single seed.
gHeroin.Config.Plant.MinOpium = 1
gHeroin.Config.Plant.MaxOpium = 5


--[[
-- Crushing Settings
]]--

-- The max amount of Opium that can be stored in the crusher.
gHeroin.Config.Crusher.MaxOpium = 5

-- The max amount of Opium Latex that can be stored in the crusher.
gHeroin.Config.Crusher.MaxLatex = 50

-- The time needed to crush per Opium Pod.
gHeroin.Config.Crusher.Time = 5

-- The min and max amount of Opium Latex you get can from crushing a single Opium Pod.
gHeroin.Config.Crusher.LatexMin = 1
gHeroin.Config.Crusher.LatexMax = 10


--[[
-- Extraction Settings
]]--

-- The max amount of Opium Latex the Extractor can hold at once.
gHeroin.Config.Extractor.MaxLatex = 35

-- The max amount of Morphine the Extractor can hold at once.
gHeroin.Config.Extractor.MaxHeroin = 20

-- The min/max amount of Heroin that can be extracted per unit of Opium Latex.
gHeroin.Config.Extractor.HeroinMin = 1
gHeroin.Config.Extractor.HeroinMax = 5

-- The time needed to extract from a single unit of Opium Latex.
gHeroin.Config.Extractor.TimePerLatex = 5


--[[
-- NPC Settings
]]--

-- The NPC Model.
gHeroin.Config.NPC.Model = "models/Humans/Group03/Male_04.mdl"

-- If the NPC will stare at the player. If false, it will just look forward.
gHeroin.Config.NPC.Stare = true

-- If the NPC will change responces when a CP tries to interact with it. If false, CP's can just use it regularly.
gHeroin.Config.NPC.CheckCP = true

-- The min/max amount of benjamins you can get from a unit of heroin.
gHeroin.Config.NPC.MinPayout = 100 -- Min
gHeroin.Config.NPC.MaxPayout = 5000 -- Max

-- How much it costs for a syringe.
gHeroin.Config.NPC.SyringeCost = 500

-- The CP Jobs you have. Note it already checks from DarkRP's marked CPs, this is just for extras.
gHeroin.Config.NPC.CPJobs = {} -- Ignore this line.
hook.Add("loadCustomDarkRPItems", "gheroin.config.cpjobs", function() -- Ignore this line.
    -- gHeroin.Config.NPC.CPJobs[TEAM_CITIZEN] = true -- Example citizen.
end) -- Ignore this line.


--[[
-- Misc Settings
]]--

-- The max amount of power the Light can hold.
gHeroin.Config.Misc.LampMaxPower = 100

-- The max amount of Opium Latex that can be stored in the bucket.
gHeroin.Config.Misc.BucketMaxLatex = 25

-- The max amount of Heroin a Bag of Heroin can hold at once.
gHeroin.Config.Misc.MaxHeroin = 10

-- How long in seconds a player is high for after injecting a single unit of heroin.
gHeroin.Config.Misc.HighTime = 10

-- If the addon should add the entities/jobs into DarkRP automatically. To adjust the values for these, goto lua/gheroin/core/sh_darkrp.lua.
gHeroin.Config.Misc.DarkRPAdd = true


--[[
-- Unit Settings
]]--

-- Units for amounts of Heroin.
gHeroin.Config.Units.HeroinUnits = "g"

-- The currency to use.
gHeroin.Config.Units.Currency = "$"


--[[
-- Toolgun Settings
]]--

-- Usergroups that can use the Toolgun to make NPCs.
gHeroin.Config.Toolgun.Groups = {}
gHeroin.Config.Toolgun.Groups["superadmin"] = true
gHeroin.Config.Toolgun.Groups["admin"] = true