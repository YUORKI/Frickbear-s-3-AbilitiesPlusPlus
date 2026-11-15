function get_upgrades(arg0 = -1)
{
    var Upgrades = array_create(UnknownEnum.Value_66, 
    {
        Name: "",
        Desc: "",
        StepUp: [],
        StepDown: [],
        Price: 1
    });
    Upgrades[UnknownEnum.Value_0] = 
    {
        Name: "Overcharge",
        Desc: "Start each night with an extra 10% power.",
        StepUp: [UnknownEnum.Value_1, UnknownEnum.Value_2],
        StepDown: [],
        Price: 18
    };
    Upgrades[UnknownEnum.Value_1] = 
    {
        Name: "Overcharge+",
        Desc: "Start each night with an extra 25% power.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_0],
        Price: 30
    };
    Upgrades[UnknownEnum.Value_2] = 
    {
        Name: "Power Hour",
        Desc: string("You have unlimited power for the first {0} of the night. Replaces Overcharge.", speedup_seconds_string(60, false, false, true)),
        StepUp: [],
        StepDown: [UnknownEnum.Value_0],
        Price: 36
    };
    Upgrades[UnknownEnum.Value_3] = 
    {
        Name: "Mini Multiplier",
        Desc: "Minigames give 1.25x as many tokens.",
        StepUp: [UnknownEnum.Value_4],
        StepDown: [],
        Price: 25
    };
    Upgrades[UnknownEnum.Value_4] = 
    {
        Name: "Mini Multiplier+",
        Desc: "Minigames give 1.5x as many tokens.",
        StepUp: [UnknownEnum.Value_5],
        StepDown: [UnknownEnum.Value_3],
        Price: 36
    };
    Upgrades[UnknownEnum.Value_5] = 
    {
        Name: "Mini Multiplier++",
        Desc: "Minigames give 2x as many tokens.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_4],
        Price: 60
    };
    Upgrades[UnknownEnum.Value_6] = 
    {
        Name: "Employee Discount",
        Desc: "Items from Mendo's shop are 10% cheaper.",
        StepUp: [UnknownEnum.Value_7],
        StepDown: [],
        Price: 18
    };
    Upgrades[UnknownEnum.Value_7] = 
    {
        Name: "Employee Discount+",
        Desc: "Items from Mendo's shop are 25% cheaper.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_6],
        Price: 34
    };
    Upgrades[UnknownEnum.Value_8] = 
    {
        Name: "Backdoor Trading",
        Desc: string("All {0} will have one additional animatronic to pick from.", (global.Night == "Endless") ? "rounds" : "salvage locations"),
        StepUp: [UnknownEnum.Value_9],
        StepDown: [],
        Price: 8
    };
    Upgrades[UnknownEnum.Value_9] = 
    {
        Name: "Backdoor Trading+",
        Desc: string("All {0} will have two additional animatronics to pick from.", (global.Night == "Endless") ? "rounds" : "salvage locations"),
        StepUp: [UnknownEnum.Value_10],
        StepDown: [UnknownEnum.Value_8],
        Price: 10
    };
    Upgrades[UnknownEnum.Value_10] = 
    {
        Name: "Backdoor Trading++",
        Desc: string("All {0} will have three additional animatronics to pick from.", (global.Night == "Endless") ? "rounds" : "salvage locations"),
        StepUp: [],
        StepDown: [UnknownEnum.Value_9],
        Price: 12
    };
    Upgrades[UnknownEnum.Value_11] = 
    {
        Name: "Cam Radar",
        Desc: "Camera buttons will indicate which rooms are occupied.",
        StepUp: [UnknownEnum.Value_12],
        StepDown: [],
        Price: 18
    };
    Upgrades[UnknownEnum.Value_12] = 
    {
        Name: "Cam Radar+",
        Desc: "Camera buttons will indicate where specific animatronics are in the building.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_11],
        Price: 55
    };
    Upgrades[UnknownEnum.Value_13] = 
    {
        Name: "Superfan",
        Desc: guard_ability(UnknownEnum.Value_18) ? "Looking out the window cools you down faster." : "The fan cools down the office faster.",
        StepUp: [UnknownEnum.Value_14],
        StepDown: [],
        Price: 16
    };
    Upgrades[UnknownEnum.Value_14] = 
    {
        Name: "Superfan+",
        Desc: guard_ability(UnknownEnum.Value_18) ? "Looking out the window cools you down significantly faster." : "The fan cools down the office significantly faster.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_13],
        Price: 20
    };
    Upgrades[UnknownEnum.Value_15] = 
    {
        Name: "Head Start",
        Desc: string("Animatronics will not activate until {0} into the night.", speedup_seconds_string(15)),
        StepUp: [UnknownEnum.Value_16, UnknownEnum.Value_17],
        StepDown: [],
        Price: 30
    };
    Upgrades[UnknownEnum.Value_16] = 
    {
        Name: "Head Start+",
        Desc: string("Animatronics will not activate until {0} into the night.", speedup_seconds_string(30)),
        StepUp: [],
        StepDown: [UnknownEnum.Value_15],
        Price: 36
    };
    Upgrades[UnknownEnum.Value_17] = 
    {
        Name: "Late Start",
        Desc: string("Start the night at {0}:{1} AM. Replaces Head Start.", (global.GuardParameters.starting_hour == 4) ? 4 : get_starting_AM(), (global.GuardParameters.starting_hour == 4) ? 42 : speedup_seconds(30, true)),
        StepUp: [],
        StepDown: [UnknownEnum.Value_15],
        Price: 32
    };
    Upgrades[UnknownEnum.Value_18] = 
    {
        Name: "Overstock",
        Desc: "Every item in Mendo's shop has 1 additional stock.",
        StepUp: [UnknownEnum.Value_19],
        StepDown: [],
        Price: 45
    };
    Upgrades[UnknownEnum.Value_19] = 
    {
        Name: "Overstock+",
        Desc: "Every item in Mendo's shop has 2 additional stock.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_18],
        Price: 60
    };
    Upgrades[UnknownEnum.Value_20] = 
    {
        Name: "Early Investment",
        Desc: string("Start each night with {0} tokens.", speedup_tokens(5)),
        StepUp: [UnknownEnum.Value_21],
        StepDown: [],
        Price: 10
    };
    Upgrades[UnknownEnum.Value_21] = 
    {
        Name: "Early Investment+",
        Desc: string("Start each night with {0} tokens.", speedup_tokens(15)),
        StepUp: [UnknownEnum.Value_22, UnknownEnum.Value_23],
        StepDown: [UnknownEnum.Value_20],
        Price: 20
    };
    Upgrades[UnknownEnum.Value_22] = 
    {
        Name: "Early Investment++",
        Desc: string("Start each night with {0} tokens.", speedup_tokens(30)),
        StepUp: [],
        StepDown: [UnknownEnum.Value_21],
        Price: 30
    };
    Upgrades[UnknownEnum.Value_23] = 
    {
        Name: "Tasty Investment",
        Desc: "Start the night with a Golden Cupcake. Replaces Early Investment+.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_21],
        Price: 25
    };
    Upgrades[UnknownEnum.Value_24] = 
    {
        Name: "Felix's Loan",
        Desc: string("You can go up to {0} tokens into debt, but will be jumpscared if you end the night with a negative token balance.", speedup_tokens(15)),
        StepUp: [UnknownEnum.Value_25],
        StepDown: [],
        Price: 10
    };
    Upgrades[UnknownEnum.Value_25] = 
    {
        Name: "Felix's Loan+",
        Desc: string("You can go up to {0} tokens into debt, but will be jumpscared if you end the night with a negative token balance.", speedup_tokens(30)),
        StepUp: [UnknownEnum.Value_26],
        StepDown: [UnknownEnum.Value_24],
        Price: 20
    };
    Upgrades[UnknownEnum.Value_26] = 
    {
        Name: "Felix's Loan++",
        Desc: "You can go into unlimited debt, but will be jumpscared if you end the night with a negative token balance.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_25],
        Price: 30
    };
    Upgrades[UnknownEnum.Value_27] = get_shop_minigames(global.ShuffleData.Minigames[UnknownEnum.Value_8]);
    Upgrades[UnknownEnum.Value_27].StepUp = [];
    Upgrades[UnknownEnum.Value_27].StepDown = [];
    Upgrades[UnknownEnum.Value_28] = get_shop_minigames(global.ShuffleData.Minigames[UnknownEnum.Value_9]);
    Upgrades[UnknownEnum.Value_28].StepUp = [];
    Upgrades[UnknownEnum.Value_28].StepDown = [];
    Upgrades[UnknownEnum.Value_29] = get_shop_minigames(global.ShuffleData.Minigames[UnknownEnum.Value_10]);
    Upgrades[UnknownEnum.Value_29].StepUp = [];
    Upgrades[UnknownEnum.Value_29].StepDown = [];
    Upgrades[UnknownEnum.Value_30] = 
    {
        Name: "Fuzzy Dice",
        Desc: string("Initial rerolls at {0}'s shop are free.", (global.Night == "Endless") ? "Rockstar Freddy" : "Upgrade Cadet"),
        StepUp: [UnknownEnum.Value_31],
        StepDown: [],
        Price: 5
    };
    Upgrades[UnknownEnum.Value_31] = 
    {
        Name: "Upgrade Commander",
        Desc: string("{0}'s entire inventory is available, but you can no longer reroll. Replaces Fuzzy Dice.", (global.Night == "Endless") ? "Rockstar Freddy" : "Upgrade Cadet"),
        StepUp: [],
        StepDown: [UnknownEnum.Value_30],
        Price: 10
    };
    Upgrades[UnknownEnum.Value_32] = 
    {
        Name: "Power AC",
        Desc: "The office temperature can go below zero.",
        StepUp: [UnknownEnum.Value_33],
        StepDown: [],
        Price: 15
    };
    Upgrades[UnknownEnum.Value_33] = 
    {
        Name: "Power AC+",
        Desc: "The office temperature can go twice as far below zero.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_32],
        Price: 20
    };
    Upgrades[UnknownEnum.Value_34] = 
    {
        Name: "Bear Change",
        Desc: "Blocked animatronics grant 1.5x as many tokens.",
        StepUp: [UnknownEnum.Value_35],
        StepDown: [],
        Price: 24
    };
    Upgrades[UnknownEnum.Value_35] = 
    {
        Name: "Bear Change+",
        Desc: "Blocked animatronics grant 2x as many tokens.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_34],
        Price: 32
    };
    Upgrades[UnknownEnum.Value_36] = 
    {
        Name: "All Ears",
        Desc: "The mask no longer muffles your hearing.",
        StepUp: [UnknownEnum.Value_37],
        StepDown: [],
        Price: 16
    };
    Upgrades[UnknownEnum.Value_37] = 
    {
        Name: "Cool Glasses",
        Desc: "The mask is replaced with some cool glasses, which are easier to see through. Replaces All Ears.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_36],
        Price: 22
    };
    Upgrades[UnknownEnum.Value_38] = 
    {
        Name: "Retina Burner",
        Desc: "The flashlight is more effective and has a bigger radius.",
        StepUp: [UnknownEnum.Value_39],
        StepDown: [],
        Price: 27
    };
    Upgrades[UnknownEnum.Value_39] = 
    {
        Name: "Retina Burner+",
        Desc: "The flashlight is even more effective and has an even bigger radius.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_38],
        Price: 33
    };
    Upgrades[UnknownEnum.Value_40] = 
    {
        Name: "Spawnkiller",
        Desc: "Start each night with a deathcoin.",
        StepUp: [],
        StepDown: [],
        Price: 66
    };
    Upgrades[UnknownEnum.Value_41] = 
    {
        Name: "Talbert's Files",
        Desc: "Effect unknown. (WARNING: Purchasing this item may lead you down a dangerous path.)",
        StepUp: [],
        StepDown: [],
        Price: 80
    };
    Upgrades[UnknownEnum.Value_42] = 
    {
        Name: "Crud-2-Cash",
        Desc: "Items held in your inventory are converted back into tokens at the end of the night.",
        StepUp: [UnknownEnum.Value_43],
        StepDown: [],
        Price: 16
    };
    Upgrades[UnknownEnum.Value_43] = 
    {
        Name: "Crud-2-Cash+",
        Desc: "Items held in your inventory are converted into 1.5x as many tokens at the end of the night.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_42],
        Price: 23
    };
    Upgrades[UnknownEnum.Value_44] = 
    {
        Name: "New Bulbs",
        Desc: "The building is a bit brighter.",
        StepUp: [],
        StepDown: [],
        Price: 8
    };
    Upgrades[UnknownEnum.Value_45] = 
    {
        Name: "Elongator",
        Desc: "Snowcones, Laser Doors and AR Masks last 1.5x as long.",
        StepUp: [UnknownEnum.Value_46],
        StepDown: [],
        Price: 32
    };
    Upgrades[UnknownEnum.Value_46] = 
    {
        Name: "Elongator+",
        Desc: "Snowcones, Laser Doors and AR Masks last 2x as long.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_45],
        Price: 42
    };
    Upgrades[UnknownEnum.Value_47] = 
    {
        Name: "",
        Desc: "The drawings in your office will show which one-time animatronics still need to be dealt with, being crossed off once they have.",
        StepUp: [],
        StepDown: [],
        Price: 24
    };
    Upgrades[UnknownEnum.Value_48] = 
    {
        Name: "Midas Touch",
        Desc: "King's Prizes are more expensive, but they will always grant a positive effect.",
        StepUp: [],
        StepDown: [],
        Price: 42
    };
    Upgrades[UnknownEnum.Value_49] = 
    {
        Name: "Supply Closet",
        Desc: string("Your inventory can hold {0} items at once.", global.GuardParameters.inventory_size + 2),
        StepUp: [UnknownEnum.Value_50],
        StepDown: [],
        Price: 12
    };
    Upgrades[UnknownEnum.Value_50] = 
    {
        Name: "Supply Closet+",
        Desc: string("Your inventory can hold {0} items at once.", global.GuardParameters.inventory_size + 5),
        StepUp: [],
        StepDown: [UnknownEnum.Value_49],
        Price: 18
    };
    Upgrades[UnknownEnum.Value_51] = 
    {
        Name: "Block-1",
        Desc: "Start each night with a Beartrap.",
        StepUp: [],
        StepDown: [],
        Price: 54
    };
    Upgrades[UnknownEnum.Value_52] = 
    {
        Name: "FredTV",
        Desc: "Adds a TV to the office that lets you watch a single camera at a time. Click it to switch cameras.",
        StepUp: [UnknownEnum.Value_53],
        StepDown: [],
        Price: 30
    };
    Upgrades[UnknownEnum.Value_53] = 
    {
        Name: "FredTV+",
        Desc: "Adds a second TV to the office, letting you watch two cameras at a time.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_52],
        Price: 30
    };
    Upgrades[UnknownEnum.Value_54] = 
    {
        Name: "Improved Insulation",
        Desc: "The vent heater raises the building's temperature half as fast.",
        StepUp: [UnknownEnum.Value_55],
        StepDown: [],
        Price: 10
    };
    Upgrades[UnknownEnum.Value_55] = 
    {
        Name: "Improved Insulation+",
        Desc: "The vent heater no longer raises the building's temperature.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_54],
        Price: 15
    };
    Upgrades[UnknownEnum.Value_56] = 
    {
        Name: "Flashcart",
        Desc: "Gives you an additional random minigame to play each night.",
        StepUp: [],
        StepDown: [],
        Price: 12
    };
    Upgrades[UnknownEnum.Value_57] = 
    {
        Name: "Lockdown Protocol",
        Desc: string("Both doorways are blocked off during the last {0} of the night.", speedup_seconds_string(15)),
        StepUp: [UnknownEnum.Value_58],
        StepDown: [],
        Price: 15
    };
    Upgrades[UnknownEnum.Value_58] = 
    {
        Name: "Lockdown Protocol+",
        Desc: string("Both doorways are blocked off during the last {0} of the night.", speedup_seconds_string(30)),
        StepUp: [UnknownEnum.Value_59],
        StepDown: [UnknownEnum.Value_57],
        Price: 20
    };
    Upgrades[UnknownEnum.Value_59] = 
    {
        Name: "Lockdown Protocol++",
        Desc: string("Both doorways are blocked off during the last {0} of the night.", speedup_seconds_string(60)),
        StepUp: [],
        StepDown: [UnknownEnum.Value_58],
        Price: 35
    };
    Upgrades[UnknownEnum.Value_60] = 
    {
        Name: "Dead Ringer",
        Desc: "You'll only need to choose one animatronic on round 10.",
        StepUp: [],
        StepDown: [],
        Price: 5
    };
    Upgrades[UnknownEnum.Value_61] = 
    {
        Name: "Surround Sound",
        Desc: "Audio lures have a +20% chance of fooling all vent animatronics.",
        StepUp: [UnknownEnum.Value_62, UnknownEnum.Value_63],
        StepDown: [],
        Price: 26
    };
    Upgrades[UnknownEnum.Value_62] = 
    {
        Name: "Surround Sound+",
        Desc: "Audio lures have a +50% chance of fooling all vent animatronics.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_61],
        Price: 30
    };
    Upgrades[UnknownEnum.Value_63] = 
    {
        Name: "R.A.S.C.",
        Desc: "You can place a second audio lure by right-clicking a vent node. Replaces Surround Sound.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_61],
        Price: 32
    };
    Upgrades[UnknownEnum.Value_64] = 
    {
        Name: "Mini-Reaper",
        Desc: "One random animatronic will be removed at the start of the night.",
        StepUp: [UnknownEnum.Value_65],
        StepDown: [],
        Price: 32
    };
    Upgrades[UnknownEnum.Value_65] = 
    {
        Name: "Mini-Reaper+",
        Desc: "Two random animatronics will be removed at the start of the night.",
        StepUp: [],
        StepDown: [UnknownEnum.Value_64],
        Price: 36
    };
    
    if (arg0 == -1)
        return Upgrades;
    else
        return Upgrades[arg0];
}

function get_available_upgrade_ids()
{
    var ReturnInventory = [];
    
    if (!global.GuardParameters.upgrades_purchasable)
        return ReturnInventory;
    
    var UpgradeList = get_upgrades();
    var EleanorHold = -1;
    
    if (any_challenge_active() && global.EleanorChallenge.Reward == UnknownEnum.Value_0)
        EleanorHold = global.EleanorChallenge.Value;
    
    for (var i = 0; i < array_length(UpgradeList); i++)
    {
        var Upgrade = UpgradeList[i];
        
        if (global.Night == "Endless" && array_contains([UnknownEnum.Value_28, UnknownEnum.Value_29, UnknownEnum.Value_27, UnknownEnum.Value_41], i))
            continue;
        
        if (UpgradeList[i].Name == "")
            continue;
        
        if (i == EleanorHold)
            continue;
        
        if ((i == UnknownEnum.Value_52 || i == UnknownEnum.Value_53) && guard_ability(UnknownEnum.Value_9))
            continue;
        
        if (i == UnknownEnum.Value_60 && !(global.Night == "Endless"))
            continue;
        
        if (array_contains(global.GuardParameters.blacklist_upgrades, i))
            continue;

        if (i == UnknownEnum.Value_56 && !global.GuardParameters.cartridges_purchasable)
            continue;
        
        if (i == UnknownEnum.Value_60)
        {
            var ClearedRuns = 0;
            
            if (count_up_stickers(global.EndlessGuardStickers) < 4)
                continue;
        }
        
        var ElChipBlock = false;
        
        for (var rpu = 0; rpu < array_length(global.RepeatPrevention.Upgrades); rpu++)
        {
            if (i == global.RepeatPrevention.Upgrades[rpu].ID)
            {
                ElChipBlock = true;
                break;
            }
        }
        
        if (ElChipBlock)
            continue;
        
        if (has_upgrade(i, false))
        {
            if (array_length(Upgrade.StepUp) > 0)
            {
                var NextStepID = Upgrade.StepUp[irandom(array_length(Upgrade.StepUp) - 1)];
                var NextStep = UpgradeList[NextStepID];
                
                if (EleanorHold != NextStepID)
                    array_push(ReturnInventory, NextStepID);
            }
        }
        else if (array_length(Upgrade.StepDown) == 0)
        {
            var HasUpgradedForm = false;
            var StepUpArray = Upgrade.StepUp;
            
            if (array_length(StepUpArray) > 0)
            {
                for (var n = 0; n < array_length(StepUpArray); n++)
                {
                    var StepUpStepUpArray = UpgradeList[StepUpArray[n]].StepUp;
                    
                    if (has_upgrade(StepUpArray[n], false))
                    {
                        HasUpgradedForm = true;
                        break;
                    }
                    else if (array_length(StepUpStepUpArray) > 0)
                    {
                        for (var m = 0; m < array_length(StepUpStepUpArray); m++)
                        {
                            if (has_upgrade(StepUpStepUpArray[m], false))
                            {
                                HasUpgradedForm = true;
                                break;
                            }
                        }
                    }
                }
            }
            
            if (!HasUpgradedForm)
                array_push(ReturnInventory, i);
        }
    }
    
    return ReturnInventory;
}

function get_upgrade_true_value(arg0)
{
    var upgrade = get_upgrades(arg0);
    
    if (array_length(upgrade.StepDown) == 0)
        return upgrade.Price;
    else
        return upgrade.Price + get_upgrade_true_value(upgrade.StepDown[0]);
}

function shop_to_shopkeeper(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return UnknownEnum.Value_131;
        
        case UnknownEnum.Value_1:
            return UnknownEnum.Value_132;
        
        case UnknownEnum.Value_2:
            return UnknownEnum.Value_133;
        
        case UnknownEnum.Value_3:
            return UnknownEnum.Value_134;
        
        case UnknownEnum.Value_4:
            return UnknownEnum.Value_142;
        
        case UnknownEnum.Value_5:
            return UnknownEnum.Value_135;
        
        case UnknownEnum.Value_6:
            return UnknownEnum.Value_139;
        
        case UnknownEnum.Value_7:
            return UnknownEnum.Value_140;
        
        case UnknownEnum.Value_8:
            return UnknownEnum.Value_138;
        
        case UnknownEnum.Value_9:
            return UnknownEnum.Value_137;
        
        case UnknownEnum.Value_10:
            return UnknownEnum.Value_136;
        
        case UnknownEnum.Value_11:
            return UnknownEnum.Value_143;
        
        case UnknownEnum.Value_12:
            return UnknownEnum.Value_141;
    }
}

function speedup_item_price(arg0)
{
    return speedup_tokens(get_item_price(arg0));
}

function get_item_price(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return 0;
        
        case UnknownEnum.Value_1:
            return 5;
        
        case UnknownEnum.Value_2:
            return 5;
        
        case UnknownEnum.Value_3:
            return 10;
        
        case UnknownEnum.Value_4:
            return 10;
        
        case UnknownEnum.Value_5:
            return 15;
        
        case UnknownEnum.Value_6:
            return 15;
        
        case UnknownEnum.Value_7:
            return 20;
        
        case UnknownEnum.Value_8:
            return 25;
        
        case UnknownEnum.Value_9:
            return 30;
        
        case UnknownEnum.Value_10:
            return 35;
        
        case UnknownEnum.Value_11:
            return 300;
    }
}

function acquire_upgrade(arg0)
{
    global.UpgradeRecord[arg0]++;
    var ItemDowngrades = get_upgrades(arg0).StepDown;
    
    for (var i = 0; i < array_length(global.Upgrades); i++)
    {
        if (array_contains(ItemDowngrades, global.Upgrades[i]))
            array_delete(global.Upgrades, i, 1);
    }
    
    array_push(global.Upgrades, arg0);
}

function acquire_cartridge(arg0)
{
    array_push(global.EndlessInventory.Cartridges, arg0);
}

function acquire_consumable(arg0)
{
    if (arg0 != UnknownEnum.Value_3)
    {
        for (var i = 0; i < array_length(global.EndlessInventory.Consumables); i++)
        {
            if (global.EndlessInventory.Consumables[i].ID == arg0)
            {
                global.EndlessInventory.Consumables[i].Uses += get_consumables(arg0).Uses;
                exit;
            }
        }
    }
    
    array_push(global.EndlessInventory.Consumables, 
    {
        ID: arg0,
        Uses: get_consumables(arg0).Uses
    });
}

function get_consumables(arg0 = -1)
{
    var Inventory = [];
    Inventory[UnknownEnum.Value_0] = 
    {
        Name: "Ultra Clock",
        Desc: "Resets the clock back to the start of the night while also fully refilling your power when clicked.",
        Price: 5,
        Uses: 1
    };
    Inventory[UnknownEnum.Value_1] = 
    {
        Name: "Ultra Battery",
        Desc: "Restores 30% power automatically when you would otherwise power out.",
        Price: 6,
        Uses: 1
    };
    Inventory[UnknownEnum.Value_2] = 
    {
        Name: "Ultra Snowcone",
        Desc: "Sets the temperature to zero when clicked. Has three uses.",
        Price: 3,
        Uses: 3
    };
    Inventory[UnknownEnum.Value_3] = 
    {
        Name: "Ultra Cupcake",
        Desc: "Increases in value over time, carrying over between rounds. Click it to sell it for tokens.",
        Price: 5,
        Uses: 25
    };
    Inventory[UnknownEnum.Value_4] = 
    {
        Name: "Ultra Beartrap",
        Desc: "Automatically blocks jumpscares. Has three uses.",
        Price: 30,
        Uses: 3
    };
    Inventory[UnknownEnum.Value_5] = 
    {
        Name: "Ultra Doorway",
        Desc: "Lets you visit any shop you want at the end of a round.",
        Price: 12,
        Uses: 1
    };
    Inventory[UnknownEnum.Value_6] = 
    {
        Name: "Ultra Dice",
        Desc: "Rerolls and doubles the amount of options during animatronic selection. Has three uses.",
        Price: 12,
        Uses: 3
    };
    Inventory[UnknownEnum.Value_9] = 
    {
        Name: "Ultra Deathcoin",
        Desc: "Permanently removes an animatronic of your choice.",
        Price: 50,
        Uses: 1
    };
    Inventory[UnknownEnum.Value_7] = 
    {
        Name: "Ultra Gift Box",
        Desc: string("Provides {0} seconds of complete jumpscare immunity when active. Has two uses.", speedup_seconds(30, false, true)),
        Price: 16,
        Uses: 2
    };
    Inventory[UnknownEnum.Value_8] = 
    {
        Name: "Ultra Picker",
        Desc: "Lets you select any unlocked animatronic in place of one of the randomly selected options during animatronic selection.",
        Price: 10,
        Uses: 1
    };
    Inventory[UnknownEnum.Value_10] = 
    {
        Name: "Ultra Mimic Ball",
        Desc: "Gives you a free duplicate of the last item you bought from Mendo. Has three uses.",
        Price: 18,
        Uses: 3
    };
    Inventory[UnknownEnum.Value_11] = 
    {
        Name: "Ultra Bomb",
        Desc: "Removes 3 random animatronics for the round when clicked. Has two uses.",
        Price: 18,
        Uses: 2
    };
    
    if (arg0 == -1)
        return Inventory;
    else
        return Inventory[arg0];
}

function get_consumable_object(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_1:
            return oShopItemUltra_Battery;
        
        case UnknownEnum.Value_2:
            return oShopItemUltra_Snowcone;
        
        case UnknownEnum.Value_4:
            return oShopItemUltra_Beartrap;
        
        case UnknownEnum.Value_3:
            return oShopItemUltra_Cupcake;
        
        case UnknownEnum.Value_0:
            return oShopItemUltra_Clock;
        
        case UnknownEnum.Value_6:
            return oShopItemUltra_Dice;
        
        case UnknownEnum.Value_5:
            return oShopItemUltra_Doorway;
        
        case UnknownEnum.Value_9:
            return oShopItemUltra_Deathcoin;
        
        case UnknownEnum.Value_7:
            return oShopItemUltra_GiftBox;
        
        case UnknownEnum.Value_8:
            return oShopItemUltra_Picker;
        
        case UnknownEnum.Value_10:
            return oShopItemUltra_MimicBall;
        
        case UnknownEnum.Value_11:
            return oShopItemUltra_Bomb;
    }
}

function spawn_consumables(arg0 = "Night")
{
    for (var i = 0; i < array_length(global.EndlessInventory.Consumables); i++)
    {
        if (global.EndlessInventory.Consumables[i].Uses <= 0)
        {
            array_delete(global.EndlessInventory.Consumables, i, 1);
            i--;
        }
    }
    
    var ValidItems = [];
    
    switch (arg0)
    {
        case "Night":
            ValidItems = [UnknownEnum.Value_1, UnknownEnum.Value_4, UnknownEnum.Value_0, UnknownEnum.Value_3, UnknownEnum.Value_9, UnknownEnum.Value_7, UnknownEnum.Value_2, UnknownEnum.Value_9, UnknownEnum.Value_10, UnknownEnum.Value_11];
            break;
        
        case "Selection":
            ValidItems = [UnknownEnum.Value_6, UnknownEnum.Value_8, UnknownEnum.Value_9];
            break;
        
        case "Shops":
            ValidItems = [UnknownEnum.Value_5, UnknownEnum.Value_9];
            break;
    }
    
    for (var i = 0; i < array_length(global.EndlessInventory.Consumables); i++)
    {
        var Item = global.EndlessInventory.Consumables[i];
        
        if (array_contains(ValidItems, Item.ID))
        {
            with (instance_create_depth(0, 0, 0, get_consumable_object(Item.ID)))
            {
                Uses = Item.Uses;
                InitialUses = Item.Uses;
                InvPosition = i;
            }
        }
    }
    
    if (arg0 == "Selection" && guard_ability(UnknownEnum.Value_20) && global.RunEarnings > 0)
    {
        with (instance_create_depth(0, 0, 0, oShopItemUltra_Hook))
        {
            Uses = 1;
            InvPosition = 99;
        }
    }
    
    if (any_challenge_active())
        instance_create_depth(520, -30, -1, oEleanorChallengeIndicator);
}

function eleanor_challenge_active(arg0)
{
    if (global.GuardParameters.perma_challenge == arg0)
        return true;
    
    if (!any_challenge_active())
        return false;
    
    if (global.EleanorChallenge.ID == arg0)
        return true;
    
    return false;
}

function any_challenge_active()
{
    return is_struct(global.EleanorChallenge);
}

function apply_eleanor_challenge(arg0, arg1, arg2, arg3)
{
    global.EleanorChallenge = 
    {
        ID: arg0,
        Value: arg1,
        Reward: arg2,
        RoundsLeft: arg3,
        IsPlus: (arg3 == 1) ? false : true
    };
    global.RepeatPrevention.Challenges = arg0;
}

function eleanor_challenge_exception(arg0)
{
    if (arg0 == global.RepeatPrevention.Challenges)
        return false;
    
    if (arg0 == global.GuardParameters.perma_challenge)
        return false;
    
    if (arg0 == UnknownEnum.Value_7 && (!global.UnlockedAnimatronics[UnknownEnum.Value_127] || has_upgrade(UnknownEnum.Value_60, false)))
        return false;
    
    if (arg0 == UnknownEnum.Value_5 && guard_ability_in_party(UnknownEnum.Value_11))
        return false;
    
    if (arg0 == UnknownEnum.Value_9 && (guard_ability_in_party(UnknownEnum.Value_19) || guard_ability_in_party(UnknownEnum.Value_8)))
        return false;
    
    if (arg0 == UnknownEnum.Value_12 && array_length(global.Upgrades) < 3)
        return false;
    
    if (arg0 == UnknownEnum.Value_16 && array_length(global.EndlessInventory.WhackedChars) == 0)
        return false;
    
    return true;
}

function get_eleanor_challenges(arg0 = -1, arg1 = false)
{
    var Inventory = [];
    var TheNextRound = (arg1 == 2) ? "this round" : (arg1 ? "the next three rounds" : "the next round");
    
    if (arg1 == 10)
        TheNextRound = "the entire run";
    
    Inventory[UnknownEnum.Value_10] = 
    {
        Name: "Lucky Day",
        Desc: string("Every 30 seconds for {0}, a King's Prize will activate.", TheNextRound),
        Value: 5,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_8] = 
    {
        Name: "Find Player 2",
        Desc: string("Things will get a little retro for {0}.", TheNextRound),
        Value: 10,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_1] = 
    {
        Name: "Felix the Shark",
        Desc: string("You will start {0} in token debt. Pay it off before 6 AM.", TheNextRound),
        Value: 12,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_3] = 
    {
        Name: "Lonely Freddy",
        Desc: string("Half of your minigames will be disabled for {0}.", TheNextRound),
        Value: 13,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_0] = 
    {
        Name: "Out of Stock",
        Desc: string("Disables Mendo's shop for {0}.", TheNextRound),
        Value: 14,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_2] = 
    {
        Name: "Into the Pit",
        Desc: string("Your power will be reduced by 25% for {0}.", TheNextRound),
        Value: 15,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_14] = 
    {
        Name: "Fetch",
        Desc: string("For {0}, the night will not end until you've beaten Eleanor's score on a random minigame.", TheNextRound),
        Value: 15,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_9] = 
    {
        Name: "1:35 AM",
        Desc: string("Nights will be {0} longer for {1}.", speedup_seconds_string(60, true), TheNextRound),
        Value: 16,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_13] = 
    {
        Name: "Sea Bonnies",
        Desc: string("For {0}, your office will be underwater.", TheNextRound),
        Value: 16,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_5] = 
    {
        Name: "Breaking Wheel",
        Desc: string("Any jumpscare within {0} cannot be blocked and will immediately end your run.", TheNextRound),
        Value: 16,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_12] = 
    {
        Name: "The Real You",
        Desc: string("All your upgrades will be disabled for {0}.", TheNextRound),
        Value: 17,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_6] = 
    {
        Name: "Friendly Face",
        Desc: string("For {0}, the identities of animatronics will be obscured when making selections.", TheNextRound),
        Value: 18,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_15] = 
    {
        Name: "Dance With Me",
        Desc: string("The screen will be upside-down for {0}.", TheNextRound),
        Value: 18,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_4] = 
    {
        Name: "Blackbird",
        Desc: string("You will need to beat {0} in complete darkness.", TheNextRound),
        Value: 19,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_11] = 
    {
        Name: "Room For One More",
        Desc: string("A temporary, randomly selected animatronic will be added at the start of {0}.", TheNextRound),
        Value: 20,
        HasPlusVersion: false
    };
    Inventory[UnknownEnum.Value_7] = 
    {
        Name: "The Scoop",
        Desc: string("Phony Boss will be active for {0}.", TheNextRound),
        Value: 25,
        HasPlusVersion: true
    };
    Inventory[UnknownEnum.Value_16] = 
    {
        Name: "Together Forever",
        Desc: string("Any animatronic you've removed this run will be brought back for {0}.", TheNextRound),
        Value: (array_length(global.EndlessInventory.WhackedChars) * 5) + 5,
        HasPlusVersion: true
    };
    
    if (arg0 == -1)
        return Inventory;
    else
        return Inventory[arg0];
}

function eleanor_challenge_calculate_price(arg0, arg1)
{
    var BasePayout = get_eleanor_challenges(arg0).Value * arg1;
    return calc_price(BasePayout * lerp(0.4, 0.9, min(global.EndlessRound, 10) / 10));
}

function speedup_seconds(arg0, arg1 = false, arg2 = true)
{
    if (arg1)
        arg0 *= (has_upgrade(UnknownEnum.Value_46) ? 2 : (has_upgrade(UnknownEnum.Value_45) ? 1.5 : 1));
    
    return round(arg0 / lerp(global.NightSpeedup, arg2 ? 1 : global.NightSpeedup, 0.5));
}

function speedup_seconds_string(arg0, arg1 = false, arg2 = false, arg3 = true)
{
    var seconds = speedup_seconds(arg0, arg2, arg3);
    
    if (seconds == 60)
        return (arg1 ? "an " : "") + "hour";
    else
        return string("{0} seconds", seconds);
}

function speedup_tokens(arg0)
{
    return round(arg0 / lerp(1, global.NightSpeedup, 0.5));
}

function get_starting_AM()
{
    var StartSecond = 6 - (6 / global.NightSpeedup);
    return (StartSecond == 0) ? 12 : StartSecond;
}

function get_available_cartridge_ids()
{
    if (!global.GuardParameters.cartridges_purchasable)
        return [];
    
    var EleanorHold = -1;
    
    if (any_challenge_active() && global.EleanorChallenge.Reward == UnknownEnum.Value_1)
        EleanorHold = global.EleanorChallenge.Value;
    
    var ReturnInventory = [];
    
    for (var i = 0; i < 16; i++)
    {
        if (array_contains(global.EndlessInventory.Cartridges, i) || i == UnknownEnum.Value_7 || i == EleanorHold || array_contains(global.GuardParameters.blacklist_cartridges, i))
            continue;
        
        array_push(ReturnInventory, i);
    }
    
    return ReturnInventory;
}

function get_available_consumable_ids()
{
    if (!global.GuardParameters.consumables_purchasable)
        return [];
    
    var ReturnInventory = countup_array(11);
    return ReturnInventory;
}

function get_available_challenge_ids()
{
    var ReturnInventory = [];
    var ChallengeAmount = array_length(get_eleanor_challenges());
    
    for (var i = 0; i < ChallengeAmount; i++)
    {
        if (!eleanor_challenge_exception(i))
            continue;
        
        array_push(ReturnInventory, i);
    }
    
    return ReturnInventory;
}

function get_eleanor_rewards()
{
    return array_concat(get_rewards(UnknownEnum.Value_0), get_rewards(UnknownEnum.Value_1), get_rewards(UnknownEnum.Value_2));
}

function get_rewards(arg0)
{
    var ReturnArr = [];
    var AvailableUpgrades = [];
    var UpgradeList = [];
    var FillerDesc = "";
    
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            AvailableUpgrades = get_available_upgrade_ids();
            UpgradeList = get_upgrades();
            break;
            break;
        
        case UnknownEnum.Value_1:
            AvailableUpgrades = get_available_cartridge_ids();
            UpgradeList = get_shop_minigames();
            break;
        
        case UnknownEnum.Value_2:
            AvailableUpgrades = get_available_consumable_ids();
            UpgradeList = get_consumables();
            break;
    }
    
    for (var i = 0; i < array_length(AvailableUpgrades); i++)
    {
        var UpgradeID = AvailableUpgrades[i];
        var Upgrade = UpgradeList[UpgradeID];
        array_push(ReturnArr, 
        {
            Name: Upgrade.Name,
            Desc: Upgrade.Desc,
            Price: calc_price(Upgrade.Price),
            Value: UpgradeID,
            Reward: arg0
        });
    }
    
    return ReturnArr;
}

function get_reward(arg0 = 0, arg1 = 0)
{
    switch (arg1)
    {
        case UnknownEnum.Value_0:
            return get_upgrades(arg0);
        
        case UnknownEnum.Value_1:
            return get_shop_minigames(arg0);
        
        case UnknownEnum.Value_2:
            return get_consumables(arg0);
    }
}

function get_regimen(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            
        
        case UnknownEnum.Value_1:
            return 
            {
                Name: "Vent Regimen",
                Desc: "Vent animatronics are more likely to appear."
            };
        
        case UnknownEnum.Value_2:
            return 
            {
                Name: "Mask Regimen",
                Desc: "Mask animatronics are more likely to appear."
            };
        
        case UnknownEnum.Value_3:
            return 
            {
                Name: "Office Regimen",
                Desc: "Office and Window animatronics are more likely to appear."
            };
        
        case UnknownEnum.Value_4:
            return 
            {
                Name: "Camera Regimen",
                Desc: "Camera animatronics are more likely to appear."
            };
        
        case UnknownEnum.Value_5:
            return 
            {
                Name: "Turnaround Regimen",
                Desc: "Turnaround animatronics are more likely to appear."
            };
        
        case UnknownEnum.Value_6:
            return 
            {
                Name: "Click Regimen",
                Desc: "Point & Click animatronics are more likely to appear."
            };
        
        case UnknownEnum.Value_7:
            return 
            {
                Name: "Token Regimen",
                Desc: "Token and Shop animatronics are more likely to appear."
            };
        
        case UnknownEnum.Value_8:
            return 
            {
                Name: "Flashlight Regimen",
                Desc: "Flashlight animatronics are more likely to appear."
            };
        
        case UnknownEnum.Value_9:
            return 
            {
                Name: "Sticker Regimen",
                Desc: "Animatronics whose stickers you have yet to collect are more likely to appear."
            };
        
        case UnknownEnum.Value_10:
            return 
            {
                Name: "Lethal Regimen",
                Desc: "Lethal animatronics are more likely to appear."
            };
        
        case UnknownEnum.Value_11:
            return 
            {
                Name: "Nonlethal Regimen",
                Desc: "Nonlethal animatronics are more likely to appear."
            };
        
        case UnknownEnum.Value_12:
            return 
            {
                Name: "Cheap Regimen",
                Desc: "Animatronics with salvage values of $10 or below are more likely to appear."
            };
        
        case UnknownEnum.Value_13:
            return 
            {
                Name: "Pricey Regimen",
                Desc: "Animatronics with salvage values of $20 or higher are more likely to appear."
            };
        
        case UnknownEnum.Value_14:
            return 
            {
                Name: "Classic Regimen",
                Desc: "Animatronics introduced in Five Nights at Frickbear's 3 are more likely to appear."
            };
        
        case UnknownEnum.Value_15:
            return 
            {
                Name: "Modern Regimen",
                Desc: "Animatronics introduced in Four Layers Down are more likely to appear."
            };
        
        case UnknownEnum.Value_16:
            return 
            {
                Name: "Upgrade Regimen",
                Desc: "Rockstar Freddy's shop is guaranteed to appear every round."
            };
        
        case UnknownEnum.Value_17:
            return 
            {
                Name: "Consumable Regimen",
                Desc: "Rockstar Chica's shop is guaranteed to appear every round."
            };
        
        case UnknownEnum.Value_18:
            return 
            {
                Name: "Minigame Regimen",
                Desc: "Rockstar Bonnie and Carnie's shops are significantly more likely to appear."
            };
        
        case UnknownEnum.Value_19:
            return 
            {
                Name: "Challenge Regimen",
                Desc: "Challenge shops are significantly more likely to appear."
            };
        
        case UnknownEnum.Value_20:
            return 
            {
                Name: "Green Regimen",
                Desc: "Green animatronics are more likely to appear."
            };
    }
    
    return 
    {
        Name: "",
        Desc: "No active regimen."
    };
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_65,
    Value_66,
    Value_127 = 127,
    Value_131 = 131,
    Value_132,
    Value_133,
    Value_134,
    Value_135,
    Value_136,
    Value_137,
    Value_138,
    Value_139,
    Value_140,
    Value_141,
    Value_142,
    Value_143
}
