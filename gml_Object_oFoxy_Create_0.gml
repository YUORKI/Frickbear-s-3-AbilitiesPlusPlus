ID = UnknownEnum.Value_3;
Phase = 0;
WaitTime = 360;
Mode = "Wait";
PowerDrain = 1;
TimeSinceFlipped = 0;
Anticheese = false;
FreezeFrames = 0;
SPRITE_Cameras = skin_sprite(sCameras_Foxy, ID, ["sprite_01.png", "sprite_02.png", "sprite_03.png", "sprite_04.png"]);
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_Foxy, ID, "camradar.png");
SOUND_Run = skin_sound(sfxFoxyRun, ID, "sq_run");
SOUND_Blocked = skin_sound_generate_array([voc_Foxy_Blocked1, voc_Foxy_Blocked3], ID, "voc_blocked");
SOUND_BlockedRare = skin_sound(voc_Foxy_Blocked2, ID, "voc_blockedrare");
SOUND_Anticheese = skin_sound(voc_Foxy_CamCheese, ID, "voc_cameracheese");

enum UnknownEnum
{
    Value_3 = 3
}
