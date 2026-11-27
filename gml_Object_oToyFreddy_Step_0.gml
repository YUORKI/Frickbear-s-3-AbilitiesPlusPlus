AI = global.AILevels[ID];
TFScores = get_toyfreddy_scores(AI);

if (Active && AI > 0)
{
    for (var i = 0; i < array_length(TFScores); i++)
    {
        if (BeatenScores[i])
            continue;
        
        if (i == UnknownEnum.Value_0 || i == UnknownEnum.Value_4 || i == UnknownEnum.Value_7)
        {
            if (TFScores[i] > global.HiScores[i])
            {
                BeatenScores[i] = true;
                BeatenAmount++;
                audio_play_sound(sfxChildrenCheering, 5, false);
                
                if (AI == 21)
                    notification((BeatenAmount == 8) ? "0 left! Good job!" : $"{8 - BeatenAmount} more to go!", 2);
            }
        }
        else if (TFScores[i] < global.HiScores[i])
        {
            BeatenScores[i] = true;
            BeatenAmount++;
            audio_play_sound(sfxChildrenCheering, 5, false);
            
            if (AI == 21)
                notification((BeatenAmount == 8) ? "0 left! Good job!" : $"{8 - BeatenAmount} more to go!", 2);
        }
    }
}

if (((AI <= 20 && BeatenAmount > 0) || (AI == 21 && BeatenAmount >= 8)) && Active)
{
    Active = false;
    reverb_sound(SOUND_Defeated, 0, -200);
    fuzz_up(UnknownEnum.Value_7);
    
    if (AI == 21)
        global.Timer = max(global.Timer, 358);
    
    reverb_sound(SOUND_Crying, 0, 0, true, 0.75, 1, 0.4, 1);
}

if (global.Cam == UnknownEnum.Value_7 && global.CamUp && !Active && AI > 0)
    audio_sound_gain(SOUND_Crying, 0.25, 0);
else
    audio_sound_gain(SOUND_Crying, 0, 0);

depth = 80;

enum UnknownEnum
{
    Value_0,
    Value_4 = 4,
    Value_7 = 7
}
