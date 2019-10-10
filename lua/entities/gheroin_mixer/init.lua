AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	-- Standard crap.
	self:SetModel("models/livaco/gheroin/livaco_mixer.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetUseType(SIMPLE_USE)

	-- Health Var, Keeps track of the health the entity has.
	self.health = gHeroin.Config.Entities.EntityHealth["mixer"]
	-- Ingredients inserted.
	self.hasHeroin = false
	self.hasAcid = false
	self.hasAmmonia = false
	-- Timer
	self.timer = 0
	-- Step
	self:SetStep(1)
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
	if(ingredient == "heroin") then
		return self.hasHeroin
	end
	if(ingredient == "acid") then
		return self.hasAcid
	end
	if(ingredient == "ammonia") then
		return self.hasAmmonia
	end
end

-- Returns if it's ready for a ingredient specified.
function ENT:ReadyForIngredient(ingredient)
	if(self:GetStep() == 4) then return false end
	if(ingredient == "heroin") then
		return !self.hasHeroin
	end
	if(ingredient == "acid") then
		return self.hasHeroin
	end
	if(ingredient == "ammonia") then
		return self.hasAcid
	end
	return false
end

-- Adds an ingredient to the barrel.
function ENT:AddIngredient(ingredient)
	if(ingredient == "heroin") then
		self.hasHeroin = true
		self:SetStep(2)
	end
	if(ingredient == "acid") then
		self.hasAcid = true
		self:SetStep(3)
	end
	if(ingredient == "ammonia") then
		self.hasAmmonia = true
		self:SetStep(4)
		self.timer = gHeroin.Config.Entities.IngredientMixTime + CurTime()
	end
end

function ENT:Think()
	-- If it is in the final step, and the time for dissolving is up.
	if(self:GetStep() == 4 && self.timer <= CurTime()) then
		-- Reset the timer, remove all ingredients, and finally give the player that sweet sweet Heroin.
		self.timer = 0

		self.hasHeroin = false
		self.hasAcid = false
		self.hasAmmonia = false
		self:SetStep(1)

		local heroinEnt = ents.Create("gheroin_heroin")
		heroinEnt:SetPos(self:GetPos() + (self:GetForward() * 20) + (self:GetUp() * 10))
		heroinEnt:Spawn()
	end
end