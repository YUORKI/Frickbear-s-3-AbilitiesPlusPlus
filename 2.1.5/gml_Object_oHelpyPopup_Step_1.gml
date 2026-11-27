var MouseX = global.MouseX - x - 182;
var MouseY = global.MouseY - y - 6;

if (0 <= MouseX && 16 > MouseX && 0 <= MouseY && 14 > MouseY && mouse_check_button_pressed(mb_left))
{
    with (oHelpy)
    {
        if (audio_is_playing(SoundPlaying))
            audio_stop_sound(SoundPlaying);
        
        CurrentCloseClip = (irandom(20) == 7) ? choose_from_array(SOUND_ClosedRare) : choose_from_array(SOUND_Closed);
        SoundPlaying = bitcrush_sound(CurrentCloseClip, 0, 0, false, 1, 4);
        audio_play_sound(SOUND_Clicked, 10, false);
    }
    
    mouse_clear(mb_left);
    instance_destroy();
}

depth = -50;
