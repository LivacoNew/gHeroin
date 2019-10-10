include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- Boring initial stuff.
function ENT:Initialize()
    self:SetModel("models/props_c17/FurnitureTable002a.mdl")

    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	if self:GetPhysicsObject():IsValid() then
		self:GetPhysicsObject():Wake()
	end

    self:SetUseType(SIMPLE_USE)

    self:SetOpium(0)
    self:SetLatex(0)
    self:SetTimeLeft(0)
end

-- Add opium to the table.
function ENT:AddOpium()
    if(self:GetOpium() == gHeroin.Config.Crusher.MaxOpium) then return end
    self:SetOpium(self:GetOpium() + 1)

    -- If that was the first, begin the cutting process.
    if(self:GetOpium() == 1) then
        self:SetTimeLeft(CurTime() + gHeroin.Config.Crusher.Time)
    end
end

-- Time Logic
function ENT:Think()
    if(self:GetOpium() <= 0) then return end
    if(self:GetTimeLeft() <= 0) then return end

    if(self:GetTimeLeft() <= CurTime()) then
        if(self:GetOpium() > 0) then
            self:SetOpium(self:GetOpium() - 1)
        end

        self:SetLatex(self:GetLatex() + math.random(gHeroin.Config.Crusher.LatexMin, gHeroin.Config.Crusher.LatexMax))
        if(self:GetLatex() > gHeroin.Config.Crusher.MaxLatex) then
            self:SetLatex(gHeroin.Config.Crusher.MaxLatex)
        end

        if(self:GetOpium() > 0) then
            self:SetTimeLeft(CurTime() + gHeroin.Config.Crusher.Time)
            return
        end
        self:SetTimeLeft(0)
    end
end