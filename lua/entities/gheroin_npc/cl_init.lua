include("shared.lua")

function ENT:Initialize()
    self.AutomaticFrameAdvance = true
end

function ENT:Draw()
    self:DrawModel()
end

function ENT:DrawTranslucent()
    local distance = (LocalPlayer():GetShootPos() - self:GetPos()):Length()
    if(distance > gHeroin.Config.Distance3d2d) then return end

    local ang = self:GetAngles()
    if(gHeroin.Config.NPC.Stare) then
        ang =Angle(0, LocalPlayer():EyeAngles().y - 90, -LocalPlayer():EyeAngles().p - 270)
    else
        ang:RotateAroundAxis(self:GetUp(), 90)
        ang:RotateAroundAxis(self:GetRight(), -90)
    end
	local pos = self:LocalToWorld(Vector(0, 0, 0)) + Vector(0, 0, 80)

    surface.SetFont("gheroin.fonts.entities.4")
    local length = surface.GetTextSize(gHeroin.Languages[gHeroin.Config.Language].npc3D2D) + 40

	cam.Start3D2D(pos, ang, 0.1)

    draw.RoundedBox(0, (length / 2) * -1, -10, length, 60, Color(25, 25, 25))
    draw.RoundedBox(0, (length / 2) * -1, -10, length, 5, Color(15, 15, 15))
    draw.NoTexture()
    surface.SetDrawColor(25, 25, 25)
    surface.DrawTexturedRectRotated(0, 30, 50, 50, 45)

    draw.SimpleText(gHeroin.Languages[gHeroin.Config.Language].npc3D2D, "gheroin.fonts.entities.4", 0, -5, Color(255, 255, 255), 1, 0)

	cam.End3D2D()
end