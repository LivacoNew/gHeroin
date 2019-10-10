include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- Boring initial stuff.
function ENT:Initialize()
    self:SetModel("models/props_lab/monitor02.mdl")

    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	if self:GetPhysicsObject():IsValid() then
		self:GetPhysicsObject():Wake()
	end

    self:SetUseType(SIMPLE_USE)

    self:SetPower(100)
    self:SetLatex(0)
    self:SetHeroin(0)
    self:SetTime(0)
    self:SetActive(false)
end

-- Add latex to the extractor.
function ENT:GiveLatex(amount)
    -- Make sure it's not full already.
    if(self:GetLatex() >= gHeroin.Config.Extractor.MaxLatex) then return end

    -- Set the timer.
    self:SetTime(gHeroin.Config.Extractor.TimePerLatex + CurTime())
    -- If adding the latex bypasses the max.
    if(self:GetLatex() + amount > gHeroin.Config.Extractor.MaxLatex) then
        -- Figure out the diference and add that instead.
        self:SetLatex(self:GetLatex() + ((amount - gHeroin.Config.Extractor.MaxLatex) * -1))
        return (amount - gHeroin.Config.Extractor.MaxLatex) * -1
    end
    -- Just add it regularly.
    self:SetLatex(self:GetLatex() + amount)
    return 0
end

-- Logic.
function ENT:Think()
    -- Make sure it's got latex and is not full of heroin.
    if(self:GetLatex() <= 0) then return end
    if(self:GetHeroin() >= gHeroin.Config.Extractor.MaxHeroin) then return end

    -- If time is up.
    if(self:GetTime() <= CurTime()) then
        -- Remove the current latex it was working on, add heroin and reset the timer.
        self:SetLatex(self:GetLatex() - 1)
        self:SetHeroin(self:GetHeroin() + math.random(gHeroin.Config.Extractor.HeroinMin, gHeroin.Config.Extractor.HeroinMax))
        if(self:GetHeroin() > gHeroin.Config.Extractor.MaxHeroin) then
            self:SetHeroin(gHeroin.Config.Extractor.MaxHeroin)
        end
        self:SetTime(gHeroin.Config.Extractor.TimePerLatex + CurTime())
    end
end

-- Empty Heroin.
function ENT:Use()
    -- Check it's not empty.
    if(self:GetHeroin() <= 0) then return end
    -- Empty out what you can into the bag.
    local ent = ents.Create("gheroin_heroin")
    ent:SetPos(self:GetPos() + (self:GetForward() * 20) + (self:GetUp() * 10))
    ent:CPPISetOwner(self:Getowning_ent())
    ent:Spawn()
    local amount = math.min(self:GetHeroin(), gHeroin.Config.Misc.MaxHeroin)
    ent:SetAmount(amount)
    self:SetHeroin(self:GetHeroin() - amount)
end