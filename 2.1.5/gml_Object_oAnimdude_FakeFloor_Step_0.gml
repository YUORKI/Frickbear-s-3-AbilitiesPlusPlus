image_index = 0;

if (instance_exists(oAnimdude_Player))
{
    if (oAnimdude_Player.x > (x + 16) && !Activated)
    {
        Activated = true;
        audio_play_sound(oAnimdude_Player.SOUND_Trap, 10, false);
    }
}

if (Activated)
    FloorOffset = min(FloorOffset + oAnimdude_Player.Speed, 128);
