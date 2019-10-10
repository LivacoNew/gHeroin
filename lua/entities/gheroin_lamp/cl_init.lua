include("shared.lua")

function ENT:Draw()
    self:DrawModel()
end

-- Draw the light when on.
function ENT:Think()
    -- Make sure the light is actually fucking ment to be on.
    if(self:GetActive() == false) then return end
    -- Make the light.
    local light = DynamicLight(self:EntIndex())
    if(light) then
        light.pos = self:GetPos() - (self:GetUp() * 9)
        light.r = 255
        light.g = 255
        light.b = 255
        light.brightness = 1
        light.Decay = 1000
        light.Size = 256
        light.DieTime = CurTime() + 1
    end
end

function ENT:DrawTranslucent()
    local distance = (LocalPlayer():GetShootPos() - self:GetPos()):Length()
    if(distance > gHeroin.Config.Distance3d2d) then return end

	local ang = Angle(0, LocalPlayer():EyeAngles().y - 90, -LocalPlayer():EyeAngles().p - 270)
    local pos = self:LocalToWorld(Vector(0, 0, 0)) + Vector(0, 0, 5)

    cam.Start3D2D(pos, ang, 0.1)

    local baseX = 100
    local w,h = 250,90

    draw.RoundedBox(0, baseX, h * 0.1, w, h * 0.9, Color(50, 50, 50))
    draw.RoundedBox(10, baseX, 0, w, h * 0.3, Color(25, 25, 25))
    draw.RoundedBox(0, baseX, h * 0.09, w, h * 0.3, Color(25, 25, 25))
    draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].lampName, "gheroin.fonts.entities.1", baseX + (w / 2), -0.5, Color(255, 255, 255), 1)

    if(self:GetActive() == false) then
        draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].lampStatus, gHeroin.Languages[gHeroin.Config.Language].lampOff), "gheroin.fonts.entities.2", baseX + (w * 0.025), h * 0.4, Color(220, 220, 220), 0)
    else
        draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].lampStatus, gHeroin.Languages[gHeroin.Config.Language].lampOn), "gheroin.fonts.entities.2", baseX + (w * 0.025), h * 0.4, Color(220, 220, 220), 0)
    end

    draw.RoundedBox(0, baseX + (w * 0.025), h * 0.675, w * 0.95, h * 0.25, Color(25, 25, 25))
    draw.RoundedBox(0, baseX + (w * 0.025), h * 0.675, (self:GetPower() / gHeroin.Config.Misc.LampMaxPower) * 238, h * 0.25, Color(35, 35, 255))
    draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].powerStored, math.floor(self:GetPower()), gHeroin.Config.Misc.LampMaxPower), "gheroin.fonts.entities.2", baseX + (w / 2), h * 0.7, Color(220, 220, 220), 1)

    cam.End3D2D()
end