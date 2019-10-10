include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- Boring initial stuff.
function ENT:Initialize()
    self:SetModel("models/props_c17/pulleywheels_small01.mdl")

    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	if self:GetPhysicsObject():IsValid() then
		self:GetPhysicsObject():Wake()
	end

    self:SetUseType(SIMPLE_USE)
    self:SetAmount(0)
end

-- Let the player pickup the heroin.
function ENT:Use(ply)
    ply:SetNWInt("gheroin.heroinstorage", ply:GetNWInt("gheroin.heroinstorage") + self:GetAmount())
    self:Remove()
end