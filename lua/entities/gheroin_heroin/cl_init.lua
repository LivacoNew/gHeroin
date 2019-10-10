include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	-- 3D2D.
	local ang = self:GetAngles()
	local pos = self:LocalToWorld(Vector(0, 0, 0)) + Vector(0, 0, 25)

	if(gHeroin.Config.StareAtPlayer) then
		ang = Angle(0, LocalPlayer():EyeAngles().y - 90, -LocalPlayer():EyeAngles().p - 270)
	else
		ang:RotateAroundAxis(self:GetAngles():Up(), 90)
		ang:RotateAroundAxis(self:GetAngles():Right(), -90)
	end

	surface.SetFont("gheroin.entities.1")
	local textLength = surface.GetTextSize(string.format(gHeroin.Lang.Entities.Heroin3D2D, string.Comma(self:GetAmount()) .. gHeroin.Config.Entities.HeroinUnit)) + 50

	cam.Start3D2D(pos, ang, 0.1)
	draw.RoundedBox(0, (textLength / 2) * -1, -25, textLength, 50, Color(0, 0, 0, 250))
	draw.SimpleText(string.format(gHeroin.Lang.Entities.Heroin3D2D, string.Comma(self:GetAmount()) .. gHeroin.Config.Entities.HeroinUnit), "gheroin.entities.1", 0, 0, Color(255, 255, 255, 255), 1, 1)
	cam.End3D2D()
end