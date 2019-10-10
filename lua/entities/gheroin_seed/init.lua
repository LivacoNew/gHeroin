include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- Boring initial stuff.
function ENT:Initialize()
    self:SetModel("models/props_combine/breenglobe.mdl")

    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	if self:GetPhysicsObject():IsValid() then
		self:GetPhysicsObject():Wake()
	end

    self:SetUseType(SIMPLE_USE)
end

-- Give a pot seeds when touched.
function ENT:StartTouch(ent)
    -- Check the class.
    if(ent:GetClass() != "gheroin_plantpot") then return end
    -- Check it actually needs a seed.
    if(ent:GetStep() != 0) then return end
    -- Give it a seed.
    ent:GiveSeeds()
    self:Remove()
end