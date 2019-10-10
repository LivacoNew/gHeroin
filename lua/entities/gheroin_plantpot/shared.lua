ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Plant Pot"
ENT.Category = "gHeroin"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Step")
    self:NetworkVar("Int", 1, "LightStatus")
    self:NetworkVar("Int", 2, "TotalOpium")
    self:NetworkVar("Float", 0, "Light")
    self:NetworkVar("Float", 1, "GrowLevel")
end