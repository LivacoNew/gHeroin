-- UI for the Heroin Addict.
net.Receive("gheroin.core.npcui", function()
    local frame = vgui.Create("DFrame")
    frame:SetSize(ScrW() * 0.3, ScrH() * 0.25)
    frame:SetTitle("")
    frame:SetDraggable(false)
    frame:ShowCloseButton(false)
    frame:Center()
    frame:MakePopup()
    frame.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, h * 0.05, w, h * 0.95, Color(50, 50, 50))
        draw.RoundedBox(10, 0, 0, w, h * 0.1, Color(25, 25, 25))
        draw.RoundedBox(0, 0, h * 0.05, w, h * 0.09, Color(25, 25, 25))

        draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].npcUITitle, "gheroin.fonts.vgui.1", w * 0.02, h * 0.0025, Color(255, 255, 255), 0)
        draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].npcUIText, "gheroin.fonts.vgui.2", w * 0.02, h * 0.15, Color(255, 255, 255), 0)
    end
    local fw,fh = frame:GetSize()

    local buttonMenu = vgui.Create("DPanel", frame)
    buttonMenu:SetPos(fw * 0.58, fh * 0.1625)
    buttonMenu:SetSize(fw * 0.4, fh * 0.8)
    buttonMenu.Paint = function() end

    local sellButton = vgui.Create("DButton", buttonMenu)
    sellButton:SetText("")
    sellButton:Dock(TOP)
    sellButton:DockMargin(0, 0, 0, buttonMenu:GetTall() * 0.125)
    sellButton:SetSize(buttonMenu:GetWide(), buttonMenu:GetTall() * 0.25)
    sellButton.colorLerp = 0
    sellButton.Paint = function(self, w, h)
        if(self:IsHovered()) then
            self.colorLerp = Lerp(0.075, self.colorLerp, 35)
        else
            self.colorLerp = Lerp(0.025, self.colorLerp, 25)
        end
        draw.RoundedBox(0, 0, 0, w, h, Color(self.colorLerp, self.colorLerp, self.colorLerp))

        draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].npcUISellButton, "gheroin.fonts.vgui.2", w / 2, h * 0.25, Color(255, 255, 255), 1, 1)
    end
    sellButton.DoClick = function()
        net.Start("gheroin.core.attemptsell")
        net.SendToServer()
    end

    local buyButton = vgui.Create("DButton", buttonMenu)
    buyButton:SetText("")
    buyButton:Dock(TOP)
    buyButton:DockMargin(0, 0, 0, buttonMenu:GetTall() * 0.125)
    buyButton:SetSize(buttonMenu:GetWide(), buttonMenu:GetTall() * 0.25)
    buyButton.colorLerp = 0
    buyButton.Paint = function(self, w, h)
        if(self:IsHovered()) then
            self.colorLerp = Lerp(0.075, self.colorLerp, 35)
        else
            self.colorLerp = Lerp(0.025, self.colorLerp, 25)
        end
        draw.RoundedBox(0, 0, 0, w, h, Color(self.colorLerp, self.colorLerp, self.colorLerp))

        draw.DrawText(string.format(gHeroin.Languages[gHeroin.Config.Language].npcUIBuyButton, gHeroin.Config.Units.Currency .. string.Comma(gHeroin.Config.NPC.SyringeCost)), "gheroin.fonts.vgui.2", w / 2, h * 0.25, Color(255, 255, 255), 1, 1)
    end
    buyButton.DoClick = function()
        net.Start("gheroin.core.attemptbuy")
        net.SendToServer()
    end

    local cancelButton = vgui.Create("DButton", buttonMenu)
    cancelButton:SetText("")
    cancelButton:Dock(TOP)
    cancelButton:DockMargin(0, 0, 0, buttonMenu:GetTall() * 0.125)
    cancelButton:SetSize(buttonMenu:GetWide(), buttonMenu:GetTall() * 0.25)
    cancelButton.colorLerp = 0
    cancelButton.Paint = function(self, w, h)
        if(self:IsHovered()) then
            self.colorLerp = Lerp(0.075, self.colorLerp, 35)
        else
            self.colorLerp = Lerp(0.025, self.colorLerp, 25)
        end
        draw.RoundedBox(0, 0, 0, w, h, Color(self.colorLerp, self.colorLerp, self.colorLerp))

        draw.DrawText(gHeroin.Languages[gHeroin.Config.Language].npcUICancelButton, "gheroin.fonts.vgui.2", w / 2, h * 0.25, Color(255, 255, 255), 1, 1)
    end
    cancelButton.DoClick = function()
        frame:Close()
    end
end)