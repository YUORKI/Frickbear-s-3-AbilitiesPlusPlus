var AI = global.AILevels[ID];
WaitTime = 60 * lerp(95, 35, AI / 20) * RandomValue;

if (Timer > WaitTime && !Active && global.Power > 0)
{
    Active = true;
    audio_play_sound(SOUND_Clatter, 150, true, 0.4);
    fuzz_up(UnknownEnum.Value_8);
}

if (AI > 0)
    Timer += 1;

if (ShockTimer > 0)
{
    ShockTimer -= 0.016666666666666666;
    
    if (ShockTimer == 0)
        Active = false;
}

ShowWarning = (Timer - WaitTime) > (60 * (3 + (AI / 10))) && ShockTimer == 0;

if (ShowWarning)
    drain_power((oCamera.DrainRate * 2) / 180);

if (!Active && audio_is_playing(SOUND_Clatter))
    audio_stop_sound(SOUND_Clatter);

if (global.Power <= 0 && AI > 0)
{
    Active = false;
    PoweroutSeqTimer++;
    
    if (PoweroutSeqTimer == 60)
        simple_sound(SOUND_Powerout, 500, 0, false, 1.5, 25, 1.25);
    
    if (PoweroutSeqTimer == 330)
        jumpscare(UnknownEnum.Value_35, 0);
}

if (ShockTimer > 0 && global.Cam == UnknownEnum.Value_8)
{
    if (ShockTimer > 2)
    {
        oCameraUI.ZapAlpha = random_range(1.5, 0);
    }
    else
    {
        oCameraUI.ZapAlpha = ShockTimer / 2;
        Active = false;
    }
    
    audio_stop_sound(SOUND_Clatter);
}

enum UnknownEnum
{
    Value_8 = 8,
    Value_35 = 35
}
