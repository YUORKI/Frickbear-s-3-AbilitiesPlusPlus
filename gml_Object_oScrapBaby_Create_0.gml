ID = UnknownEnum.Value_35;
ShowWarning = false;
RandomValue = random_range(1, 1.2);
Timer = 0;
Active = false;
ShockTimer = 0;
ShowWarning = false;
PoweroutSeqTimer = 0;
SPRITE_Window = skin_sprite(sScrapBaby, ID, "sprite_01.png");
SPRITE_Warning = skin_sprite(sMarionetteWarning, ID, "sprite_02.png");
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_ScrapBaby, ID, "camradar.png");
SOUND_Clatter = skin_sound(sfxClatter, ID, "sq_clatter");
SOUND_Powerout = skin_sound(sfxScrapBabyRun, ID, "sq_powerout");
instance_create_depth(0, 0, -60, oScrapBaby_WarningDrawer);

enum UnknownEnum
{
    Value_35 = 35
}
