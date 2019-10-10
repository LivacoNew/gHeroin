include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- Boring initial stuff.
function ENT:Initialize()
    self:SetModel("models/livaco/gheroin/livaco_lamp.mdl")

    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	if self:GetPhysicsObject():IsValid() then
		self:GetPhysicsObject():Wake()
	end

    self:SetUseType(SIMPLE_USE)

    -- Set the variables.
    self:SetActive(false)
    self:SetPower(gHeroin.Config.Misc.LampMaxPower)
end

-- Toggle the light.
function ENT:Use()
    -- Check it's not out of power first.
    if(self:GetPower() <= 0) then return end
    -- Toggle.
    self:SetActive(!self:GetActive())
end

-- Increase the light of a plant pot when staring at it.
function ENT:Think()
    -- Make sure it's active.
    if(self:GetActive() != true) then return end

    -- Find all entities in a cone, and check their class for if it's a plant pot.
    local ents = ents.FindInCone(self:GetPos(), self:GetUp() * -1, 70, math.cos(math.rad(90)))
    for k,v in pairs(ents) do
        if(v:GetClass() != "gheroin_plantpot") then continue end
        -- If it's a plant pot, call it's IncreaseLight function. No Prizes for guessing what it does.
        v:IncreaseLight()
    end

    -- If the power is at nothing.
    if(self:GetPower() <= 0) then
        -- Turn off the light, and make sure power doesn't go underneath 0 (for 3d2d)
        self:SetActive(false)
        self:SetPower(0)
        return
    end
    -- Otherwise, decrease the power as normal.
    self:SetPower(self:GetPower() - gHeroin.Config.Plant.LampPowerRate)
end
