include("shared.lua")

function ENT:Draw()
    self:DrawModel()
end

function ENT:DrawTranslucent()
    local distance = (LocalPlayer():GetShootPos() - self:GetPos()):Length()
    if(distance > gHeroin.Config.Distance3d2d) then return end

	local ang = Angle(0, LocalPlayer():EyeAngles().y - 90, -LocalPlayer():EyeAngles().p - 270)
    local pos = self:LocalToWorld(Vector(0, 0, 0)) + Vector(0, 0, 5)

    cam.Start3D2D(pos, ang, 0.1)

    local baseX = 100
    local w,h = 250,70

    draw.RoundedBox(0, baseX, h * 0.1, w, h * 0.9, Color(50, 50, 50))
    draw.RoundedBox(10, baseX, 0, w, h * 0.3, Color(25, 25, 25))
    draw.RoundedBox(0, baseX, h * 0.09, w, h * 0.4, Color(25, 25, 25))
    draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].heroinName, "gheroin.fonts.entities.1", baseX + (w / 2), -1.5, Color(255, 255, 255), 1)

    draw.RoundedBox(0, baseX + (w * 0.025), h * 0.61, w * 0.95, h * 0.275, Color(25, 25, 25))
    draw.RoundedBox(0, baseX + (w * 0.025), h * 0.61, (self:GetAmount() / gHeroin.Config.Misc.MaxHeroin) * 237.5, h * 0.275, Color(35, 35, 255))
    draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].heroinStored, string.Comma(self:GetAmount()) .. gHeroin.Config.Units.HeroinUnits, gHeroin.Config.Misc.MaxHeroin .. gHeroin.Config.Units.HeroinUnits), "gheroin.fonts.entities.2", baseX + (w / 2), h * 0.6, Color(220, 220, 220), 1)

    cam.End3D2D()
end