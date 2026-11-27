var AI = global.AILevels[ID];
var TimeToPopup = 20 - (AI / 2);

if (AI > 0)
    Timer += 1;
else
    Timer = 0;

if ((Timer / 60) > TimeToPopup)
{
    audio_stop_sound(CurrentClip);
    audio_stop_sound(CurrentCloseClip);
    var PopupLines = [];
    CurrentClip = (irandom(20) == 7) ? choose_from_array(SOUND_AppearRare) : choose_from_array(SOUND_Appear);
    SoundPlaying = bitcrush_sound(CurrentClip, 0, 0, false, 1, 4);
    var WindowX = irandom_range(32, display_get_gui_width() - (sprite_get_width(sHelpyWindow) + 32));
    var WindowY = irandom_range(32, display_get_gui_height() - (sprite_get_height(sHelpyWindow) + 32));
    instance_create_depth(WindowX, WindowY, -1 - instance_number(oHelpyPopup), oHelpyPopup);
    audio_play_sound(SOUND_Popup, 10, false);
    Timer = 0;
}
