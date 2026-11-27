ID = UnknownEnum.Value_28;
Initialize = true;
Showtime = 360;

function delay_showtime(arg0)
{
    if (Showtime >= 405)
        instance_destroy();
    
    Showtime += ((360 / ((arg0 + 10) / 4)) * random_range(0.75, 1.25));
    Showtime = clamp(round(Showtime / 15) * 15, 15, 405);
}

SPRITE_Cutout = skin_sprite(sFuntimeFoxyCutout, UnknownEnum.Value_28, get_sprite_filenames(1, 12));
SOUND_Blocked = skin_sound(sfxCartoonDing, UnknownEnum.Value_28, "sq_blocked");

enum UnknownEnum
{
    Value_28 = 28
}
