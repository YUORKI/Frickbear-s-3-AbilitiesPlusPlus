set_guard_parameters();
random_set_seed(global.Seed + global.EndlessRound);
RandomSeed = random_get_seed();
UltraPickerChar = [];

if (!any_challenge_active() && guard_ability(UnknownEnum.Value_14))
{
    show_debug_message("Elizabeth Mode Activated");
    GuardSprite = undefined;
    instance_create_depth(0, -180, depth + 1, oEndless_EleanorPicker);
    instance_destroy();
    exit;
}

if (array_contains(global.AllTimeSalvages, UnknownEnum.Value_127))
{
    for (var i = 0; i < array_length(global.AllTimeSalvages); i++)
    {
        if (global.AllTimeSalvages[i] == UnknownEnum.Value_127)
        {
            array_delete(global.AllTimeSalvages, i, 1);
            break;
        }
    }
}

global.Guard = global.Lives[array_length(global.Lives) - 1];
PhonyMode = global.EndlessRound == 10 && has_upgrade(UnknownEnum.Value_60);

for (var i = 0; i < array_length(global.Lives); i++)
{
    if (global.TrueAbilityIndex[global.Lives[i]] == UnknownEnum.Value_27 || global.AbilityIndex[global.Lives[i]] == UnknownEnum.Value_27)
    {
        do
            global.AbilityIndex[global.Lives[i]] = irandom(20);
        until (global.AbilityIndex[global.Lives[i]] != UnknownEnum.Value_27);
    }
}

random_set_seed(global.Seed + global.EndlessRound);
GuardSprite = import_sprites("minigame.png", sHD_Guard, 4, 8, 8);
save_endless_data(EndlessSelection);

if (guard_ability(UnknownEnum.Value_20))
    global.EndlessInventory.MarkiplierPoints++;

TileSize = 0;
Active = true;

function ability_check(arg0)
{
    var CharData = get_animatronic_data(arg0);
    
    if (guard_ability(UnknownEnum.Value_0) && CharData.SalvageValue <= 1000)
        return 1;
    
    if (guard_ability(UnknownEnum.Value_2) && CharData.SalvageValue >= 1800)
        return 1;
    
    if (guard_ability(UnknownEnum.Value_4) && arg0 <= UnknownEnum.Value_46)
        return 2;
    
    if (guard_ability(UnknownEnum.Value_5) && arg0 > UnknownEnum.Value_46)
        return 2;
    
    if (array_contains(UltraPickerChar, arg0))
        return 99;
    
    return 0;
}

function regimen_check(arg0, arg1)
{
    var CharData = get_animatronic_data(arg0);
    
    switch (arg1)
    {
        case UnknownEnum.Value_0:
            return array_contains(CharData.DefenseProcedure, "Doors");
        
        case UnknownEnum.Value_2:
            return array_contains(CharData.DefenseProcedure, "Mask");
        
        case UnknownEnum.Value_1:
            return array_contains(CharData.DefenseProcedure, "Vents");
        
        case UnknownEnum.Value_3:
            return array_contains(CharData.DefenseProcedure, "Office") || array_contains(CharData.DefenseProcedure, "Window");
        
        case UnknownEnum.Value_4:
            return array_contains(CharData.DefenseProcedure, "Cameras");
        
        case UnknownEnum.Value_5:
            return array_contains(CharData.DefenseProcedure, "Turnaround");
        
        case UnknownEnum.Value_8:
            return array_contains(CharData.DefenseProcedure, "Flashlight");
        
        case UnknownEnum.Value_6:
            return array_contains(CharData.DefenseProcedure, "Point & Click");
        
        case UnknownEnum.Value_7:
            return array_contains(CharData.DefenseProcedure, "Tokens") || array_contains(CharData.DefenseProcedure, "Shop");
        
        case UnknownEnum.Value_9:
            return global.EndlessStickers[arg0] < global.Difficulty;
        
        case UnknownEnum.Value_10:
            return CharData.Lethality == "Manageable";
        
        case UnknownEnum.Value_11:
            return CharData.Lethality != "Manageable";
        
        case UnknownEnum.Value_12:
            return CharData.SalvageValue <= 1000;
        
        case UnknownEnum.Value_13:
            return CharData.SalvageValue >= 2000;
        
        case UnknownEnum.Value_14:
            return arg0 <= UnknownEnum.Value_46;
        
        case UnknownEnum.Value_15:
            return arg0 > UnknownEnum.Value_46;
        
        case UnknownEnum.Value_20:
            return array_contains(get_animatronic_colors(arg0), "Green");
        
        default:
            return 0;
    }
}

function progress_check(arg0)
{
    if (arg0 < UnknownEnum.Value_20 && global.EndlessRoundsBeaten == 0)
        return 2;
    
    if (arg0 > UnknownEnum.Value_46)
    {
        if (arg0 == FirstNewcomer && global.EndlessRound == 3)
            return 10;
        
        if (get_animatronic_data(arg0).SalvageValue > (global.EndlessRoundsBeaten * 200))
            return -2;
        else
            return 0;
    }
    
    return 0;
}

function calculate_repeat_prevention()
{
    global.RepeatPrevention.Animatronics = [];
    
    for (var i = 0; i < array_length(Choices); i++)
        array_push(global.RepeatPrevention.Animatronics, Choices[i].ID);
}

AveragePrice = 0;

for (var i = 0; i <= 86; i++)
    AveragePrice += (get_animatronic_data(i).SalvageValue / 100);

AveragePrice = round((AveragePrice / UnknownEnum.Value_87) - 1);
rerollMultiplier = 1;
QuotaInflator = 0;

function pick_choices()
{
    random_set_seed(RandomSeed);
    var ColumnLimit = 12;
    var RowLimit = 3;
    var StarterPicks = floor(lerp(3, 5, global.Difficulty / 4));
    var PerRoundPicks = lerp(1, 3, global.Difficulty / 4);
    
    if (guard_ability(UnknownEnum.Value_10))
        PerRoundPicks -= 0.5;
    
    StarterPicks += global.GuardParameters.starting_quota_increase;
    PerRoundPicks += global.GuardParameters.nightly_quota_increase;
    var AnimatronicsByNow = (StarterPicks + 1 + ceil((global.EndlessRound - 1) * PerRoundPicks)) - (array_length(global.EndlessInventory.WhackedChars) - global.EndlessInventory.MarkiplierPoints);
    AnimatronicQuota = max(AnimatronicsByNow - array_length(global.AllTimeSalvages), 0);
    var ChoiceAmount = array_length(UltraPickerChar) + (ceil(AnimatronicQuota * (guard_ability(UnknownEnum.Value_13) ? 2 : 2.5)) + (has_upgrade(UnknownEnum.Value_8) ? 1 : (has_upgrade(UnknownEnum.Value_9) ? 2 : (has_upgrade(UnknownEnum.Value_10) ? 3 : 0))));
    ChoiceAmount *= rerollMultiplier;
    ChoiceAmount = min(ChoiceAmount, ColumnLimit * RowLimit);
    RowCount = ceil(ChoiceAmount / ColumnLimit);
    
    if (AnimatronicQuota <= 0)
        ChoiceAmount = 0;
    else
        ChoiceAmount = ceil(ChoiceAmount / RowCount) * RowCount;
    
    AnimatronicList = [];
    var _Regimen = global.EndlessInventory.BobbiedotRegimen;
    random_set_seed(RandomSeed);
    FirstNewcomer = irandom_range(47, 86);
    
    for (var i = 0; i <= 86; i++)
    {
        if (!array_contains(global.AllTimeSalvages, i))
        {
            var _Priority = irandom_range(-2, 2) + (array_contains(global.GuardParameters.boosted_animatronics, i) * 2) + (regimen_check(i, _Regimen) * 2) + (regimen_check(i, global.GuardParameters.natural_regimen) * 2) + ability_check(i) + progress_check(i) + (array_contains(global.RepeatPrevention.Animatronics, i) * -2) + (array_contains(global.EndlessInventory.WhackedChars, i) * -10);
            var SalvageValue = guard_ability(UnknownEnum.Value_26) ? AveragePrice : (guard_ability(UnknownEnum.Value_12) ? 0 : (get_animatronic_data(i).SalvageValue / 100));
            SalvageValue *= global.GuardParameters.salvage_bonus_multiplier;
            
            if (guard_ability(UnknownEnum.Value_10))
                SalvageValue *= 1.25;
            
            if (guard_ability(UnknownEnum.Value_25))
                SalvageValue *= 2;
            
            if (guard_ability(UnknownEnum.Value_24))
                SalvageValue *= 0.5;
            
            array_push(AnimatronicList, 
            {
                ID: i,
                Price: SalvageValue,
                Priority: _Priority
            });
        }
    }
    
    AnimatronicList = array_shuffle(AnimatronicList);
    array_sort(AnimatronicList, function(arg0, arg1)
    {
        return arg1.Priority - arg0.Priority;
    });
    Choices = [];
    array_copy(Choices, 0, AnimatronicList, 0, ChoiceAmount);
    
    if (PhonyMode)
    {
        Choices = [
        {
            ID: UnknownEnum.Value_127,
            Price: 1,
            Priority: 999
        }];
        AnimatronicQuota = 1;
        RowCount = 1;
    }
    
    SelectedAnimatronics = array_create(ChoiceAmount, false);
    
    for (var i = 0; i < array_length(UltraPickerChar); i++)
        SelectedAnimatronics[i] = true;
    
    AnimatronicQuota = min(AnimatronicQuota, array_length(Choices));
    show_debug_message(string("QUOTA: {0} | CHOICES: {1}", AnimatronicQuota, ChoiceAmount));
}

pick_choices();
Selected = false;
TransitionTime = 0;
AnimationFrame = 0;
PriceScaler = 1;
WindowOffset = 0;
WindowOffsetSpeed = 0;

if (!PhonyMode)
    spawn_consumables("Selection");

Anonymize = eleanor_challenge_active(UnknownEnum.Value_6);
PhonyAnonymize = PhonyMode;
BGFade = 1;

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
    Value_20 = 20,
    Value_24 = 24,
    Value_25,
    Value_26,
    Value_27,
    Value_46 = 46,
    Value_60 = 60,
    Value_87 = 87,
    Value_127 = 127
}
