AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel(gHeroin.Config.NPC.Model)
    self:SetHullType(HULL_HUMAN)
    self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
    self:SetTrigger(true)

    self:SetUseType(SIMPLE_USE)
    self.storedHeroin = 0
end

function ENT:Use(ply)
    -- Ensure it's a player.
    if(!ply:IsValid() || ply:IsBot() || !ply:IsPlayer()) then return end

    -- If the player is a CP, and the check if allowed.
    if(gHeroin.Config.NPC.CheckCP == true && ply:isCP()) then
        -- Give them a lovely message.
        gHeroin.Core.Message(ply, gHeroin.Lang.NPC.CopMessage)
        return
    end

    -- If the whitelist is active.
    if(gHeroin.Config.NPC.Whitelist) then
        -- And the player isn't in the whitelist.
        if(!gHeroin.Config.NPC.WhitelistJobs[ply:Team()]) then
            -- Nice message and then return.
            gHeroin.Core.Message(ply, gHeroin.Lang.NPC.WhitelistMessage)
            return
        end
    end

    -- If no heroin is stored.
    if(self.storedHeroin <= 0) then
        -- Message them telling them so.
        gHeroin.Core.Message(ply, gHeroin.Lang.NPC.NoHeroinMessage)
        return
    end

    -- If all is well, then pay the player and be on their way.
    local payout = math.random(gHeroin.Config.NPC.PayoutMin, gHeroin.Config.NPC.PayoutMax) * self.storedHeroin
    ply:addMoney(payout)
    gHeroin.Core.Message(ply, string.format(gHeroin.Lang.NPC.HeroinMessage, gHeroin.Config.Currency .. string.Comma(payout)))
    self.storedHeroin = 0
end

function ENT:AddHeroin(amount)
    self.storedHeroin = self.storedHeroin + amount
end

function ENT:StartTouch(ent)
    -- If it's a packge.
    if(ent:GetClass() == "gheroin_package") then
		-- If the package isn't empty..
		if(ent:GetStoredHeroin() <= 0) then return end
		-- Give the NPC the heroin, and remove the package.
		self:AddHeroin(ent:GetStoredHeroin())
		ent:Remove()
	end

    if(ent:GetClass() == "gheroin_heroin") then
		-- Give the NPC the heroin, and remove the package.
		self:AddHeroin(ent:GetAmount())
		ent:Remove()
	end
end