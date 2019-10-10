AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	-- Standard crap.
	self:SetModel("models/livaco/gheroin/livaco_bottle.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetUseType(SIMPLE_USE)

	-- Health Var, Keeps track of the health the entity has.
	self.health = gHeroin.Config.Entities.EntityHealth["heroinBase"]
end

-- Health stuff.
function ENT:OnTakeDamage(x)
	self.health = self.health - x:GetDamage()
	if(self.health <= 0) then
		self:Remove()
	end
end

function ENT:StartTouch(ent)
    -- If it's the mixer.
	if(ent:GetClass() == "gheroin_mixer") then
		-- If it already has Heroin or not ready, stop.
		if(ent:HasIngredient("heroin") == true) then return end
		if(ent:ReadyForIngredient("heroin") == false) then return end
		-- Register that it has Heroin in it, and remove the ent.
		ent:AddIngredient("heroin")
		self:Remove()
	end
end