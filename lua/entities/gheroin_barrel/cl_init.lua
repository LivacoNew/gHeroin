include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end

function ENT:DrawTranslucent()
	local ang = self:GetAngles()
	local pos = self:LocalToWorld(Vector(0, 0, 0)) + Vector(0, 0, 35)
	if(gHeroin.Config.StareAtPlayer) then
		ang = Angle(0, LocalPlayer():EyeAngles().y - 90, -LocalPlayer():EyeAngles().p - 270)
	else
		ang:RotateAroundAxis(self:GetAngles():Up(), 90)
		ang:RotateAroundAxis(self:GetAngles():Right(), -90)
	end

	local ingredientPerStep = {}
	ingredientPerStep[1] = gHeroin.Lang.Entities.BarrelMorphine
	ingredientPerStep[2] = gHeroin.Lang.Entities.BarrelAcetic
	ingredientPerStep[3] = gHeroin.Lang.Entities.BarrelSodium

	surface.SetFont("gheroin.entities.2")
	local headerLength = surface.GetTextSize(gHeroin.Lang.Entities.Barrel)
	surface.SetFont("gheroin.entities.1")
	local subLength = surface.GetTextSize(gHeroin.Lang.Entities.BarrelDissolve)
	if(self:GetStep() < 4) then
		subLength = surface.GetTextSize(string.format(gHeroin.Lang.Entities.BarrelInsert, ingredientPerStep[self:GetStep()]))
	end
	local length = math.max(headerLength, subLength) + 50

	cam.Start3D2D(pos, ang, 0.1)

	draw.RoundedBox(0, (length / 2) * -1, -75, length, 130, Color(0, 0, 0, 250))
	draw.SimpleText(gHeroin.Lang.Entities.Barrel, "gheroin.entities.2", 0, -65, Color(255, 255, 255), 1, 0)
	if(self:GetStep() < 4) then
		draw.SimpleText(string.format(gHeroin.Lang.Entities.BarrelInsert, ingredientPerStep[self:GetStep()]), "gheroin.entities.1", 0, 0, Color(255, 255, 255), 1, 0)
	else
		draw.SimpleText(gHeroin.Lang.Entities.BarrelDissolve, "gheroin.entities.1", 0, 0, Color(255, 255, 255), 1, 0)
	end

	cam.End3D2D()
end