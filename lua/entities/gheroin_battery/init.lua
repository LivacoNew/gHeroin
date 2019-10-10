include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- Boring initial stuff.
function ENT:Initialize()
    self:SetModel("models/livaco/gheroin/livaco_battery.mdl")

    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	if self:GetPhysicsObject():IsValid() then
		self:GetPhysicsObject():Wake()
	end

    self:SetUseType(SIMPLE_USE)
end

-- Replenish power in the lamp.
function ENT:StartTouch(ent)
    if(ent:GetClass() != "gheroin_lamp") then return end

    ent:SetPower(gHeroin.Config.Misc.LampMaxPower)
    self:Remove()
end