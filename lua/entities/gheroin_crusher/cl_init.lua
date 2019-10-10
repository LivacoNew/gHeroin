include("shared.lua")

function ENT:Draw()
    self:DrawModel()
end

function ENT:DrawTranslucent()
    local distance = (LocalPlayer():GetShootPos() - self:GetPos()):Length()
    if(distance > gHeroin.Config.Distance3d2d) then return end

	local ang = Angle(0, LocalPlayer():EyeAngles().y - 90, -LocalPlayer():EyeAngles().p - 270)
    local pos = self:LocalToWorld(Vector(0, 0, 0)) + Vector(0, 0, 50)

    cam.Start3D2D(pos, ang, 0.1)

    local w,h = 250, 200
    local baseX = (w / 2) * -1

    draw.RoundedBox(0, baseX, h * 0.1, w, h * 0.9, Color(50, 50, 50))
    draw.RoundedBox(10, baseX, 0, w, h * 0.17, Color(25, 25, 25))
    draw.RoundedBox(0, baseX, h * 0.09, w, h * 0.1, Color(25, 25, 25))
    draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].crusherName, "gheroin.fonts.entities.1", baseX + (w / 2), h * 0.0, Color(255, 255, 255), 1)

    --draw.SimpleText("Stored Opium: " .. self:GetOpium() .. " / " .. gHeroin.Config.Table.MaxOpium, "gheroin.fonts.entities.2", baseX + (w * 0.025), h * 0.2, Color(220, 220, 220), 0, 0)

    if(self:GetOpium() <= 0) then
        draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].entStep, 1), "gheroin.fonts.entities.1", baseX + (w * 0.025), h * 0.19, Color(255, 255, 255), 0)
        draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].crusherStep1, "gheroin.fonts.entities.2", baseX + (w * 0.025), h * 0.36, Color(220, 220, 220), 0)
    else
        if(self:GetLatex() >= gHeroin.Config.Crusher.MaxLatex) then
            draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].cruserLatex, "gheroin.fonts.entities.2", baseX + (w * 0.025), h * 0.2, Color(220, 220, 220), 0)
        else
            draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].entStep, 2), "gheroin.fonts.entities.1", baseX + (w * 0.025), h * 0.19, Color(255, 255, 255), 0)
            draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].crusherStep2, self:GetTimeLeft()), "gheroin.fonts.entities.2", baseX + (w * 0.025), h * 0.375, Color(220, 220, 220), 0)
        end
    end

    draw.RoundedBox(0, baseX + (w * 0.025), h * 0.62, w * 0.95, h * 0.15, Color(25, 25, 25))
    draw.RoundedBox(0, baseX + (w * 0.025), h * 0.62, (self:GetOpium() / gHeroin.Config.Crusher.MaxOpium) * 237.5, h * 0.15, Color(100, 100, 100))
    draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].opiumStored, self:GetOpium(), gHeroin.Config.Crusher.MaxOpium), "gheroin.fonts.entities.2", baseX + (w / 2), h * 0.645, Color(220, 220, 220), 1)

    draw.RoundedBox(0, baseX + (w * 0.025), h * 0.81, w * 0.95, h * 0.15, Color(25, 25, 25))
    draw.RoundedBox(0, baseX + (w * 0.025), h * 0.81, (self:GetLatex() / gHeroin.Config.Crusher.MaxLatex) * 237.5, h * 0.15, Color(35, 35, 255))
    draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].opiumLatexStored, self:GetLatex(), gHeroin.Config.Crusher.MaxLatex), "gheroin.fonts.entities.2", baseX + (w / 2), h * 0.83, Color(220, 220, 220), 1)

    cam.End3D2D()
end