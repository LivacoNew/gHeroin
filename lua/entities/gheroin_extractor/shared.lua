ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Extractor"
ENT.Category = "gHeroin"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "owning_ent")
    self:NetworkVar("Int", 0, "Power")
    self:NetworkVar("Int", 1, "Latex")
    self:NetworkVar("Int", 2, "Time")
    self:NetworkVar("Int", 3, "Heroin")
    self:NetworkVar("Bool", 0, "Active")
end