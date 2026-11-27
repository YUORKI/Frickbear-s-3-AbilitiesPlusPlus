ID = UnknownEnum.Value_88;
Progress = 0;
Stage = 0;
CurrentCam = UnknownEnum.Value_8;
FreezeFrames = 0;
SOUND_Move = skin_sound_generate_array([sfxRalphMoan_Far1, sfxRalphMoan_Far2, sfxRalphMoan_Close], ID, "sq_move");
SPRITE_Cameras = skin_sprite(sCameras_Ralph, ID, get_sprite_filenames(1, 9));
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_Ralph, ID, "camradar.png");

enum UnknownEnum
{
    Value_8 = 8,
    Value_88 = 88
}
