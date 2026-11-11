depth = -100;

if (Timer == 1 && TonightsCall != undefined)
{
    if (oCamera.BossMode != UnknownEnum.Value_0)
        instance_destroy();
    else
        PhoneActive = 1;
}

if (PhoneActive != 0)
{
    if ((Timer % 3) == 1 && Timer < 10)
        audio_play_sound(sfxPhoneRing, 50, false);
    
    if (Timer == 8)
    {
        audio_stop_sound(sfxPhoneRing);
        audio_play_sound(sfxPhonePickup, 50, false);
        PhoneActive = 2;
    }
    
    if (mouse_in_zone(PhoneButtonX - (ButtonWidth / 2), PhoneButtonY, ButtonWidth, ButtonHeight) && mouse_check_button_pressed(mb_left))
    {
        if (MuteDisabled)
        {
            error();
        }
        else
        {
            global.CallMuted = true;
            audio_play_sound(sfxClick, 50, false);
            audio_stop_sound(sfxPhoneRing);
            audio_stop_sound(TonightsCall);
            
            with (oRodney)
                CallMuted = true;
            
            PhoneActive = 0;
            
            if (NightMusicGain != -1)
                audio_sound_gain(global.Music, NightMusicGain, 1000);
        }
    }
    
    PhoneButtonY += ((336 - PhoneButtonY) / 10);
}
else
{
    PhoneButtonY += ((360 - PhoneButtonY) / 10);
}

if (Timer == 10 && PhoneActive == 2)
{
    TonightsCallPlaying = audio_play_sound(TonightsCall, 50, false);
    
    if (TonightsCall == voc_PhoneCall_WithLyrics)
        audio_sound_set_track_position(TonightsCallPlaying, audio_sound_get_track_position(global.Music) - 10);
    
    if (TonightsCall == voc_PhoneCall_FrickRoll)
    {
        NightMusicGain = audio_sound_get_gain(global.Music);
        audio_sound_gain(global.Music, 0, 2000);
    }
    
    if (!array_contains(global.ShuffleCallsHeard, get_call_id(TonightsCall)))
        array_push(global.ShuffleCallsHeard, get_call_id(TonightsCall));
}

if (oCamera.BossMode == UnknownEnum.Value_1)
{
    instance_create_depth(x, y, depth, oPhoneGuy_Nightmare);
    instance_destroy();
}

Timer += 0.016666666666666666;

enum UnknownEnum
{
    Value_0,
    Value_1
}
