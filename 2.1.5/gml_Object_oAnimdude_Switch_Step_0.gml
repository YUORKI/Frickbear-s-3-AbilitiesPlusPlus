if (place_meeting(x, y, oAnimdude_Player) && !Activated)
{
    Activated = true;
    audio_play_sound(oAnimdude_Player.SOUND_Fall, 10, false);
    audio_play_sound(oAnimdude_Player.SOUND_Trap, 10, false);
    
    with (oAnimdude_Dragon)
        Fallspeed = oAnimdude_Player.Speed * 4;
}

image_index = Activated;
