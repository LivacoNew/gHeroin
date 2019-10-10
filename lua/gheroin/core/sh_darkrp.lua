-- Adds the items into DarkRP automatically.
hook.Add("loadCustomDarkRPItems", "gheroin.core.darkrp", function()
    if(!gHeroin.Config.Misc.DarkRPAdd) then return end

    -- The categorys for Entities.
    DarkRP.createCategory {
        name = "gHeroin",
        categorises = "entities",
        startExpanded = true,
        color = Color(255, 0, 255, 255),
        canSee = function(ply) return ply:Team() == TEAM_HEROIN end,
        sortOrder = 25
    }

    -- The job.
    TEAM_HEROIN = DarkRP.createJob("Heroin Manufacturer", {
        color = Color(255, 0, 255),
        model = {"models/player/Group03/male_04.mdl"},
        description = [[The Heroin Manufacturer makes heroin and sells it off to Heroin Addicts, or uses it for themselves. Be careful that cops don't catch you!]],
        weapons = {"gheroin_knife"},
        command = "gheroin_heroin",
        max = 5,
        salary = 0,
        admin = 0,
        vote = false,
        hasLicence = false,
        canDemote = false,
        category = "Citizens"
    })

    -- The entities.

    -- Battery.
    DarkRP.createEntity("Battery", {
        ent = "gheroin_battery",
        model = "models/livaco/gheroin/livaco_battery.mdl",
        price = 50,
        max = 3,
        cmd = "gheroin_battery",
        category = "gHeroin"
    })

    -- Bucket
    DarkRP.createEntity("Bucket", {
        ent = "gheroin_bucket",
        model = "models/livaco/gheroin/livaco_bucket.mdl",
        price = 75,
        max = 3,
        cmd = "gheroin_bucket",
        category = "gHeroin"
    })

    -- Extractor
    DarkRP.createEntity("Extractor", {
        ent = "gheroin_extractor",
        model = "models/props_lab/monitor02.mdl",
        price = 300,
        max = 1,
        cmd = "gheroin_extractor",
        category = "gHeroin"
    })

    -- Lamp
    DarkRP.createEntity("Lamp", {
        ent = "gheroin_lamp",
        model = "models/livaco/gheroin/livaco_lamp.mdl",
        price = 50,
        max = 3,
        cmd = "gheroin_lamp",
        category = "gHeroin"
    })

    -- Plant Pot
    DarkRP.createEntity("Plant Pot", {
        ent = "gheroin_plantpot",
        model = "models/props_c17/metalpot001a.mdl",
        price = 250,
        max = 3,
        cmd = "gheroin_plantpot",
        category = "gHeroin"
    })

    -- Seed
    DarkRP.createEntity("Opium Poppy Seeds", {
        ent = "gheroin_seed",
        model = "models/props_combine/breenglobe.mdl",
        price = 150,
        max = 3,
        cmd = "gheroin_seed",
        category = "gHeroin"
    })

    -- Crusher
    DarkRP.createEntity("Crusher", {
        ent = "gheroin_crusher",
        model = "models/props_c17/FurnitureTable002a.mdl",
        price = 200,
        max = 3,
        cmd = "gheroin_crusher",
        category = "gHeroin"
    })
end)