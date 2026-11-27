set_guard_parameters();
WallSize = 64;
FOV = 70.25;
CameraRotation = 0;
CameraX = x;
CameraY = y;
CameraZ = WallSize / 2;
CameraXTo = x;
CameraYTo = y - 32;
CameraZTo = CameraZ;
ShakeX = 0;
ShakeY = 0;
RotationSetting = 0;
LeftWallSurf = -1;
CenterWallSurf = -1;
RightWallSurf = -1;
save_endless_data(room);
AngelMode = room == EndlessShopSelection_FinalNight;
global.Shop = -1;
random_set_seed(global.Seed + global.EndlessRound);

function desc_from_char(arg0)
{
    return string_upper(global.Descriptions[arg0][0]) + "\n" + global.Descriptions[arg0][1];
}

function get_shop_desc(arg0)
{
    switch (arg0)
    {
        case UnknownEnum.Value_0:
            return desc_from_char(UnknownEnum.Value_131);
        
        case UnknownEnum.Value_1:
            return desc_from_char(UnknownEnum.Value_132);
        
        case UnknownEnum.Value_2:
            return desc_from_char(UnknownEnum.Value_133);
        
        case UnknownEnum.Value_3:
            return desc_from_char(UnknownEnum.Value_134);
        
        case UnknownEnum.Value_4:
            return desc_from_char(UnknownEnum.Value_142);
        
        case UnknownEnum.Value_5:
            return desc_from_char(UnknownEnum.Value_135);
        
        case UnknownEnum.Value_6:
            return desc_from_char(UnknownEnum.Value_139);
        
        case UnknownEnum.Value_9:
            return desc_from_char(UnknownEnum.Value_137);
        
        case UnknownEnum.Value_8:
            return desc_from_char(UnknownEnum.Value_138);
        
        case UnknownEnum.Value_7:
            return desc_from_char(UnknownEnum.Value_140);
        
        case UnknownEnum.Value_10:
            return desc_from_char(UnknownEnum.Value_136);
        
        case UnknownEnum.Value_11:
            return desc_from_char(UnknownEnum.Value_143);
        
        case UnknownEnum.Value_12:
            return desc_from_char(UnknownEnum.Value_141);
    }
}

var LastRoundBoost = (global.EndlessRound == 10) * 5;
var CashBonus = global.RunEarnings > 50;
var regimen = global.EndlessInventory.BobbiedotRegimen;
var altregimen = global.GuardParameters.natural_regimen;
var PossibleShops = [
{
    ShopID: UnknownEnum.Value_0,
    Likelihood: irandom_range(-2, 4) + CashBonus + LastRoundBoost
}, 
{
    ShopID: UnknownEnum.Value_1,
    Likelihood: irandom_range(-3, 2) + ((global.EndlessRound >= 5) ? -2 : 0) + ((global.EndlessRound <= 2) ? 5 : 0) + min(0, 6 - (array_length(global.EndlessInventory.Cartridges) * 2))
}, 
{
    ShopID: UnknownEnum.Value_2,
    Likelihood: irandom_range(-2, 2) + LastRoundBoost + min(0, 1 - (array_length(global.EndlessInventory.Consumables) / 2))
}, 
{
    ShopID: UnknownEnum.Value_3,
    Likelihood: (global.EndlessRound == 4 || global.EndlessRound == 7 || global.EndlessRound == 13) ? 99 : -99
}, 
{
    ShopID: UnknownEnum.Value_11,
    Likelihood: (irandom_range(-2, 2) + CashBonus + ((global.EndlessRound <= 2) ? 3 : 0) + (!global.NuzlockeMode * -99) + (array_length(global.Lives) - 4) + ((lives_left() >= 5) ? -99 : 0)) - ((global.RunEarnings < calc_price(20)) * 99)
}, 
{
    ShopID: UnknownEnum.Value_5,
    Likelihood: (irandom_range(-3, 2) + (CashBonus * 2) + LastRoundBoost + (guard_ability(UnknownEnum.Value_20) * -99) + ((global.EndlessRound >= 3) ? 0 : -5)) - array_length(global.EndlessInventory.WhackedChars)
}, 
{
    ShopID: UnknownEnum.Value_4,
    Likelihood: (irandom_range(-2, 2) + LastRoundBoost + ((lives_left() == 3) ? -99 : 1)) - (global.NuzlockeMode * 99)
}, 
{
    ShopID: UnknownEnum.Value_6,
    Likelihood: irandom_range(-5, 2) + ((global.EndlessRound >= 8) * -5) + (global.EndlessInventory.BobbiedotRegimen == "")
}, 
{
    ShopID: UnknownEnum.Value_9,
    Likelihood: irandom_range(-4, 2) + ((global.EndlessRound >= 9) * -99) + ((lives_left() < 3 && !global.NuzlockeMode) * -3)
}, 
{
    ShopID: UnknownEnum.Value_7,
    Likelihood: (irandom_range(-4, 2) - (LastRoundBoost + CashBonus)) + ((guard_ability(UnknownEnum.Value_3) && (global.EndlessRound % 3) == 0) * 25)
}, 
{
    ShopID: UnknownEnum.Value_10,
    Likelihood: ((irandom_range(-4, 2) + ((global.EndlessRound >= 9) * -99) + ((lives_left() < 3 && !global.NuzlockeMode) * -2)) - (LastRoundBoost + CashBonus)) + ((guard_ability(UnknownEnum.Value_3) && (global.EndlessRound % 3) == 1) * 25)
}, 
{
    ShopID: UnknownEnum.Value_8,
    Likelihood: irandom_range(-3, 3) + (CashBonus * -2) + ((global.EndlessRound >= 7 && global.EndlessRound < 11) * -99) + ((lives_left() < 3 && !global.NuzlockeMode) * -2) + ((any_challenge_active() || guard_ability(UnknownEnum.Value_14)) * -99) + ((guard_ability(UnknownEnum.Value_3) && (global.EndlessRound % 2) == 1) * 25)
}, 
{
    ShopID: UnknownEnum.Value_12,
    Likelihood: irandom_range(-2, 2) + LastRoundBoost + ((array_length(global.Upgrades) < 3) * -99)
}];

for (var i = 0; i < array_length(PossibleShops); i++)
{
    var ID = PossibleShops[i].ShopID;
    var Repeat = array_contains(global.RepeatPrevention.Shops, ID);
    
    if (ID == UnknownEnum.Value_0 && (regimen == UnknownEnum.Value_16 || altregimen == UnknownEnum.Value_16))
        PossibleShops[i].Likelihood += 50;
    
    if (ID == UnknownEnum.Value_2 && (regimen == UnknownEnum.Value_17 || altregimen == UnknownEnum.Value_17))
        PossibleShops[i].Likelihood += 50;
    else if ((ID == UnknownEnum.Value_7 || ID == UnknownEnum.Value_1) && (regimen == UnknownEnum.Value_18 || altregimen == UnknownEnum.Value_18) && !Repeat)
        PossibleShops[i].Likelihood += 30;
    else if ((ID == UnknownEnum.Value_10 || ID == UnknownEnum.Value_8) && (regimen == UnknownEnum.Value_19 || altregimen == UnknownEnum.Value_19) && !Repeat)
        PossibleShops[i].Likelihood += 30;
    
    if (Repeat)
        PossibleShops[i].Likelihood -= 10;
    
    if (global.EndlessRoundsBeaten < 1 && array_contains([UnknownEnum.Value_7], ID))
        PossibleShops[i].Likelihood -= 30;
    else if (global.EndlessRoundsBeaten < 2 && array_contains([UnknownEnum.Value_5], ID))
        PossibleShops[i].Likelihood -= 30;
    else if (global.EndlessRoundsBeaten < 5 && array_contains([UnknownEnum.Value_8], ID))
        PossibleShops[i].Likelihood -= 30;
    else if (global.EndlessRoundsBeaten < 7 && array_contains([UnknownEnum.Value_6, UnknownEnum.Value_9], ID))
        PossibleShops[i].Likelihood -= 30;
    else if (global.EndlessRoundsBeaten < 10 && array_contains([UnknownEnum.Value_10], ID))
        PossibleShops[i].Likelihood -= 30;
    
    if (array_contains(global.GuardParameters.boosted_shops, ID) && !((ID == UnknownEnum.Value_4 && global.NuzlockeMode) || (ID == UnknownEnum.Value_11 && !global.NuzlockeMode)))
        PossibleShops[i].Likelihood += 200;
    
    if (array_contains(global.GuardParameters.disabled_shops, ID))
        PossibleShops[i].Likelihood -= 99;
}

array_shuffle(PossibleShops);
array_sort(PossibleShops, function(arg0, arg1)
{
    return arg1.Likelihood - arg0.Likelihood;
});
PickedShops = [PossibleShops[0].ShopID, PossibleShops[1].ShopID];
global.RepeatPrevention.Shops = [PossibleShops[0].ShopID, PossibleShops[1].ShopID];
ThirdShopAvailable = !guard_ability(UnknownEnum.Value_13) || AngelMode;

if (AngelMode)
{
    array_push(PickedShops, UnknownEnum.Value_13);
}
else if (ThirdShopAvailable)
{
    var ThirdShop = PossibleShops[2].ShopID;
    array_push(PickedShops, ThirdShop);
    array_push(global.RepeatPrevention.Shops, ThirdShop);
}

if (AngelMode)
    ThirdShopAvailable = true;
else
    PickedShops = array_shuffle(PickedShops);

TextOffset = 50;
CamRotationH = 0;
FlashTimer = 0;
TransitioningOut = false;
DoorOffset = 0;
TransitionSideLock = 0;
RoundBoxTransition = 0;
audio_play_sound(sfxPowerOn, 25, false);

if (!AngelMode)
{
    spawn_consumables("Shops");
    
    if (guard_ability(UnknownEnum.Value_13))
        instance_create_depth(0, 0, -1, oUltraDoorwayMenu);
}

DoorwayFreeze = false;

for (var i = 0; i < array_length(global.RepeatPrevention.Upgrades); i++)
{
    if (global.RepeatPrevention.Upgrades[i].Duration == 1)
        array_delete(global.RepeatPrevention.Upgrades, i, 1);
    else
        global.RepeatPrevention.Upgrades[i].Duration--;
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
    Value_16 = 16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
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
