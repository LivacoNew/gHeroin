--[[
-- gHeroin Language Config
-- Drop a ticket if you need any help.
]]--

--[[
-- NPC Language
]]--

-- NPC 3D2D.
gHeroin.Lang.NPC.Text3D2D = "Heroin Addict"

-- The message sent to cops when they try to interact with the NPC. Only works when gHeroin.Config.NPC.CheckCP is true.
gHeroin.Lang.NPC.CopMessage = "Nothing to see here officer!"

-- The message sent to players if they are not the correct job to interact with the NPC. Only works when gHeroin.Config.NPC.Whitelist is true.
gHeroin.Lang.NPC.WhitelistMessage = "Go away! I aint got no business with you!"

-- The message sent to players if interact with the NPC, but haven't given him any heroin.
gHeroin.Lang.NPC.NoHeroinMessage = "Don't try to even talk to me 'til you get me some of that good shit, you got it?"

-- The message sent to players once they sell some heroin. %s is the money the player made from it.
gHeroin.Lang.NPC.HeroinMessage = "Oh god, thank you so much man! Here's %s in legit dollar bills."



--[[
-- Entity Language
]]--

-- Acetic Anhydride 3D2D.
gHeroin.Lang.Entities.Acetic3D2D = "Acetic Anhydride"

-- Hydrochloric Acid 3D2D.
gHeroin.Lang.Entities.Acid3D2D = "Hydrochloric Acid"

-- Ammonia Solution 3D2D.
gHeroin.Lang.Entities.Ammonia3D2D = "Ammonia Solution"

-- Heroin Base 3D2D.
gHeroin.Lang.Entities.HeroinBase3D2D = "Heroin Base"

-- Heroin 3D2D. %s is the amount of heroin.
gHeroin.Lang.Entities.Heroin3D2D = "Heroin - %s"

-- Morphine 3D2D.
gHeroin.Lang.Entities.Morphine3D2D = "Morphine"

-- Package 3D2D. %s is the amount of heroin inside, the second one if the maximum amount of heroin.
gHeroin.Lang.Entities.Package3D2D = "Package of Heroin. %s / %s"

-- Poppy Seed 3D2D.
gHeroin.Lang.Entities.Seed3D2D = "Poppy Seeds"

-- Sodium Carbonate 3D2D.
gHeroin.Lang.Entities.Sodum3D2D = "Sodium Carbonate"

-- Barrel header for the 3D2D.
gHeroin.Lang.Entities.Barrel = "Barrel"

-- Barrel insert message. %s is the ingredient (see below).
gHeroin.Lang.Entities.BarrelInsert = "Insert %s."

-- The ingredients to finish the insert message.
gHeroin.Lang.Entities.BarrelMorphine = "Morphine" -- Morphine
gHeroin.Lang.Entities.BarrelAcetic = "Acetic Anhydride" -- Acetic Anhydride
gHeroin.Lang.Entities.BarrelSodium = "Sodium Carbonate" -- Sodium Carbonate

-- Dissolving message.
gHeroin.Lang.Entities.BarrelDissolve = "Dissolving"

-- Extractor Header.
gHeroin.Lang.Entities.Extractor = "Extractor"

-- Message to insert Poppy Seeds into extractor.
gHeroin.Lang.Entities.ExtractorInsert = "Insert Poppy Seeds"

-- Message while extracting.
gHeroin.Lang.Entities.ExtractorExtracting = "Extracting"

-- The header for the Mixer.
gHeroin.Lang.Entities.Mixer = "Mixer"

-- Mixer insert message. %s is the ingredient (see bellow).
gHeroin.Lang.Entities.MixerInsert = "Insert %s."

-- The ingredients to finish the insert message.
gHeroin.Lang.Entities.MixerHeroin = "Heroin" -- Heroin
gHeroin.Lang.Entities.MixerAcid = "Hydrochloric Acid" -- Hydrochloric Acid
gHeroin.Lang.Entities.MixerAmmonia = "Ammonia Solution" -- Ammonia Solution

-- The message while mixing.
gHeroin.Lang.Entities.MixerMixing = "Mixing"