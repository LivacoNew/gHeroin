include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- Boring initial stuff.
function ENT:Initialize()
    self:SetModel("models/livaco/gheroin/livaco_bucket.mdl")

    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	if self:GetPhysicsObject():IsValid() then
		self:GetPhysicsObject():Wake()
	end

    self:SetUseType(SIMPLE_USE)
    self:SetLatex(0)
    self:SetBodygroup(1, 0)
end

-- Touch the Cutting Table and get the latex, as well as touch the Extractor and extract the Morphine.
function ENT:StartTouch(ent)
    -- Check which one it is.
    if(ent:GetClass() == "gheroin_table") then
        -- Check the bucket is not full, and make sure the table has something to give us.
        if(ent:GetLatex() <= 0) then return end
        if(self:GetLatex() >= gHeroin.Config.Misc.BucketMaxLatex) then return end
        -- Get all the latex it can into the bucket.
        if(ent:GetLatex() <= gHeroin.Config.Misc.BucketMaxLatex) then
            self:SetLatex(self:GetLatex() + ent:GetLatex())
            ent:SetLatex(0)
        else
            self:SetLatex(gHeroin.Config.Misc.BucketMaxLatex)
            ent:SetLatex(ent:GetLatex() - gHeroin.Config.Misc.BucketMaxLatex)
        end
        -- Set the bodygroup.
        self:SetBodygroup(1, 1)
    end

    if(ent:GetClass() == "gheroin_extractor") then
        if(ent:GetLatex() >= gHeroin.Config.Extractor.MaxLatex) then return end

        -- Give it all the latex it can handle. ent:GiveLatex() handles the calculation.
        local keepAmount = ent:GiveLatex(self:GetLatex())
        self:SetLatex(keepAmount)
        if(self:GetLatex() <= 0) then
            self:SetBodygroup(1, 0)
        end
    end
end