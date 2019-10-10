-- Net Messages
util.AddNetworkString("gheroin.core.message")
util.AddNetworkString("gheroin.core.placenpc")
util.AddNetworkString("gheroin.core.removenpc")
util.AddNetworkString("gheroin.core.npcui")
util.AddNetworkString("gheroin.core.attemptsell")
util.AddNetworkString("gheroin.core.attemptbuy")
util.AddNetworkString("gheroin.core.highplayer")

-- Lamp Physgun
hook.Add("PhysgunPickup", "gheroin.core.lightpickup", function(ply, ent)
    if(ent:GetClass() == "gheroin_lamp") then
        return gHeroin.Config.Plant.LightPhys
    end
end)

-- Message function.
function gHeroin.Core.Message(ply, message)
    net.Start("gheroin.core.message")
    net.WriteString(message)
    net.Send(ply)
end

-- Toolgun place NPC logic.
net.Receive("gheroin.core.placenpc", function(len, ply)
    -- Net cooldown stuff.
    if(gHeroin.NetCooldown[ply:SteamID64()]) then
        if(gHeroin.NetCooldown[ply:SteamID64()] >= CurTime()) then
            gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].rateLimit)
            gHeroin.NetCooldown[ply:SteamID64()] = CurTime() + 0.5
            return
        end
    end
    gHeroin.NetCooldown[ply:SteamID64()] = CurTime() + 0.5

    -- Make sure they are actually allowed to place NPCs.
    if(!gHeroin.Config.Toolgun.Groups[ply:GetUserGroup()]) then
        gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].noPermission)
        return
    end

    -- Get the pos/angle and place it.
    local pos = net.ReadVector()
    local ang = net.ReadAngle()

    local id = gHeroin.DB.AddNPC(pos, ang)
    local npc = ents.Create("gheroin_npc")
    npc:SetPos(pos)
    npc:SetAngles(ang)
    npc:SetSpawnID(id)
    npc:Spawn()

    gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].npcCreateNew)
    hook.Run("gheroin.hooks.npc.newnpc", ply, pos, ang)
end)

-- Toolgun remove NPC logic.
net.Receive("gheroin.core.removenpc", function(len, ply)
    -- Net cooldown stuff.
    if(gHeroin.NetCooldown[ply:SteamID64()]) then
        if(gHeroin.NetCooldown[ply:SteamID64()] >= CurTime()) then
            gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].rateLimit)
            gHeroin.NetCooldown[ply:SteamID64()] = CurTime() + 0.5
            return
        end
    end
    gHeroin.NetCooldown[ply:SteamID64()] = CurTime() + 0.5

    -- Make sure they are actually allowed to remove NPCs.
    if(!gHeroin.Config.Toolgun.Groups[ply:GetUserGroup()]) then
        gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].noPermission)
        return
    end

    -- Get the ent, check it's valid and remove it.
    local ent = net.ReadEntity()
    if(!IsValid(ent)) then return end
    if(ent:GetClass() != "gheroin_npc") then return end
    local id = ent:GetSpawnID()

    gHeroin.DB.RemoveNPC(id)
    ent:Remove()

    gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].npcRemove)
    hook.Run("gheroin.hooks.npc.removenpc", ply)
end)

-- For placing the NPCs on server startup.
hook.Add("InitPostEntity", "gheroin.core.npcspawn", function()
    gHeroin.Core.Print("Creating NPCs.")
    -- Get all the NPC Positions.
    local npcs = gHeroin.DB.GetAllNPCPos()
    -- Make sure there is some set.
    if(npcs == nil) then
        gHeroin.Core.Print("You don't have any NPCs set. Go in-game and use the NPC Spawner tool to spawn some.")
        return
    end

    -- Loop through them and spawn them.
    for k,v in pairs(npcs) do
        local posTable = util.JSONToTable(v.pos)
        local angTable = util.JSONToTable(v.ang)
        local pos = Vector(posTable.x, posTable.y, posTable.z)
        local ang = Angle(angTable.p, angTable.y, angTable.r)

        local npc = ents.Create("gheroin_npc")
        npc:SetPos(pos)
        npc:SetAngles(ang)
        npc:SetSpawnID(v.id)
        npc:Spawn()
    end

    local npc = "npc"
    if(#npcs > 1) then npc = "npcs" end
    gHeroin.Core.Print("Successfully spawned " .. #npcs .. " " .. npc .. ".")
    hook.Run("gheroin.hooks.npc.initspawned")
end)

-- Selling heroin.
net.Receive("gheroin.core.attemptsell", function(len, ply)
    -- Net cooldown stuff.
    if(gHeroin.NetCooldown[ply:SteamID64()]) then
        if(gHeroin.NetCooldown[ply:SteamID64()] >= CurTime()) then
            gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].rateLimit)
            gHeroin.NetCooldown[ply:SteamID64()] = CurTime() + 0.5
            return
        end
    end
    gHeroin.NetCooldown[ply:SteamID64()] = CurTime() + 0.5

    local heroinAmount = ply:GetNWInt("gheroin.heroinstorage", 0)
    -- Check they've actually got heroin to sell.
    if(heroinAmount <= 0) then
        gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].npcNoHeroin)
        return
    end

    -- Pay them, send a message and clear their heroin.
    local payout = math.random(gHeroin.Config.NPC.MinPayout, gHeroin.Config.NPC.MaxPayout) * heroinAmount
    gHeroin.Core.Message(ply, string.format(gHeroin.Languages[gHeroin.Config.Language].npcSell, gHeroin.Config.Units.Currency .. string.Comma(payout)))
    ply:addMoney(payout)
    ply:SetNWInt("gheroin.heroinstorage", 0)

    hook.Run("gheroin.hooks.npc.sell", ply, payout, heroinAmount)
end)

-- Buying a syringe.
net.Receive("gheroin.core.attemptbuy", function(len, ply)
    -- Net cooldown stuff.
    if(gHeroin.NetCooldown[ply:SteamID64()]) then
        if(gHeroin.NetCooldown[ply:SteamID64()] >= CurTime()) then
            gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].rateLimit)
            gHeroin.NetCooldown[ply:SteamID64()] = CurTime() + 0.5
            return
        end
    end
    gHeroin.NetCooldown[ply:SteamID64()] = CurTime() + 0.5

    -- Check they have enough money for it.
    if(!ply:canAfford(gHeroin.Config.NPC.SyringeCost)) then
        gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].npcNoAfford)
        return
    end

    -- Check they don't already own one.
    if(ply:HasWeapon("gheroin_syringe")) then
        gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].npcAlreadyOwned)
        return
    end

    -- Give them the syringe.
    ply:addMoney(gHeroin.Config.NPC.SyringeCost * -1)
    ply:Give("gheroin_syringe")
    gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].npcBuy)
    hook.Run("gheroin.hooks.npc.buy", ply)
end)

-- Make players high.
function gHeroin.Core.MakeHigh(ply)
    -- Remove a heroin from their storage and then send the net message to high them. Fallback for GetNWInt is 1 becasuse from the checks made in the syringe code I already know they have atleast 1 unit of heroin.
    ply:SetNWInt("gheroin.heroinstorage", ply:GetNWInt("gheroin.heroinstorage", 1) - 1)
    net.Start("gheroin.core.highplayer")
    net.Send(ply)
end