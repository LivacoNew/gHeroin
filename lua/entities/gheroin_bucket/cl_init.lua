include("shared.lua")

function ENT:Draw()
    self:DrawModel()
end

function ENT:DrawTranslucent()
    local distance = (LocalPlayer():GetShootPos() - self:GetPos()):Length()
    if(distance > gHeroin.Config.Distance3d2d) then return end

	local ang = Angle(0, LocalPlayer():EyeAngles().y - 90, -LocalPlayer():EyeAngles().p - 270)
    local pos = self:LocalToWorld(Vector(0, 0, 0)) + Vector(0, 0, 22)

    cam.Start3D2D(pos, ang, 0.1)

    local w,h = 250,70
    local baseX,baseY = (w / 2) * -1,(h / 2) * -1

    draw.RoundedBox(0, baseX, baseY + (h * 0.1), w, h * 0.9, Color(50, 50, 50))
    draw.RoundedBox(10, baseX, baseY, w, h * 0.3, Color(25, 25, 25))
    draw.RoundedBox(0, baseX, baseY + (h * 0.09), w, h * 0.4, Color(25, 25, 25))
    draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].bucketName, "gheroin.fonts.entities.1", baseX + (w / 2), baseY - 1, Color(255, 255, 255), 1)

    draw.RoundedBox(0, baseX + (w * 0.025), baseY + (h * 0.575), w * 0.95, h * 0.325, Color(25, 25, 25))
    draw.RoundedBox(0, baseX + (w * 0.025), baseY + (h * 0.575), (self:GetLatex() / gHeroin.Config.Misc.BucketMaxLatex) * 238, h * 0.325, Color(35, 35, 255))

    draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].opiumLatexStored, math.floor(self:GetLatex()), gHeroin.Config.Misc.BucketMaxLatex), "gheroin.fonts.entities.2", baseX + (w / 2), baseY + (h * 0.5725), Color(220, 220, 220), 1)

    cam.End3D2D()
end