include("shared.lua")

function ENT:Draw()
    self:DrawModel()
end

function ENT:DrawTranslucent()
    local distance = (LocalPlayer():GetShootPos() - self:GetPos()):Length()
    if(distance > gHeroin.Config.Distance3d2d) then return end

	local ang = Angle(0, LocalPlayer():EyeAngles().y - 90, -LocalPlayer():EyeAngles().p - 270)
    local pos = self:LocalToWorld(Vector(0, 0, 0)) + Vector(0, 0, 12.5)

    cam.Start3D2D(pos, ang, 0.1)

    local baseX = 100
    local w,h = 250, 160

    draw.RoundedBox(0, baseX, h * 0.1, w, h * 0.9, Color(50, 50, 50))
    draw.RoundedBox(10, baseX, 0, w, h * 0.17, Color(25, 25, 25))
    draw.RoundedBox(0, baseX, h * 0.09, w, h * 0.15, Color(25, 25, 25))
    draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].plantPotName, "gheroin.fonts.entities.1", baseX + (w / 2), h * 0.01, Color(255, 255, 255), 1)

    -- Insert seeds.
    if(self:GetStep() == 0) then
        draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].entStep, 1), "gheroin.fonts.entities.1", baseX + (w * 0.025), h * 0.24, Color(255, 255, 255), 0)
        draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].potStep1, "gheroin.fonts.entities.2", baseX + (w * 0.025), h * 0.475, Color(220, 220, 220), 0)
    end

    -- Growing.
    if(self:GetStep() == 1) then
        draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].entStep, 2), "gheroin.fonts.entities.1", baseX + (w * 0.025), h * 0.24, Color(255, 255, 255), 0)
        draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].potStep2, "gheroin.fonts.entities.2", baseX + (w * 0.025), h * 0.44, Color(220, 220, 220), 0)

        draw.RoundedBox(0, baseX + (w * 0.025), h * 0.6, w * 0.95, h * 0.15, Color(25, 25, 25))
        draw.RoundedBox(0, baseX + (w * 0.025), h * 0.6, self:GetLight() * 238, h * 0.15, Color(75, 75, 75))
        draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].potLightLevel[self:GetLightStatus()], "gheroin.fonts.entities.2", baseX + (w / 2), h * 0.61, Color(220, 220, 220), 1)


        draw.RoundedBox(0, baseX + (w * 0.025), h * 0.8, w * 0.95, h * 0.15, Color(25, 25, 25))
        draw.RoundedBox(0, baseX + (w * 0.025), h * 0.8, self:GetGrowLevel() * 2.38, h * 0.15, Color(35, 255, 35))
        if(self:GetLightStatus() != 2) then
            draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].potCantGrow, "gheroin.fonts.entities.2", baseX + (w / 2), h * 0.81, Color(220, 220, 220), 1)
        else
            draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].potStep2, "gheroin.fonts.entities.2", baseX + (w / 2), h * 0.81, Color(220, 220, 220), 1)
        end
    end

    -- Harvesting.
    if(self:GetStep() == 2) then
        draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].entStep, 3), "gheroin.fonts.entities.1", baseX + (w * 0.025), h * 0.24, Color(255, 255, 255), 0)

        draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].potStep3, self:GetTotalOpium()), "gheroin.fonts.entities.2", baseX + (w * 0.025), h * 0.475, Color(220, 220, 220), 0)
    end

    cam.End3D2D()
end