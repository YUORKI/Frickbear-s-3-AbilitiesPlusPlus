PhonyMode = !(global.Route == UnknownEnum.Value_4);
AttackList = [
{
    Title: "MASH!",
    AttackObj: oFredbearAttack_Claw,
    Priority: 0
}, 
{
    Title: "SCARE AWAY!",
    AttackObj: oFredbearAttack_Freddles,
    Priority: 0
}, 
{
    Title: "SHOCK!",
    AttackObj: oFredbearAttack_PowerOut,
    Priority: 0
}, 
{
    Title: "CLOSE!",
    AttackObj: oFredbearAttack_PopUps,
    Priority: 0
}];

if (PhonyMode)
{
    array_push(AttackList, 
    {
        Title: "BEHIND YOU!",
        AttackObj: oFredbearAttack_BackWindow,
        Priority: 0
    });
}

Difficulty = min(global.Difficulty, 3) / 3;
AttackList = array_union(AttackList, AttackList);
AttackList = array_shuffle(AttackList);
CurrentAttack = 0;
AttacksUsed = 0;
Frame = 999;
TextSize = 0;
TextOffset = 0;
TextOffsetSpeed = 0;
ChosenTitle = "BALLS!";
ChosenAttack = undefined;
TimeToNextAttack = PhonyMode ? 8.5 : 3;
AttackDelay = 13;
ClawSide = random_sign();

with (oCamButtonShopItem)
{
    if (Text != "Pickles" && Text != "High-Quality Lumber")
        instance_destroy();
}

if (global.Night != "Endless")
{
    for (var i = 0; i < array_length(global.AllTimeSalvages); i++)
    {
        var DiffLevel = lerp(10, 15, global.Difficulty / 3);
        
        if (array_contains([UnknownEnum.Value_20, UnknownEnum.Value_33, UnknownEnum.Value_35, UnknownEnum.Value_34, UnknownEnum.Value_6, UnknownEnum.Value_42, UnknownEnum.Value_40], global.AllTimeSalvages[i]))
            DiffLevel /= 2;
        
        global.AILevels[global.AllTimeSalvages[i]] = DiffLevel;
    }
}
else
{
    global.BeartrapsToGenerate = 0;
}

if (!variable_global_exists("BeartrapsToGenerate"))
    global.BeartrapsToGenerate = 0;

repeat (global.BeartrapsToGenerate)
    instance_create_depth(0, 0, 0, oShopItem_FredbearHeart);

global.BeartrapsToGenerate = 0;
audio_stop_sound(mus_BossFredbear);
instance_create_layer(0, 0, "Behind_Wall", PhonyMode ? oPhonyAttack_Window : oFredbearAttack_Window);
texturegroup_load("FinalBossJumpscare");
audio_sound_gain(mus_BossFredbear_Phase2, 0.7, 2000);

enum UnknownEnum
{
    Value_4 = 4,
    Value_6 = 6,
    Value_20 = 20,
    Value_33 = 33,
    Value_34,
    Value_35,
    Value_40 = 40,
    Value_42 = 42
}
