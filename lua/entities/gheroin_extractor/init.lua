AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	-- Standard crap.
	self:SetModel("models/livaco/gheroin/livaco_extractor.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
	self:SetUseType(SIMPLE_USE)

	-- Init the extractor time.
	self.time = 0
	-- Health Var, Keeps track of the health the entity has.
	self.health = gHeroin.Config.Entities.EntityHealth["extractor"]
end

-- Health stuff.
function ENT:OnTakeDamage(x)
	self.health = self.health - x:GetDamage()
	if(self.health <= 0) then
		self:Remove()
	end
end

function ENT:Think()
	if(!self:GetActive()) then return end

	-- Check if time's up.
	if(self.time <= CurTime()) then
		-- Reset and give the player morphine.
		self.time = 0
		self:SetActive(false)
		local morphineEnt = ents.Create("gheroin_morphine")
		morphineEnt:SetPos(self:GetPos() + (self:GetForward() * 20) + (self:GetUp() * 10))
		morphineEnt:Spawn()
		morphineEnt:CPPISetOwner(self:Getowning_ent())
	end
end

function ENT:StartExtracting()
	-- Don't start extracting twice.
	if(self:GetActive() == true) then return end
	-- Start extracting.
	self:SetActive(true)
	self.time = CurTime() + gHeroin.Config.Entities.ExtractorTime
end