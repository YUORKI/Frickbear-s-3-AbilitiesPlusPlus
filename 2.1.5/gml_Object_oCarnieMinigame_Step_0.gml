if (Timer == -180)
    bitcrush_sound(voc_Carnie_Startup1, 0, 0, false, 1.5, 6);

if (Timer == -179)
    instance_deactivate_object(oMinigameParent);

if (Timer == -90)
    bitcrush_sound(voc_Carnie_Startup2, 0, 0, false, 1.5, 6);

if (Timer == 0)
{
    bitcrush_sound(voc_Carnie_Startup3, 0, 0, false, 1.5, 6);
    audio_play_sound(sfxCarnie_Shoot, 10, false);
    audio_play_sound(mus_Carnie, 10, true);
    instance_activate_object(oMinigameParent);
    
    with (oShopkeepSprite)
    {
        BPM = 50;
        DanceFrame = 0;
        switch_pose(0);
    }
}

if (Timer == 60)
{
    with (oShopkeepSprite)
        switch_pose(1);
}

if (Timer < 0)
{
    with (oShopkeepSprite)
    {
        BPM = 0;
        DanceFrame = 0;
    }
}

if (((global.HiScores[Minigame] >= TargetScore && ShowScore) || (global.HiScores[Minigame] <= TargetScore && !ShowScore)) && !TargetHit)
{
    with (oShopkeepSprite)
        switch_pose(2);
    
    audio_play_sound(sfxCarnie_Whistle, 10, false);
    instance_destroy(oMinigameParent);
    TargetHit = true;
    audio_stop_sound(mus_Carnie);
    
    if (HardMode == 2)
        unlock_guard(UnknownEnum.Value_7);
    
    alarm[0] = 180;
}

Timer++;

if (Timer > 0 && TimeLimit > 0 && !(TargetHit || MinigameFailed))
{
    with (oMinigameParent)
        Paused = false;
    
    TimeLimit -= 0.016666666666666666;
    
    if (TimeLimit == 0)
    {
        minigame_failed();
        instance_destroy(oMinigameParent);
        alarm[0] = 180;
    }
}

enum UnknownEnum
{
    Value_7 = 7
}
