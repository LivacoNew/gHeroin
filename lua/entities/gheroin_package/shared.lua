ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Package"
ENT.Category = "gHeroin"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar("Float", 0, "StoredHeroin")
end