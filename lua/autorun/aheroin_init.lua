-- Tables.
gHeroin = {}
gHeroin.Core = gHeroin.Core or {}
gHeroin.Highs = gHeroin.Highs or {}

gHeroin.Config = gHeroin.Config or {}
gHeroin.Config.Entities = gHeroin.Config.Entities or {}
gHeroin.Config.NPC = gHeroin.Config.NPC or {}

gHeroin.Lang = gHeroin.Lang or {}
gHeroin.Lang.Entities = gHeroin.Lang.Entities or {}
gHeroin.Lang.NPC = gHeroin.Lang.NPC or {}


-- Helper function to print into the console.
function gHeroin.Core.Print(msg)
    MsgC(Color(255, 0, 255, 255), "[gHeroin] ", Color(255, 255, 255, 255), msg, "\n")
end

-- Load files.
gHeroin.Core.Print("Loading gHeroin.")
gHeroin.Core.Print("")

-- Load config.
AddCSLuaFile("gHeroin/config/sh_config.lua")
include("gHeroin/config/sh_config.lua")
-- Load lang file.
AddCSLuaFile("gHeroin/config/sh_lang.lua")
include("gHeroin/config/sh_lang.lua")

if(SERVER) then
    -- FastDL
    if(gHeroin.Config.FastDL == true) then
        resource.AddWorkshop("1833179048")
    end

    -- Serverside files.
    gHeroin.Core.Print("Serverside files...")
    local svFiles = file.Find("gHeroin/core/sv*.lua", "LUA")
    for k,v in pairs(svFiles) do
        gHeroin.Core.Print("  " .. v)
        include("gHeroin/core/" .. v)
    end
    gHeroin.Core.Print("")

    -- Shared files.
    gHeroin.Core.Print("Shared files...")
    local shFiles = file.Find("gHeroin/core/sh*.lua", "LUA")
    for k,v in pairs(shFiles) do
        gHeroin.Core.Print("  " .. v)
        include("gHeroin/core/" .. v)
        AddCSLuaFile("gHeroin/core/" .. v)
    end
    gHeroin.Core.Print("")

    -- Clientside files.
    gHeroin.Core.Print("Clientside files...")
    local clFiles = file.Find("gHeroin/core/cl*.lua", "LUA")
    for k,v in pairs(clFiles) do
        gHeroin.Core.Print("  " .. v)
        AddCSLuaFile("gHeroin/core/" .. v)
    end
else
    -- Shared files.
    gHeroin.Core.Print("Shared files...")
    local shFiles = file.Find("gHeroin/core/sh*.lua", "LUA")
    for k,v in pairs(shFiles) do
        gHeroin.Core.Print("  " .. v)
        include("gHeroin/core/" .. v)
    end
    -- Clientside files.
    gHeroin.Core.Print("Clientside files...")
    local clFiles = file.Find("gHeroin/core/cl*.lua", "LUA")
    for k,v in pairs(clFiles) do
        gHeroin.Core.Print("  " .. v)
        include("gHeroin/core/" .. v)
    end
end
gHeroin.Core.Print("")
gHeroin.Core.Print("Loaded.")