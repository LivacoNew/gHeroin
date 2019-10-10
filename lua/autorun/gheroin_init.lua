-- Tables.
gHeroin = {}
gHeroin.Core = gHeroin.Core or {}
gHeroin.Highs = gHeroin.Highs or {}
gHeroin.DB = gHeroin.DB or {}

gHeroin.Config = gHeroin.Config or {}
gHeroin.Config.Plant = gHeroin.Config.Plant or {}
gHeroin.Config.Crusher = gHeroin.Config.Table or {}
gHeroin.Config.Extractor = gHeroin.Config.Extractor or {}
gHeroin.Config.NPC = gHeroin.Config.NPC or {}
gHeroin.Config.Misc = gHeroin.Config.Misc or {}
gHeroin.Config.Units = gHeroin.Config.Units or {}
gHeroin.Config.Toolgun = gHeroin.Config.Toolgun or {}

gHeroin.Languages = gHeroin.Languages or {}

-- Helper function for printing into the console.
function gHeroin.Core.Print(message)
    MsgC(Color(255, 0, 255), "[gHeroin] ", Color(255, 255, 255), message, "\n")
end

gHeroin.Core.Print("Loading gHeroin.")
gHeroin.Core.Print("")

-- Load config and all language files.
AddCSLuaFile("gheroin/config/sh_config.lua")
include("gheroin/config/sh_config.lua")

for k,v in pairs(file.Find("gheroin/config/languages/sh_*.lua", "LUA")) do
    AddCSLuaFile("gheroin/config/languages/" .. v)
    include("gheroin/config/languages/" .. v)
end

if(!gHeroin.Languages[gHeroin.Config.Language]) then
    gHeroin.Core.Print("[FATAL] Could not find the language selected. Go into garrysmods/addons/gheroin/lua/gheroin/config/config.lua and make sure your language is one of the options, before restarting the server.")
    gHeroin.Core.Print("[FATAL] EXPECT FURTHER ERRORS AND SHIT BEING FUCKED!")
else
    gHeroin.Core.Print("Found language " .. gHeroin.Config.Language .. " successfully.")
end
gHeroin.Core.Print("")

-- Checks if it's serverside or clientside to load proper files.
if(SERVER) then
    gHeroin.NetCooldown = gHeroin.NetCooldown or {}

    -- Serverside files.
    gHeroin.Core.Print("Loading serverside files.")
    for k,v in pairs(file.Find("gheroin/core/sv*.lua", "LUA")) do
        gHeroin.Core.Print("    - " .. v)
        include("gheroin/core/" .. v)
    end

    -- Shared files.
    gHeroin.Core.Print("Loading shared files.")
    for k,v in pairs(file.Find("gheroin/core/sh*.lua", "LUA")) do
        gHeroin.Core.Print("    - " .. v)
        include("gheroin/core/" .. v)
        AddCSLuaFile("gheroin/core/" .. v)
    end

    -- Clientside files.
    gHeroin.Core.Print("Loading clientside files.")
    for k,v in pairs(file.Find("gheroin/core/cl*.lua", "LUA")) do
        gHeroin.Core.Print("    - " .. v)
        AddCSLuaFile("gheroin/core/" .. v)
    end

    gHeroin.DB.StatupChecks()
else
    -- Shared files.
    gHeroin.Core.Print("Loading shared files.")
    for k,v in pairs(file.Find("gheroin/core/sh*.lua", "LUA")) do
        gHeroin.Core.Print("    - " .. v)
        include("gheroin/core/" .. v)
    end

    -- Clientside files.
    gHeroin.Core.Print("Loading clientside files.")
    for k,v in pairs(file.Find("gheroin/core/cl*.lua", "LUA")) do
        gHeroin.Core.Print("    - " .. v)
        include("gheroin/core/" .. v)
    end
end
gHeroin.Core.Print("")
gHeroin.Core.Print("Loaded.")