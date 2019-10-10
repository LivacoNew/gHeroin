-- Fonts.
surface.CreateFont("gheroin.entities.1", {
    font = gHeroin.Config.Font,
    size = 40
})
surface.CreateFont("gheroin.entities.2", {
    font = gHeroin.Config.Font,
    size = 60
})

-- Basic message function.
function gHeroin.Core.Message(message)
    chat.AddText(gHeroin.Config.PrefixColor, gHeroin.Config.Prefix, gHeroin.Config.ChatColor, " ", message)
end
-- Receive the net message from the Server to send a message.
net.Receive("gheroin.core.message", function()
    gHeroin.Core.Message(net.ReadString())
end)

-- Player being high.
net.Receive("gheroin.core.high", function()
    gHeroin.Highs[LocalPlayer():SteamID64()] = gHeroin.Config.Entities.HeroinHighTime + CurTime()
end)

local screenLerp = 0;
hook.Add("RenderScreenspaceEffects", "gheroin.core.high", function()
    if(!gHeroin.Highs[LocalPlayer():SteamID64()]) then return end
    if(gHeroin.Highs[LocalPlayer():SteamID64()] <= CurTime()) then
        screenLerp = Lerp(0.01, screenLerp, 0)
        if(screenLerp <= 0.05) then
            gHeroin.Highs[LocalPlayer():SteamID64()] = false
        end
    else
        screenLerp = Lerp(0.01, screenLerp, 1)
    end

    DrawMotionBlur(screenLerp * 0.05, screenLerp * 0.56, screenLerp * 0.01)
    DrawSharpen(screenLerp, screenLerp)
    DrawBloom(screenLerp * 0.65, screenLerp * 2, screenLerp * 9, screenLerp * 9, screenLerp * 1, screenLerp * 1, screenLerp * 1, screenLerp * 1, screenLerp * 1)
    DrawToyTown(screenLerp * 3, screenLerp * 0.40)
end)