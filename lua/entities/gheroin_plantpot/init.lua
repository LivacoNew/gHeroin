include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- Boring initial stuff.
function ENT:Initialize()
    self:SetModel("models/props_c17/metalpot001a.mdl")

    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	if self:GetPhysicsObject():IsValid() then
		self:GetPhysicsObject():Wake()
	end

    self:SetUseType(SIMPLE_USE)

    self:SetStep(0) -- 0 - Give Seeds \ 1 - Growing \ 2 - Harvest
    self:SetLightStatus(0) -- 0 - No light \ 1 - Not enough light \ 2 - Enough \ 3 - Too much
    self.lightLevel = 0
    self:SetGrowLevel(0)
    self:SetTotalOpium(0)
end

-- TODO: Bodygroups.

-- Give the pot seeds.
function ENT:GiveSeeds()
    self:SetStep(1)
end

-- Increase light levels.
function ENT:IncreaseLight()
    if(self.lightLevel >= 100) then return end
    self.lightLevel = self.lightLevel + 1
end

-- Logic.
function ENT:Think()
    if(self:GetStep() == 1) then
        -- Determine whether the plant is getting too much/not enough/enough light.
        local lightPercent = self.lightLevel / 100
        self:SetLight(lightPercent)

        if(lightPercent <= 0) then
            self:SetLightStatus(0)
        else
            if(lightPercent < gHeroin.Config.Plant.NotEnoughLight) then
                self:SetLightStatus(1)
            end
            if(lightPercent > gHeroin.Config.Plant.TooMuchLight) then
                self:SetLightStatus(3)
            end
            if(lightPercent < gHeroin.Config.Plant.TooMuchLight && lightPercent > gHeroin.Config.Plant.NotEnoughLight) then
                self:SetLightStatus(2)
            end
            self.lightLevel = self.lightLevel - 0.5
        end

        -- Grow the plant.

        -- Check the plant is getting enough light.
        if(self:GetLightStatus() != 2) then return end
        -- + on the grow level.
        self:SetGrowLevel(self:GetGrowLevel() + gHeroin.Config.Plant.GrowRate)

        -- Check if it's now fully grown.
        if(self:GetGrowLevel() >= 100) then
            self:SetStep(2)
            self:SetTotalOpium(math.random(gHeroin.Config.Plant.MinOpium, gHeroin.Config.Plant.MaxOpium))
        end
    end
end

-- Harvesting.
function ENT:Use(ply)
    -- Check it's in the final step.
    if(self:GetStep() != 2) then return end

    -- Give them opium.
    local opium = ents.Create("gheroin_opium")
    opium:SetPos(self:GetPos() + (self:GetForward() * 20))
    opium:CPPISetOwner(ply)
    opium:Spawn()

    -- Move the opium counter down, unless that was the last one left. In that case, reset it.
    if(self:GetTotalOpium() == 1) then
        self:SetStep(0) -- 0 - Give Seeds \ 1 - Growing \ 2 - Harvest
        self:SetLightStatus(0) -- 0 - No light \ 1 - Not enough light \ 2 - Enough \ 3 - Too much
        self.lightLevel = 0
        self:SetGrowLevel(0)
        self:SetTotalOpium(0)
    end
    self:SetTotalOpium(self:GetTotalOpium() - 1)
end