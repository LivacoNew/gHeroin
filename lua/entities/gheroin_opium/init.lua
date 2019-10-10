include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- Boring initial stuff.
function ENT:Initialize()
    self:SetModel("models/props_c17/playgroundTick-tack-toe_block01a.mdl")

    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	if self:GetPhysicsObject():IsValid() then
		self:GetPhysicsObject():Wake()
	end

    self:SetUseType(SIMPLE_USE)
end

-- Store itself in the Cutting table.
function ENT:StartTouch(ent)
    -- Check the class.
    if(ent:GetClass() != "gheroin_crusher") then return end

    -- Make sure we aren't at the max.
    if(ent:GetOpium() >= gHeroin.Config.Crusher.MaxOpium) then return end

    -- Add itself and remove the entity.
    ent:AddOpium()
    self:Remove()
end