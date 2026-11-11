if (character_active(UnknownEnum.Value_73))
{
    sprite_index = sDataDiver;
    var InClickRange = abs(x - o3DMouse.x) <= 75 && abs(y - o3DMouse.y) <= 75;
    
    if (InClickRange && oMimic.Lives > 0 && global.AILevels[UnknownEnum.Value_73] > 0 && mouse_check_button_pressed(mb_left) && turnaround_accessible())
    {
        audio_play_sound(sfxControlPanel_Open, 10, false);
        TabletUp = true;
        global.PanelUp = true;
    }
}
else
{
    sprite_index = sNOTHING;
}

enum UnknownEnum
{
    Value_73 = 73
}
