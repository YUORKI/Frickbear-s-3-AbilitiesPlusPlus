ShockTimer = 0;
PoweroutTimer = 0;
audio_play_sound(sfxSalvageClatter, 15, false);
Active = true;
CurrentCam = 99;
PossibleCams = array_shuffle([1, 2, 3, 4, 5, 6, 7, 8]);
CamSwitchesToFind = 3;
KillTimer = lerp(15, 10, oFredbear.Difficulty);
PhonyMode = oFredbear.PhonyMode;
GarbleSound = PhonyMode ? sfxPhonyZapGarble : sfxFredbearGarble;
audio_sound_gain(GarbleSound, 0, 0);
audio_play_sound(GarbleSound, 15, true);
AffectedCams = [];
VentWarningTimer = 0;

if (PhonyMode)
{
    AffectedCams = [1, 2, 3, 4, 5, 6, 7, 8];
    
    repeat (5)
        array_delete(AffectedCams, irandom_range(0, array_length(AffectedCams) - 1), 1);
}

function zap_behavior()
{
    var i = 0;
    
    if (PhonyMode)
    {
        while (AffectedCams[i] != global.Cam)
            i++;
        
        array_delete(AffectedCams, i, 1);
        fuzz_up(global.Cam);
        var Sound = choose_from_array(get_misc_voicelines(UnknownEnum.Value_127, (array_length(AffectedCams) > 0) ? "Hit" : "Zapped"));
        reverb_sound(Sound, 0, 0, false, 1.5, 1, 0.25);
    }
    else
    {
        audio_play_sound(sfxFredbearGrowl_Pain, 50, false);
    }
    
    if (array_length(AffectedCams) == 0)
    {
        ShockTimer = 3;
        Active = false;
        PoweroutTimer = 0;
    }
}

enum UnknownEnum
{
    Value_127 = 127
}
