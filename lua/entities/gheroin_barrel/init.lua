AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	-- Standard crap.
	self:SetModel("models/livaco/gheroin/livaco_barrel.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetUseType(SIMPLE_USE)

	-- Init of the vars that keep track of what's inside and what stage it's in.
	self.hasMorphine = false
	self.hasAcetic = false
	self.hasSodium = false

	-- Health Var, Keeps track of the health the entity has.
	self.health = gHeroin.Config.Entities.EntityHealth["barrel"]
	-- Track the steps.
	self:SetStep(1)
	-- Timer for dissolving
	self.timer = 0
end

-- Health stuff.
function ENT:OnTakeDamage(x)
	self.health = self.health - x:GetDamage()
	if(self.health <= 0) then
		self:Remove()
	end
end

-- Returns if it has the ingedient specified in it.
function ENT:HasIngredient(ingredient)
	if(ingredient == "morphine") then
		return self.hasMorphine
	end
	if(ingredient == "acetic") then
		return self.hasAcetic
	end
	if(ingredient == "sodium") then
		return self.hasSodium
	end
end

-- Returns if it's ready for a ingredient specified.
function ENT:ReadyForIngredient(ingredient)
	if(self:GetStep() == 4) then return false end
	if(ingredient == "morphine") then
		return !self.hasMorphine
	end
	if(ingredient == "acetic") then
		return self.hasMorphine
	end
	if(ingredient == "sodium") then
		return self.hasAcetic
	end
	return false
end

-- Adds an ingredient to the barrel.
function ENT:AddIngredient(ingredient)
	if(ingredient == "morphine") then
		self.hasMorphine = true
		self:SetStep(2)
	end
	if(ingredient == "acetic") then
		self.hasAcetic = true
		self:SetStep(3)
	end
	if(ingredient == "sodium") then
		self.hasSodium = true
		self:SetStep(4)
		-- Sodiums the final ingredient, so once it gets added, set the timer to dissolve.
		self.timer = gHeroin.Config.Entities.IngredientDissolveTime + CurTime()
	end
end

function ENT:Think()
	-- If it is in the final step, and the time for dissolving is up.
	if(self:GetStep() == 4 && self.timer <= CurTime()) then
		-- Reset the timer, remove all ingredients, and finally spawn Heroin Base.
		self.timer = 0

		self.hasMorphine = false
		self.hasAcetic = false
		self.hasSodium = false
		self:SetStep(1)

		local heroinBase = ents.Create("gheroin_hbase")
		heroinBase:SetPos(self:GetPos() + (self:GetForward() * 25) + (self:GetUp() * 10))
		heroinBase:Spawn()
	end
end