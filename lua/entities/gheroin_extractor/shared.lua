ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Extractor"
ENT.Category = "gHeroin"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "owning_ent")
    self:NetworkVar("Bool", 0, "Active")
    self:NetworkVar("Int", 0, "Time")
end
