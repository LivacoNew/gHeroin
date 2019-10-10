ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Mixer"
ENT.Category = "gHeroin"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Step")
end