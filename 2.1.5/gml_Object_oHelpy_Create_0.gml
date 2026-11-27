ID = UnknownEnum.Value_30;
Timer = 0;
CurrentClip = voc_Helpy_ClickHere;
CurrentCloseClip = voc_Helpy_Doh;
SoundPlaying = sfxNOTHING;
SPRITE_Popups = skin_sprite_unlimited(sHelpyAd, ID, "sprite_popup");
SPRITE_Helpy = skin_sprite_unlimited(sHelpyDance, ID, "sprite_dance");
SPRITE_Window = skin_sprite(sHelpyWindow, ID, "sprite_window.png");
SOUND_Appear = skin_sound_generate_array(get_misc_voicelines(ID, "Appear"), ID, "voc_appear");
SOUND_AppearRare = skin_sound_generate_array(get_misc_voicelines(ID, "Appear_Rare"), ID, "voc_appear_rare");
SOUND_Closed = skin_sound_generate_array(get_misc_voicelines(ID, "Closed"), ID, "voc_closed");
SOUND_ClosedRare = skin_sound_generate_array(get_misc_voicelines(ID, "Closed_Rare"), ID, "voc_closed_rare");
SOUND_Popup = skin_sound(sfxWindowNotif, ID, "sq_popup");
SOUND_Clicked = skin_sound(sfxClick, ID, "sq_click");

enum UnknownEnum
{
    Value_30 = 30
}
