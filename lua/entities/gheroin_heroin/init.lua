AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	-- Standard crap.
	self:SetModel("models/livaco/gheroin/livaco_heroin.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetUseType(SIMPLE_USE)

	-- Health Var, Keeps track of the health the entity has.
	self.health = gHeroin.Config.Entities.EntityHealth["heroin"]
	-- Amount of heroin stored.
	self:SetAmount(math.random(gHeroin.Config.Entities.HeroinMin, gHeroin.Config.Entities.HeroinMax))
end

-- Health stuff.
function ENT:OnTakeDamage(x)
	self.health = self.health - x:GetDamage()
	if(self.health <= 0) then
		self:Remove()
	end
end

function ENT:StartTouch(ent)
	-- If it's a package.
	if(ent:GetClass() == "gheroin_package") then
		-- Check that adding it wouldn't go over the limit, and if it does don't add it.
		if(ent:GetStoredHeroin() + self:GetAmount() > gHeroin.Config.Entities.MaxHeroin) then return end
		-- Otherwise, add the heroin to the package and remove it.
		ent:SetStoredHeroin(ent:GetStoredHeroin() + self:GetAmount())
		self:Remove()
	end
end

function ENT:Use(ply)
	-- Ensure it's a player.
    if(!ply:IsValid() || ply:IsBot() || !ply:IsPlayer()) then return end

	-- Send net message and make the player high.
	net.Start("gheroin.core.high")
	net.Send(ply)

	-- Check if the amount of heroin is 1 gram or less.
	if(self:GetAmount() <= 1) then
		-- Remove the entity, as there's nothing left inside the packet.
		self:Remove()
	end
	-- Remove 1g of heroin.
	self:SetAmount(self:GetAmount() - 1)
end