-- Fonts
surface.CreateFont("gheroin.fonts.entities.1", {
    font = gHeroin.Config.Font,
    size = 35
})
surface.CreateFont("gheroin.fonts.entities.2", {
    font = gHeroin.Config.Font,
    size = 20
})
surface.CreateFont("gheroin.fonts.entities.3", {
    font = gHeroin.Config.Font,
    size = 15
})
surface.CreateFont("gheroin.fonts.entities.4", {
    font = gHeroin.Config.Font,
    size = 50
})

surface.CreateFont("gheroin.fonts.vgui.1", {
    font = gHeroin.Config.Font,
    size = ScreenScale(12)
})
surface.CreateFont("gheroin.fonts.vgui.2", {
    font = gHeroin.Config.Font,
    size = ScreenScale(8)
})
surface.CreateFont("gheroin.fonts.vgui.3", {
    font = gHeroin.Config.Font,
    size = ScreenScale(7)
})

-- Chat messages.
function gHeroin.Core.Message(message)
    chat.AddText(gHeroin.Config.PrefixColor, gHeroin.Config.Prefix, gHeroin.Config.MessageColor, " ", message)
end
net.Receive("gheroin.core.message", function()
    gHeroin.Core.Message(net.ReadString())
end)

-- Making the player high.
net.Receive("gheroin.core.highplayer", function()
    gHeroin.Highs[LocalPlayer():SteamID64()] = CurTime() + gHeroin.Config.Misc.HighTime
end)

local screenLerp = 0
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