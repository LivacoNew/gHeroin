include("shared.lua")

function ENT:Draw()
    self:DrawModel()
end

function ENT:DrawTranslucent()
    local distance = (LocalPlayer():GetShootPos() - self:GetPos()):Length()
    if(distance > gHeroin.Config.Distance3d2d) then return end

	local ang = Angle(0, LocalPlayer():EyeAngles().y - 90, -LocalPlayer():EyeAngles().p - 270)
    local pos = self:LocalToWorld(Vector(0, 0, 0)) + Vector(0, 0, 40)

    cam.Start3D2D(pos, ang, 0.1)

    local w,h = 250, 200
    local baseX,baseY = (w / 2) * -1,(h / 2) * -1

    draw.RoundedBox(0, baseX, baseY + (h * 0.1), w, h * 0.9, Color(50, 50, 50))
    draw.RoundedBox(10, baseX, baseY, w, h * 0.17, Color(25, 25, 25))
    draw.RoundedBox(0, baseX, baseY + (h * 0.09), w, h * 0.1, Color(25, 25, 25))
    draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].extractorName, "gheroin.fonts.entities.1", baseX + (w / 2), baseY + 1, Color(255, 255, 255), 1)

    if(self:GetLatex() <= 0) then
        draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].entStep, 1), "gheroin.fonts.entities.1", baseX + (w * 0.025), baseY + (h * 0.19), Color(255, 255, 255), 0)
        draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].extractorStep1, "gheroin.fonts.entities.2", baseX + (w * 0.025), baseY + (h * 0.35), Color(220, 220, 220), 0)
    else
        if(self:GetHeroin() >= gHeroin.Config.Extractor.MaxHeroin) then
            draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].extractorHeroin, "gheroin.fonts.entities.2", baseX + (w * 0.025), baseY + (h * 0.2), Color(220, 220, 220), 0)
        else
            draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].entStep, 2), "gheroin.fonts.entities.1", baseX + (w * 0.025), baseY + (h * 0.19), Color(255, 255, 255), 0)
            draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].extractorStep2, "gheroin.fonts.entities.2", baseX + (w * 0.025), baseY + (h * 0.35), Color(220, 220, 220), 0)
        end
    end

    draw.RoundedBox(0, baseX + (w * 0.025), baseY + (h * 0.61), w * 0.95, h * 0.15, Color(25, 25, 25))
    draw.RoundedBox(0, baseX + (w * 0.025), baseY + (h * 0.61), (self:GetLatex() / gHeroin.Config.Extractor.MaxLatex) * 237.5, h * 0.15, Color(75, 75, 75))
    draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].opiumLatexStored, self:GetLatex(), gHeroin.Config.Extractor.MaxLatex), "gheroin.fonts.entities.2", baseX + (w / 2), baseY + (h * 0.63), Color(220, 220, 220), 1)

    draw.RoundedBox(0, baseX + (w * 0.025), baseY + (h * 0.81), w * 0.95, h * 0.15, Color(25, 25, 25))
    draw.RoundedBox(0, baseX + (w * 0.025), baseY + (h * 0.81), (self:GetHeroin() / gHeroin.Config.Extractor.MaxHeroin) * 237.5, h * 0.15, Color(100, 76, 34))
    draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].heroinStored, self:GetHeroin(), gHeroin.Config.Extractor.MaxHeroin), "gheroin.fonts.entities.2", baseX + (w / 2), baseY + (h * 0.83), Color(220, 220, 220), 1)

    cam.End3D2D()
end