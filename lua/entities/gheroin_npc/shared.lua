ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.PrintName = "Heroin Addict"
ENT.Category = "gHeroin"
ENT.AutomaticFrameAdvance = true
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Spawnable = true
ENT.AdminOnly = true

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "SpawnID")
end