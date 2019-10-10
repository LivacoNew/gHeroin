AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	-- Standard crap.
	self:SetModel("models/livaco/gheroin/livaco_morphine.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetUseType(SIMPLE_USE)

	-- Health Var, Keeps track of the health the entity has.
	self.health = gHeroin.Config.Entities.EntityHealth["morphine"]
end

-- Health stuff.
function ENT:OnTakeDamage(x)
	self.health = self.health - x:GetDamage()
	if(self.health <= 0) then
		self:Remove()
	end
end

function ENT:StartTouch(ent)
	-- If it's a barrel.
	if(ent:GetClass() == "gheroin_barrel") then
		-- If it already has Morphine or not ready, stop.
		if(ent:HasIngredient("morphine") == true) then return end
		if(ent:ReadyForIngredient("morphine") == false) then return end
		-- Register that it has Morphine in it, and remove the ent.
		ent:AddIngredient("morphine")
		self:Remove()
	end
end