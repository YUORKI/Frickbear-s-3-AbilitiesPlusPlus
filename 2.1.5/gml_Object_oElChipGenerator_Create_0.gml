global.Upgrades = [UnknownEnum.Value_11, UnknownEnum.Value_51, UnknownEnum.Value_45, UnknownEnum.Value_8, UnknownEnum.Value_43];
ShopInventory = [];
var InventorySpace = 3;
RewardPool = array_shuffle(get_eleanor_rewards());

for (var i = 0; i < array_length(global.Upgrades); i++)
{
    var upgrade = get_upgrades(global.Upgrades[i]);
    array_push(ShopInventory, 
    {
        Name: upgrade.Name,
        Desc: "",
        InternalValue: get_upgrade_true_value(global.Upgrades[i]),
        Price: 0,
        ID: global.Upgrades[i],
        Reward: -1,
        Value: -1
    });
}

function find_trade_reward(arg0)
{
    var LowerBound = calc_price(ShopInventory[arg0].InternalValue) + 5;
    var UpperBound = calc_price(ShopInventory[arg0].InternalValue) + 25;
    
    for (var r = 0; r < array_length(RewardPool); r++)
    {
        var ThisReward = RewardPool[r];
        
        if (ThisReward.Reward == UnknownEnum.Value_0 && array_length(get_upgrades(ThisReward.Value).StepDown) > 0)
            continue;
        
        var Val = ThisReward.Price;
        
        if (Val > LowerBound && Val <= UpperBound)
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
                
                if (Val > LowerBound && Val <= UpperBound)
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
                    
                    if (Val > LowerBound && Val <= UpperBound)
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

for (var i = 0; i < array_length(ShopInventory); i++)
{
    var ThisReward = find_trade_reward(i);
    
    if (ThisReward == -1)
    {
        array_delete(ShopInventory, i, 1);
    }
    else
    {
        with (ShopInventory[i])
        {
            Reward = ThisReward.Reward;
            Value = ThisReward.Value;
            Name += (" -> " + string(ThisReward.Name));
        }
    }
}

repeat (array_length(ShopInventory) - InventorySpace)
    array_delete(ShopInventory, irandom(array_length(ShopInventory) - 1), 1);

enum UnknownEnum
{
    Value_0,
    Value_8 = 8,
    Value_11 = 11,
    Value_43 = 43,
    Value_45 = 45,
    Value_51 = 51
}
