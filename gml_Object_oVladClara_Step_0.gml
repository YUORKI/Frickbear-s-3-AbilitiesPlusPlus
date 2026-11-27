var AI = global.AILevels[ID];
var TimeToAttack = lerp(30, 15, AI / 20) * Randomizer;

if (Timer > TimeToAttack && !Active)
{
    Active = true;
    play_sound();
    audio_sound_set_track_position(Sound, SavedEpisodePosition);
    
    with (oOffice_TV)
    {
        audio_stop_sound(sfxTV_Static);
        
        if (!TVOn)
            reverb_sound(sfxTV_Static, 400, 200, true, 4, 1, 0);
        
        simple_sound(other.SOUND_Activate, 400, 200, false, 1);
        CurrentAnimation = other.SubtitleVisualList[other.SubtitleEntry];
        OffsetSpeed = -5;
        TVOn = true;
        VladMode = true;
        Frame = 0;
    }
}

if (Active)
{
    fuzz_up();
    
    if (!audio_is_playing(Sound))
    {
        SavedEpisodePosition = 0;
        select_episode(true);
    }
    
    if (SubtitleEntry < (array_length(SubtitleList) - 1) && audio_sound_get_track_position(Sound) > SubtitleTimingList[SubtitleEntry + 1])
    {
        SubtitleEntry++;
        oOffice_TV.CurrentAnimation = SubtitleVisualList[SubtitleEntry];
    }
}

if (AI > 0)
    Timer += 0.016666666666666666;
