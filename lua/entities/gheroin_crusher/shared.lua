ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Crusher"
ENT.Category = "gHeroin"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Opium")
    self:NetworkVar("Int", 1, "TimeLeft")
    self:NetworkVar("Int", 2, "Latex")
end