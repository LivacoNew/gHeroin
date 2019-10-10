TOOL.Category = "gHeroin"
TOOL.Name = "#tool.gheroin_npc.name"
TOOL.Command = nil
TOOL.ConfigName = ""
TOOL.Information = {
	{name = "left"},
	{name = "right"}
}

if CLIENT then
    language.Add("tool.gheroin_npc.name", "gHeroin NPC Spawner")
	language.Add("tool.gheroin_npc.desc", "Use this tool to place Heroin Addicts.")
    language.Add("tool.gheroin_npc.left", "Place a new NPC.")
    language.Add("tool.gheroin_npc.right", "Remove the NPC you are pointing at.")
end

local cooldown = 0
function TOOL:LeftClick(trace)
    if(SERVER) then return end
	-- Check Cooldown
    if(cooldown > CurTime()) then return end
    cooldown = CurTime() + 0.5

	-- Request to the server to place a NPC.
    net.Start("gheroin.core.placenpc")
    net.WriteVector(trace.HitPos)
    net.WriteAngle(Angle(0, LocalPlayer():GetAngles().y - 180, LocalPlayer():GetAngles().r))
    net.SendToServer()

    return true
end

function TOOL:RightClick(trace)
    if(SERVER) then return end

	-- Check Cooldown
    if(cooldown > CurTime()) then return end
    cooldown = CurTime() + 0.5

	-- Make sure it's an NPC.
    local ent = trace.Entity
    if(!IsValid(ent)) then return end
    if(ent:GetClass() != "gheroin_npc") then return end

	-- Request to the server to remove it.
    net.Start("gheroin.core.removenpc")
    net.WriteEntity(ent)
    net.SendToServer()
    return true
end