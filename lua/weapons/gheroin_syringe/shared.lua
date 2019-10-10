AddCSLuaFile()

-- Initial SWEP stuff
if CLIENT then
    SWEP.PrintName = "Syringe"

    SWEP.Slot = 3
    SWEP.SlotPos = 3

    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = true
end

SWEP.Category = "gHeroin"
SWEP.Base = "weapon_base"
SWEP.Instructions = "Left click to take Heroin. Right click to attack."

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.SetHoldType = "crowbar"

SWEP.Weight = 10
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false

SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.Primary.DefaultClip = 0
SWEP.Primary.ClipSize = -1
SWEP.Primary.Ammo = "none"
SWEP.Primary.Automatic = false

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic = false

SWEP.ShouldDropOnDie = false

if(SERVER) then
    -- Take heroin.
    function SWEP:PrimaryAttack()
        self:SetNextPrimaryFire(CurTime() + 2)

        -- Make sure they have heroin.
        if(self.Owner:GetNWInt("gheroin.heroinstorage", 0) <= 0) then return end

        gHeroin.Core.MakeHigh(self.Owner)
    end
end

if(CLIENT) then
    -- UI
    function SWEP:DrawHUD()
        draw.RoundedBox(0, (ScrW() * 0.4), ScrH() * 0.9, ScrW() * 0.2, ScrH() * 0.08, Color(50, 50, 50))
        draw.RoundedBox(10, (ScrW() * 0.4), ScrH() * 0.88, ScrW() * 0.2 - 1, ScrH() * 0.03, Color(25, 25, 25))
        draw.RoundedBox(0, (ScrW() * 0.4), ScrH() * 0.895, ScrW() * 0.2, ScrH() * 0.0235, Color(25, 25, 25))

        draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].syringeHeader, "gheroin.fonts.vgui.1", ScrW() / 2, ScrH() * 0.882, Color(255, 255, 255), 1)
        draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].syringeHeroin, string.Comma(self.Owner:GetNWInt("gheroin.heroinstorage", 0)) .. gHeroin.Config.Units.HeroinUnits), "gheroin.fonts.vgui.2", ScrW() / 2, ScrH() * 0.9225, Color(255, 255, 255), 1)

        draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].syringeInstructions, "gheroin.fonts.vgui.3", ScrW() / 2, ScrH() * 0.95, Color(255, 255, 255), 1)
    end
end
