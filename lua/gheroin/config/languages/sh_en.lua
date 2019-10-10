gHeroin.Languages["en"] = {
    -- Entity names.

    -- Plant Pot.
    plantPotName = "Plant Pot",
    -- Lamp.
    lampName = "Lamp",
    -- Crusher Name.
    crusherName = "Crusher",
    -- Bucket.
    bucketName = "Bucket",
    -- Extractor.
    extractorName = "Extractor",
    -- Heroin.
    heroinName = "Bag of Heroin",


    -- Entity Instructions

    -- Plant Pot Step 1
    potStep1 = "Insert Opium Poppy Seeds to\nbeing the growing process.",
    -- Plant Pot Step 2
    potStep2 = "Growing...",
    -- Plant Pot Step 3
    potStep3 = "Press E to harvest Opium.\n%s opium pods left to harvest.",
    -- Lighting levels for Plant Pot.
    potLightLevel = {
        [0] = "No Light",
        [1] = "Not enough Light",
        [2] = "Good Amount of Light",
        [3] = "Too much Light",
    },
    -- Plant unable to grow.
    potCantGrow = "Unable to Grow.",
    -- Crusher Step 1.
    crusherStep1 = "Insert some Opium Pods to\nstart crushing.",
    -- Crusher step 2.
    crusherStep2 = "Crushing...",
    -- Crusher if Opium Latex is full.
    crusherFull = "Opium Latex storage is full.\nUse a bucket to empty\nstorage before continuing.",
    -- Extractor Step 1
    extractorStep1 = "Insert some Opium latex to\nstart.",
    -- Extractor Step 2
    extractorStep2 = "Extracting heroin from\nOpium Latex...",
    -- Extractor if Heroin is full.
    extractorHeroin = "Heroin Storage is full. Press\nE to empty.",


    -- Other Entity related text.

    -- Step (blank) for entities.
    entStep = "Step %s",
    -- How much Opium Pods are stored.
    opiumStored = "Opium Pods: %s / %s",
    -- How much Opium Latex is stored.
    opiumLatexStored = "Opium Latex: %s / %s",
    -- How much Heroin is stored.
    heroinStored = "Heroin: %s / %s",
    -- How much power is Stored.
    powerStored = "Power: %s / %s",
    -- How much gas is stored.
    gasStored = "Gas: %s / %s",
    -- Lamp Status.
    lampStatus = "Status: %s",
    -- On/Off for Lamp Status.
    lampOn = "On",
    lampOff = "Off",
    -- Pot identifier for Stove.
    potIdentify = "Pot %s",



    -- NPC

    -- 3d2d Text.
    npc3D2D = "Heroin Addict",
    -- Message if the player is a CP.
    npcCP = "Nothing to see here officer! Carry on.",
    -- Created a new NPC message.
    npcCreateNew = "Created a new NPC successfully.",
    -- Removed NPC successfully.
    npcRemove = "Removed NPC successfully.",

    -- NPC UI

    -- The title of the main UI.
    npcUITitle = "Heroin Addict",
    -- The text on the side.
    npcUIText = "Hey, you got something for me?\nMaybe you need a syringe?\nWhat's up?",
    -- The sell heroin button.
    npcUISellButton = "Sell Heroin",
    -- The buy syringe button.
    npcUIBuyButton = "Buy Syringe (%s)",
    -- The cancel button.
    npcUICancelButton = "Cancel",


    -- SWEPS/Toolguns

    -- Syringe UI Header.
    syringeHeader = "Syringe",
    -- Syringe UI heroin stored.
    syringeHeroin = "Heroin Stored: %s",
    -- Syringe UI instructions.
    syringeInstructions = "Left Click to inject Heroin",
    -- NPC Spawner PrintName.
    npcSpawnerName = "gHeroin NPC Spawner",
    -- NPC Spawner description.
    npcSpawnerDescription = "Use this tool to place/delete Heroin Addicts.",
    -- Left click instructions for NPC Spawner.
    npcSpawnerLeft = "Spawns a new Heroin Addict.",
    -- Right click instructions for NPC Spawner.
    npcSpawnerRight = "Removes the Heroin Addict you are looking at.",


    -- Messages

    -- NPC if player doesn't have any heroin, yet tries to sell him.
    npcNoHeroin = "You ain't got any of that brown stuff to give me. Go away!",
    -- NPC when buying heroin.
    npcSell = "Wow, thanks! Here's %s for you to go nuts with.",
    -- NPC if the player can't afford a syringe.
    npcNoAfford = "You think i'm a charity? Cough up the money you need or scram!",
    -- NPC if the player tries to buy a syringe but already owns one.
    npcAlreadyOwned = "Hey! I already gave you one earlier. I got a limited supply of these man...",
    -- NPC when selling a syringe.
    npcBuy = "Here you go man. Pleasure doing business with you.",

    -- Trying to take heroin without having any.


    -- Ratelimited message.
    rateLimit = "Please wait. You are being ratelimited.",
    -- No permission.
    noPermission = "You do not have permission to use this."
}