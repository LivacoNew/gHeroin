local module = GAS.Logging:MODULE()

module.Category = "gHeroin"
module.Name = "NPC"
module.Colour = Color(255, 10, 146)

module:Setup(function()
    -- Opening the NPC UI.
    module:Hook("gheroin.hooks.npc.open", "gheroin.blogs.npc.open", function(ply)
        module:Log("{1} opened the NPC UI.", GAS.Logging:FormatPlayer(ply))
    end)

    -- Selling heroin.
    module:Hook("gheroin.hooks.npc.sell", "gheroin.blogs.npc.sell", function(ply, payout, heroinAmount)
        module:Log("{1} sold {2} units of heroin for {3}.", GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(heroinAmount), GAS.Logging:FormatMoney(payout))
    end)

    -- Buying Syringe
    module:Hook("gheroin.hooks.npc.buy", "gheroin.blogs.npc.buy", function(ply)
        module:Log("{1} bought a syringe from a NPC.", GAS.Logging:FormatPlayer(ply))
    end)

    -- New NPC
    module:Hook("gheroin.hooks.npc.newnpc", "gheroin.blogs.npc.newnpc", function(ply, pos, ang)
        module:Log("{1} placed a new NPC.", GAS.Logging:FormatPlayer(ply))
    end)

    -- remove NPC
    module:Hook("gheroin.hooks.npc.removenpc", "gheroin.blogs.npc.newnpc", function(ply)
        module:Log("{1} removed a NPC.", GAS.Logging:FormatPlayer(ply))
    end)
end)

GAS.Logging:AddModule(module)