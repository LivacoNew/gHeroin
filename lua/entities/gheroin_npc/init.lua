AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    -- CONFIG_EDIT
    self:SetModel(gHeroin.Config.NPC.Model)
    self:SetHullType(HULL_HUMAN)
    self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
    self:SetTrigger(true)

    self:SetUseType(SIMPLE_USE)
end

-- Use the NPC.
function ENT:Use(ply)
    -- Check if the player is a CP.
    if(gHeroin.Config.NPC.CheckCP) then
        if(gHeroin.Config.NPC.CPJobs[ply:Team()] || ply:isCP()) then
            gHeroin.Core.Message(ply, gHeroin.Languages[gHeroin.Config.Language].npcCP)
            return
        end
    end

    -- Open UI.
    net.Start("gheroin.core.npcui")
    net.Send(ply)

    hook.Run("gheroin.hooks.npc.open", ply)
end