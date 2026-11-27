ID = UnknownEnum.Value_29;
ActivationTime = irandom_range(5, 270);
ActivationTime = 5;
Timer = 0;
SliceLocations = [0, 0, 0, 0, 0, 0, 0, 0, 0];
Defeated = 0;
Active = false;
SlicesFound = 0;
SPRITE_Minireenas = skin_sprite(sMinireenas, ID, get_sprite_filenames(1, 8));
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_Ballora, ID, "camradar.png");
sprite_collision_mask(SPRITE_Minireenas, true, 0, 0, 0, 400, 300, 0, 0);
SOUND_Clicked = skin_sound_generate_array([sfxMinireena1, sfxMinireena2, sfxMinireena3, sfxMinireena4], ID, "sq_minireena");
SOUND_MusicBox = skin_sound(sfxBalloraMusicBox, ID, "sq_musicbox");
SOUND_Warning = skin_sound(sfxBalloraWarning, ID, "sq_warning");
sprite_index = SPRITE_Minireenas;

enum UnknownEnum
{
    Value_29 = 29
}
