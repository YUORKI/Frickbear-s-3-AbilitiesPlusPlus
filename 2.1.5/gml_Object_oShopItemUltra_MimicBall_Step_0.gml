image_index = UnknownEnum.Value_10;

if (Hovered && mouse_check_button_pressed(mb_left))
{
    if (MimicText == "NOTHING")
    {
        error();
    }
    else
    {
        Active = true;
        audio_play_sound(sfxClick, 10, false);
        audio_play_sound(sfxRegister, 50, false);
        spawn_item(MimicText);
        deplete_uses();
    }
}

enum UnknownEnum
{
    Value_10 = 10
}
