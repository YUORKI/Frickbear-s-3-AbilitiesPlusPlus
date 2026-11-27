depth = 1;

if (TimeToNextAttack <= 0)
{
    Frame = 0;
    
    if (AttacksUsed == 0)
    {
        notification("ALL your old friends are here!", 2);
        TimeToNextAttack = PhonyMode ? 7.5 : 9;
    }
    else if (AttacksUsed < 3)
    {
        TimeToNextAttack = 9;
    }
    else if ((global.Timer + TimeToNextAttack) > 350)
    {
        TimeToNextAttack = 999;
    }
    else
    {
        TimeToNextAttack = AttackDelay;
        AttackDelay = max(AttackDelay - 1, 10);
    }
    
    var HighestPriority = -999;
    var HighestPriorityEntry = 0;
    ClawSide = find_available_doorway(false);
    
    for (var i = 0; i < array_length(AttackList); i++)
    {
        show_debug_message($"{AttackList[i].Title} PRI: {AttackList[i].Priority}");
        
        if (AttackList[i].AttackObj == oFredbearAttack_BackWindow && !window_available())
            continue;
        
        if (AttackList[i].AttackObj == oFredbearAttack_Claw && ClawSide == 0)
            continue;
        
        if (AttackList[i].Priority > HighestPriority)
        {
            show_debug_message("Best choice!");
            HighestPriority = AttackList[i].Priority;
            HighestPriorityEntry = i;
        }
    }
    
    CurrentAttack = HighestPriorityEntry;
    ChosenTitle = AttackList[CurrentAttack].Title;
    ChosenAttack = AttackList[CurrentAttack].AttackObj;
    AttackList[CurrentAttack].Priority--;
    
    if (ChosenAttack == oFredbearAttack_BackWindow)
        global.WindowOccupant = UnknownEnum.Value_126;
    
    if (ChosenAttack == oFredbearAttack_Claw)
        occupy_doorway(UnknownEnum.Value_126, ClawSide);
    
    TextSize = 0;
    TextOffset = 0;
    TextOffsetSpeed = 0;
    AttacksUsed++;
}

var WaitTime = 60;

if (Frame >= (WaitTime + 15))
{
    TextOffsetSpeed -= 1;
    TextOffset = max(TextOffset + TextOffsetSpeed, -360);
}
else if (Frame >= WaitTime)
{
    TextOffsetSpeed = 2;
    TransitionSpeed += 0.005;
    TextSize += ((3 - TextSize) / 5);
}
else if (Frame >= (WaitTime - 60))
{
    TextOffset = 0;
    TextOffsetSpeed = 0;
    TransitionSpeed = 0.05;
    
    if (Frame >= (WaitTime - 15))
        TextSize += ((3 - TextSize) / 5);
}

if (Frame == WaitTime)
    instance_create_depth(0, 0, 0, ChosenAttack);

Frame++;
TimeToNextAttack -= 0.016666666666666666;

if (audio_is_playing(mus_BossPhony) && audio_sound_get_track_position(global.Music) > 121)
{
    audio_stop_sound(global.Music);
    global.Music = sfxNOTHING;
}

enum UnknownEnum
{
    Value_126 = 126
}
