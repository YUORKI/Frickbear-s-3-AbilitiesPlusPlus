RerollPrice = 0;
Rerolls = -1;
ItemIcons = sShopItemSalvageIcons;

if (has_upgrade(UnknownEnum.Value_30))
    RerollPrice = -3;

if (in_salvage_location())
    global.Shop = UnknownEnum.Value_0;

function generate_inventory(arg0)
{
    Rerolls++;
    RerollPrice += 3;
    
    var SortFunction = function(arg0, arg1)
    {
        return arg0.Price - arg1.Price;
    };
    
    ShopInventory = [];
    var InventorySpace = 3;
    var EndlessMode = room == EndlessShop;
    var RerollsAvailable = true;
    var SortByPrice = true;
    
    switch (global.Shop)
    {
        case UnknownEnum.Value_0:
            InventorySpace = 7 + has_upgrade(UnknownEnum.Value_41);
            var UpgradeList = get_upgrades();
            var AvailableUpgrades = get_available_upgrade_ids();
            
            for (var i = 0; i < array_length(AvailableUpgrades); i++)
            {
                var UpgradeID = AvailableUpgrades[i];
                var Upgrade = UpgradeList[UpgradeID];
                
                if (array_contains(arg0, UpgradeID) || UpgradeID == UnknownEnum.Value_41)
                    continue;
                
                array_push(ShopInventory, 
                {
                    Name: Upgrade.Name,
                    Desc: Upgrade.Desc,
                    Price: calc_price(Upgrade.Price),
                    ID: UpgradeID
                });
            }
            
            ShopInventory = array_shuffle(ShopInventory);
            
            if (!has_upgrade(UnknownEnum.Value_31))
            {
                repeat (array_length(ShopInventory) - InventorySpace)
                    array_delete(ShopInventory, irandom(array_length(ShopInventory) - 1), 1);
            }
            
            if (!has_upgrade(UnknownEnum.Value_41) && !EndlessMode)
            {
                var Upgrade = UpgradeList[UnknownEnum.Value_41];
                array_push(ShopInventory, 
                {
                    Name: Upgrade.Name,
                    Desc: Upgrade.Desc,
                    Price: calc_price(Upgrade.Price),
                    ID: UnknownEnum.Value_41
                });
            }
            
            break;
        
        case UnknownEnum.Value_1:
            InventorySpace = 6;
            RerollsAvailable = false;
            ItemIcons = global.GuardParameters.randomize_minigames ? sMinigameCarts_Mystery : sMinigameCarts;
            var UpgradeList = get_shop_minigames();
            var AvailableUpgrades = get_available_cartridge_ids();
            
            for (var i = 0; i < array_length(AvailableUpgrades); i++)
            {
                var UpgradeID = AvailableUpgrades[i];
                var Upgrade = UpgradeList[UpgradeID];
                
                if (global.GuardParameters.randomize_minigames)
                {
                    InventorySpace = 3;
                    array_push(ShopInventory, 
                    {
                        Name: "Minigame Slot",
                        Desc: "One more minigame will be available to play each round.",
                        Price: calc_price(15),
                        ID: i
                    });
                }
                else
                {
                    array_push(ShopInventory, 
                    {
                        Name: Upgrade.Name,
                        Desc: Upgrade.Desc,
                        Price: calc_price(Upgrade.Price),
                        ID: UpgradeID
                    });
                }
            }
            
            ShopInventory = array_shuffle(ShopInventory);
            
            repeat (array_length(ShopInventory) - InventorySpace)
                array_delete(ShopInventory, irandom(array_length(ShopInventory) - 1), 1);
            
            for (var i = 0; i < array_length(ShopInventory); i++)
            {
                if (array_length(ShopInventory) <= InventorySpace)
                    break;
                
                if (array_contains(arg0, ShopInventory[i].Name))
                {
                    array_delete(ShopInventory, i, 1);
                    i = max(i - 1, 0);
                }
            }
            
            break;
        
        case UnknownEnum.Value_2:
            InventorySpace = 6;
            RerollsAvailable = false;
            ItemIcons = sShop_ConsumableIcons;
            var UpgradeList = get_consumables();
            
            for (var i = 0; i < array_length(UpgradeList); i++)
            {
                var Include = true;
                var Upgrade = UpgradeList[i];
                
                if (i == UnknownEnum.Value_9)
                    Include = false;
                
                for (var inv = 0; inv < array_length(global.EndlessInventory.Consumables); inv++)
                {
                    if (global.EndlessInventory.Consumables[inv].ID == i)
                        Include = false;
                }
                
                if (Include)
                {
                    array_push(ShopInventory, 
                    {
                        Name: Upgrade.Name,
                        Desc: Upgrade.Desc,
                        Price: calc_price(Upgrade.Price),
                        Uses: Upgrade.Uses,
                        ID: i
                    });
                }
            }
            
            ShopInventory = array_shuffle(ShopInventory);
            
            repeat (array_length(ShopInventory) - InventorySpace)
                array_delete(ShopInventory, irandom(array_length(ShopInventory) - 1), 1);
            
            for (var i = 0; i < array_length(ShopInventory); i++)
            {
                if (array_length(ShopInventory) <= InventorySpace)
                    break;
                
                if (array_contains(arg0, ShopInventory[i].Name))
                {
                    array_delete(ShopInventory, i, 1);
                    i = max(i - 1, 0);
                }
            }
            
            break;
        
        case UnknownEnum.Value_3:
            RerollsAvailable = false;
            ItemIcons = sShop_ChestIcons;
            array_push(ShopInventory, 
            {
                Name: "Swashbuckler's Chest",
                Desc: "Guarantees a random, low-value reward. Cheap, but reliable!",
                Price: calc_price(5),
                ID: 0
            });
            array_push(ShopInventory, 
            {
                Name: "First Mate's Chest",
                Desc: "Can grant a random, medium-value reward...but also has a chance of being empty.",
                Price: calc_price(10),
                ID: 1
            });
            array_push(ShopInventory, 
            {
                Name: "Captain's Chest",
                Desc: "Can grant a random, high-value reward...but may also contain a trap. Not for the faint of heart!",
                Price: calc_price(20),
                ID: 2
            });
            break;
        
        case UnknownEnum.Value_5:
            ItemIcons = sNOTHING;
            var Killables = generate_kill_list(true);
            
            for (var i = 0; i < array_length(global.AllTimeSalvages); i++)
            {
                var Character = global.AllTimeSalvages[i];
                
                if (!array_contains(Killables, Character))
                    continue;
                
                array_push(ShopInventory, 
                {
                    Name: global.Descriptions[Character][0],
                    Desc: "Who's givin' you trouble, kid?",
                    Price: calc_price(((Character == UnknownEnum.Value_46) ? 0 : 5) + ((get_animatronic_data(Character).SalvageValue / 100) * 1.5)),
                    ID: i
                });
            }
            
            ShopInventory = array_shuffle(ShopInventory);
            RerollsAvailable = false;
            break;
        
        case UnknownEnum.Value_4:
            RerollsAvailable = false;
            ItemIcons = sShop_LifeIcons;
            
            if (lives_left() < 3)
            {
                array_push(ShopInventory, 
                {
                    Name: "Standard Heal",
                    Desc: "Recover a single life.",
                    Price: get_heal_price(),
                    ID: 0
                });
            }
            
            if (lives_left() <= 1)
            {
                array_push(ShopInventory, 
                {
                    Name: "Full Heal",
                    Desc: "Heal yourself back to 3 lives.",
                    Price: get_heal_price(1.5),
                    ID: 1
                });
            }
            
            break;
        
        case UnknownEnum.Value_6:
            InventorySpace = 99;
            RerollsAvailable = true;
            SortByPrice = false;
            ItemIcons = sShop_RegimenIcon;
            ShopInventory = [
            {
                Name: "Door Regimen",
                Desc: "Door animatronics are more likely to appear.",
                Price: calc_price(10),
                ID: UnknownEnum.Value_0
            }, 
            {
                Name: "Vent Regimen",
                Desc: "Vent animatronics are more likely to appear.",
                Price: calc_price(10),
                ID: UnknownEnum.Value_1
            }, 
            {
                Name: "Mask Regimen",
                Desc: "Mask animatronics are more likely to appear.",
                Price: calc_price(15),
                ID: UnknownEnum.Value_2
            }, 
            {
                Name: "Office Regimen",
                Desc: "Office and Window animatronics are more likely to appear.",
                Price: calc_price(12),
                ID: UnknownEnum.Value_3
            }, 
            {
                Name: "Camera Regimen",
                Desc: "Camera animatronics are more likely to appear.",
                Price: calc_price(8),
                ID: UnknownEnum.Value_4
            }, 
            {
                Name: "Turnaround Regimen",
                Desc: "Turnaround animatronics are more likely to appear.",
                Price: calc_price(15),
                ID: UnknownEnum.Value_5
            }, 
            {
                Name: "Click Regimen",
                Desc: "Point & Click animatronics are more likely to appear.",
                Price: calc_price(12),
                ID: UnknownEnum.Value_6
            }, 
            {
                Name: "Token Regimen",
                Desc: "Token and Shop animatronics are more likely to appear.",
                Price: calc_price(10),
                ID: UnknownEnum.Value_7
            }, 
            {
                Name: "Flashlight Regimen",
                Desc: "Flashlight animatronics are more likely to appear.",
                Price: calc_price(12),
                ID: UnknownEnum.Value_8
            }, 
            {
                Name: "Sticker Regimen",
                Desc: "Animatronics whose stickers you have yet to collect are more likely to appear.",
                Price: calc_price(10),
                ID: UnknownEnum.Value_9
            }];
            array_push(ShopInventory, choose(
            {
                Name: "Lethal Regimen",
                Desc: "Lethal animatronics are more likely to appear.",
                Price: calc_price(8),
                ID: UnknownEnum.Value_10
            }, 
            {
                Name: "Nonlethal Regimen",
                Desc: "Nonlethal animatronics are more likely to appear.",
                Price: calc_price(15),
                ID: UnknownEnum.Value_11
            }));
            array_push(ShopInventory, choose(
            {
                Name: "Cheap Regimen",
                Desc: "Animatronics with salvage values of $10 or below are more likely to appear.",
                Price: calc_price(15),
                ID: UnknownEnum.Value_12
            }, 
            {
                Name: "Pricey Regimen",
                Desc: "Animatronics with salvage values of $20 or higher are more likely to appear.",
                Price: calc_price(8),
                ID: UnknownEnum.Value_13
            }));
            array_push(ShopInventory, choose(
            {
                Name: "Classic Regimen",
                Desc: "Animatronics introduced in Five Nights at Frickbear's 3 are more likely to appear.",
                Price: calc_price(10),
                ID: UnknownEnum.Value_14
            }, 
            {
                Name: "Modern Regimen",
                Desc: "Animatronics introduced in Four Layers Down are more likely to appear.",
                Price: calc_price(10),
                ID: UnknownEnum.Value_15
            }));
            array_push(ShopInventory, 
            {
                Name: "Upgrade Regimen",
                Desc: "Rockstar Freddy's shop is guaranteed to appear every round.",
                Price: calc_price(10),
                ID: UnknownEnum.Value_16
            });
            array_push(ShopInventory, 
            {
                Name: "Consumable Regimen",
                Desc: "Rockstar Chica's shop is guaranteed to appear every round.",
                Price: calc_price(10),
                ID: UnknownEnum.Value_17
            });
            array_push(ShopInventory, 
            {
                Name: "Minigame Regimen",
                Desc: "Rockstar Bonnie and Carnie's shops are significantly more likely to appear.",
                Price: calc_price(10),
                ID: UnknownEnum.Value_18
            });
            array_push(ShopInventory, 
            {
                Name: "Challenge Regimen",
                Desc: "Challenge shops are significantly more likely to appear.",
                Price: calc_price(8),
                ID: UnknownEnum.Value_19
            });
            
            if (irandom(4) == 0)
            {
                array_push(ShopInventory, 
                {
                    Name: "Green Regimen",
                    Desc: "Green animatronics are more likely to appear.",
                    Price: calc_price(3),
                    ID: UnknownEnum.Value_20
                });
            }
            
            array_push(ShopInventory, 
            {
                Name: "Reset",
                Desc: "Removes your current regimen.",
                Price: calc_price(0),
                ID: -1
            });
            
            for (var i = 0; i < array_length(ShopInventory); i++)
            {
                if (array_length(ShopInventory) <= InventorySpace)
                    break;
                
                if (array_contains(arg0, ShopInventory[i].Name))
                {
                    array_delete(ShopInventory, i, 1);
                    i = max(i - 1, 0);
                }
            }
            
            RerollsAvailable = false;
            break;
        
        case UnknownEnum.Value_8:
            InventorySpace = 4;
            RerollsAvailable = false;
            ItemIcons = sEleanorChallengeIcons_Shop;
            var AvailableUpgrades = get_available_challenge_ids();
            var UpgradeList = get_eleanor_challenges();
            
            for (i = 0; i < array_length(AvailableUpgrades); i++)
            {
                var UpgradeID = AvailableUpgrades[i];
                var Upgrade = UpgradeList[UpgradeID];
                var PayoutVal = eleanor_challenge_calculate_price(UpgradeID, 1);
                array_push(ShopInventory, 
                {
                    Name: Upgrade.Name,
                    Desc: Upgrade.Desc,
                    Price: 0,
                    ID: UpgradeID,
                    Value: PayoutVal,
                    Reward: UnknownEnum.Value_3,
                    InternalValue: PayoutVal
                });
            }
            
            ShopInventory = array_shuffle(ShopInventory);
            
            repeat (array_length(ShopInventory) - InventorySpace)
                array_delete(ShopInventory, irandom(array_length(ShopInventory) - 1), 1);
            
            for (i = 0; i < array_length(ShopInventory); i++)
            {
                if (array_length(ShopInventory) <= InventorySpace)
                    break;
                
                if (array_contains(arg0, ShopInventory[i].Name))
                {
                    array_delete(ShopInventory, i, 1);
                    i = max(i - 1, 0);
                }
            }
            
            var ChallengesToPlusify = 2;
            var i = InventorySpace - 1;
            
            while (i >= (InventorySpace - ChallengesToPlusify))
            {
                with (ShopInventory[i])
                {
                    var PayoutVal = eleanor_challenge_calculate_price(ID, 3);
                    Name += "+";
                    Desc = get_eleanor_challenges(ID, true).Desc;
                    Value = PayoutVal;
                    InternalValue = PayoutVal;
                }
                
                i--;
            }
            
            SortFunction = function(arg0, arg1)
            {
                return arg0.InternalValue - arg1.InternalValue;
            };
            
            PossibleRewards = array_shuffle(get_eleanor_rewards());
            
            for (i = 0; i < array_length(PossibleRewards); i++)
                PossibleRewards[i].Priority = irandom(4) + (PossibleRewards[i].Reward == UnknownEnum.Value_2);
            
            array_sort(PossibleRewards, function(arg0, arg1)
            {
                return arg1.Priority - arg0.Priority;
            });
            show_debug_message(PossibleRewards);
            var GuaranteedCashSkip = irandom(1);
            var GuaranteedCashSkipAlt = irandom(1) + 2;
            
            for (i = 0; i < array_length(ShopInventory); i++)
            {
                if (i == GuaranteedCashSkip || i == GuaranteedCashSkipAlt)
                    continue;
                
                var ChallengePrice = ShopInventory[i].InternalValue;
                
                for (var pos = 0; pos < array_length(PossibleRewards); pos++)
                {
                    var ThisReward = PossibleRewards[pos];
                    var RewardPrice = ThisReward.Price;
                    
                    if (RewardPrice >= min(ChallengePrice, calc_price(50)) && RewardPrice <= (ChallengePrice + 15))
                    {
                        ShopInventory[i].Reward = ThisReward.Reward;
                        ShopInventory[i].Value = floor(ThisReward.Value);
                        array_delete(PossibleRewards, pos, 1);
                        pos = array_length(PossibleRewards);
                    }
                }
                
                var DescAddon = "$" + string_format(ChallengePrice, 1, 2);
                
                if (ShopInventory[i].Reward == UnknownEnum.Value_0)
                    DescAddon = get_upgrades(ShopInventory[i].Value).Name;
                
                if (ShopInventory[i].Reward == UnknownEnum.Value_1)
                    DescAddon = get_shop_minigames(ShopInventory[i].Value).Name;
                
                if (ShopInventory[i].Reward == UnknownEnum.Value_2)
                    DescAddon = get_consumables(ShopInventory[i].Value).Name;
                
                ShopInventory[i].Desc += " (REWARD: " + DescAddon + ")";
            }
            
            break;
        
        case UnknownEnum.Value_12:
            RerollsAvailable = false;
            InventorySpace = 3;
            SortByPrice = false;
            RewardPool = array_shuffle(get_eleanor_rewards());
            var PotentialUpgrades = [];
            
            for (var i = 0; i < array_length(global.Upgrades); i++)
            {
                var upgrade = get_upgrades(global.Upgrades[i]);
                array_push(PotentialUpgrades, 
                {
                    Name: upgrade.Name,
                    Desc: "",
                    InternalValue: get_upgrade_true_value(global.Upgrades[i]),
                    Price: 0,
                    ID: global.Upgrades[i],
                    Reward: -1,
                    Value: -1,
                    UpgradeLost: -1
                });
            }
            
            function find_trade_reward(arg0, arg1, arg2)
            {
                var LowerBound = calc_price(arg1[arg0].InternalValue) + 8;
                var UpperBound = calc_price(arg1[arg0].InternalValue) + 30;
                
                for (var r = 0; r < array_length(RewardPool); r++)
                {
                    var ThisReward = RewardPool[r];
                    
                    if (ThisReward.Reward == UnknownEnum.Value_0 && array_length(get_upgrades(ThisReward.Value).StepDown) > 0)
                        continue;
                    
                    var Val = ThisReward.Price;
                    
                    if (Val > LowerBound && Val <= UpperBound && !array_contains(arg2, ThisReward.Value))
                    {
                        return ThisReward;
                    }
                    else if (ThisReward.Reward == UnknownEnum.Value_0)
                    {
                        var NextStep = get_upgrades(ThisReward.Value).StepUp;
                        
                        if (array_length(NextStep) == 0)
                        {
                            continue;
                        }
                        else
                        {
                            ThisReward = choose_from_array(NextStep);
                            Val = calc_price(get_upgrade_true_value(ThisReward));
                            NextStep = get_upgrades(ThisReward).StepUp;
                            
                            if (Val > LowerBound && Val <= UpperBound && !array_contains(arg2, ThisReward))
                            {
                                var Upgrade = get_upgrades(ThisReward);
                                return 
                                {
                                    Name: Upgrade.Name,
                                    Desc: Upgrade.Desc,
                                    Price: Val,
                                    Value: ThisReward,
                                    Reward: UnknownEnum.Value_0
                                };
                            }
                            else if (array_length(NextStep) > 0)
                            {
                                ThisReward = choose_from_array(NextStep);
                                Val = calc_price(get_upgrade_true_value(ThisReward));
                                
                                if (Val > LowerBound && Val <= UpperBound && !array_contains(arg2, ThisReward))
                                {
                                    var Upgrade = get_upgrades(ThisReward);
                                    return 
                                    {
                                        Name: Upgrade.Name,
                                        Desc: Upgrade.Desc,
                                        Price: Val,
                                        Value: ThisReward,
                                        Reward: UnknownEnum.Value_0
                                    };
                                }
                            }
                        }
                    }
                }
                
                return -1;
            }
            
            var Exclude = [];
            
            for (var i = 0; i < array_length(PotentialUpgrades); i++)
            {
                var ThisReward = find_trade_reward(i, PotentialUpgrades, Exclude);
                show_debug_message(string("EXCLUSIONS: {0}", Exclude));
                
                if (ThisReward != -1)
                {
                    array_push(Exclude, ThisReward.Value);
                    array_push(ShopInventory, 
                    {
                        UpgradeLost: PotentialUpgrades[i].ID,
                        Desc: ThisReward.Desc + string(" (LOSE: {0})", PotentialUpgrades[i].Name),
                        Name: ThisReward.Name,
                        Price: 0,
                        ID: ThisReward.Value,
                        InternalValue: PotentialUpgrades[i].InternalValue,
                        Reward: ThisReward.Reward
                    });
                }
            }
            
            repeat (array_length(ShopInventory) - InventorySpace)
                array_delete(ShopInventory, irandom(array_length(ShopInventory) - 1), 1);
            
            array_sort(ShopInventory, function(arg0, arg1)
            {
                return arg1.InternalValue - arg0.InternalValue;
            });
            break;
        
        case UnknownEnum.Value_7:
            global.CarnieItemReward = choose(UnknownEnum.Value_4, UnknownEnum.Value_9, -1);
            InventorySpace = 3;
            RerollsAvailable = false;
            SortByPrice = false;
            ItemIcons = sMinigameCarts;
            var UpgradeList = get_available_cartridge_ids();
            
            for (var i = 0; i < array_length(UpgradeList); i++)
            {
                var GameID = UpgradeList[i];
                var Upgrade = get_shop_minigames(GameID);
                array_push(ShopInventory, 
                {
                    Name: get_minigame_data(GameID).Name,
                    Desc: Upgrade.Desc,
                    Price: calc_price(4),
                    ID: GameID
                });
            }
            
            ShopInventory = array_shuffle(ShopInventory);
            
            repeat (array_length(ShopInventory) - InventorySpace)
                array_delete(ShopInventory, irandom(array_length(ShopInventory) - 1), 1);
            
            for (var i = 0; i < array_length(ShopInventory); i++)
            {
                if (array_length(ShopInventory) <= InventorySpace)
                    break;
                
                if (array_contains(arg0, ShopInventory[i].Name))
                {
                    array_delete(ShopInventory, i, 1);
                    i = max(i - 1, 0);
                }
            }
            
            if (array_length(ShopInventory) > 0)
            {
                var GameID = min(array_length(ShopInventory) - 1, 1);
                ShopInventory[GameID].Name = ShopInventory[1].Name + "+";
                ShopInventory[GameID].Price = calc_price(8);
                GameID = min(array_length(ShopInventory) - 1, 2);
                ShopInventory[GameID].Name = ShopInventory[2].Name + "++";
                ShopInventory[GameID].Price = calc_price(12);
            }
            
            break;
        
        case UnknownEnum.Value_9:
            RerollsAvailable = false;
            SortByPrice = false;
            ItemIcons = sNOTHING;
            ShopInventory = [];
            
            if (global.EndlessRound != 10)
            {
                array_push(ShopInventory, 
                {
                    Name: string("Skip to Round {0}", global.EndlessRound + 1),
                    Desc: "Skip the next round.",
                    Price: calc_price(10),
                    ID: 1
                });
            }
            
            if (global.EndlessRound > 1)
            {
                array_push(ShopInventory, 
                {
                    Name: string("Repeat Round {0}", global.EndlessRound - 1),
                    Desc: "Repeat the last round.",
                    Price: calc_price(5),
                    ID: -1
                });
            }
            
            if ((global.EndlessRound + 3) <= 10)
            {
                array_insert(ShopInventory, 0, 
                {
                    Name: string("Skip to Round {0}", global.EndlessRound + 3),
                    Desc: "Skip the next three rounds.",
                    Price: calc_price(20),
                    ID: 3
                });
            }
            
            break;
        
        default:
            break;
    }
    
    if (SortByPrice)
        array_sort(ShopInventory, SortFunction);
    
    if (RerollsAvailable)
    {
        if (!has_upgrade(UnknownEnum.Value_31))
        {
            array_push(ShopInventory, 
            {
                Name: "Reroll",
                Desc: "Reset the shop's inventory.",
                Price: calc_price(RerollPrice)
            });
        }
    }
    
    array_push(ShopInventory, 
    {
        Name: "Back",
        Desc: "",
        Price: 0
    });
}

generate_inventory([]);
event_inherited();
HeardStory = false;

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
    Value_30 = 30,
    Value_31,
    Value_41 = 41,
    Value_46 = 46
}
