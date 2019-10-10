hook.Add("loadCustomDarkRPItems", "gheroin.darkrp.add", function()
    DarkRP.createCategory {
        name = "gHeroin",
        categorises = "entities",
        startExpanded = true,
        color = Color(255, 0, 255),
        sortOrder = 25
    }


    DarkRP.createEntity("Acetic Anhydride", {
        ent = "gheroin_acetic",
        model = "models/livaco/gheroin/livaco_bottle.mdl",
        price = 250,
        max = 3,
        cmd = "buyacetic",
        category = "gHeroin"
    })

    DarkRP.createEntity("Hydrochloric Acid", {
        ent = "gheroin_acid",
        model = "models/livaco/gheroin/livaco_bottle.mdl",
        price = 250,
        max = 3,
        cmd = "buyacid",
        category = "gHeroin"
    })

    DarkRP.createEntity("Ammonia Solution", {
        ent = "gheroin_ammonia",
        model = "models/livaco/gheroin/livaco_bottle.mdl",
        price = 250,
        max = 3,
        cmd = "buyammonia",
        category = "gHeroin"
    })

    DarkRP.createEntity("Barrel", {
        ent = "gheroin_barrel",
        model = "models/livaco/gheroin/livaco_barrel.mdl",
        price = 500,
        max = 1,
        cmd = "buybarrel",
        category = "gHeroin"
    })

    DarkRP.createEntity("Extractor", {
        ent = "gheroin_extractor",
        model = "models/livaco/gheroin/livaco_extractor.mdl",
        price = 750,
        max = 1,
        cmd = "buyextractor",
        category = "gHeroin"
    })

    DarkRP.createEntity("Mixer", {
        ent = "gheroin_mixer",
        model = "models/livaco/gheroin/livaco_mixer.mdl",
        price = 500,
        max = 1,
        cmd = "buymixer",
        category = "gHeroin"
    })

    DarkRP.createEntity("Package", {
        ent = "gheroin_package",
        model = "models/livaco/gheroin/livaco_package.mdl",
        price = 250,
        max = 3,
        cmd = "buypackage",
        category = "gHeroin"
    })

    DarkRP.createEntity("Poppy Seeds", {
        ent = "gheroin_poppyseed",
        model = "models/livaco/gheroin/livaco_packet.mdl",
        price = 50,
        max = 3,
        cmd = "buypoppyseeds",
        category = "gHeroin"
    })

    DarkRP.createEntity("Sodium Carbonate", {
        ent = "gheroin_sodium",
        model = "models/livaco/gheroin/livaco_bottle.mdl",
        price = 250,
        max = 3,
        cmd = "buysodium",
        category = "gHeroin"
    })
end)