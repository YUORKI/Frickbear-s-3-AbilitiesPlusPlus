Phase = 0;
WaitTime = 360;
Mode = "Wait";
PowerDrain = 1;
TimeSinceFlipped = 0;
Anticheese = false;
FreezeFrames = 0;
SPRITE_Cameras = skin_sprite(sCameras_Foxy, UnknownEnum.Value_3, ["sprite_01.png", "sprite_02.png", "sprite_03.png", "sprite_04.png"]);
SOUND_Run = skin_sound(sfxFoxyRun, UnknownEnum.Value_3, "sq_run");
SOUND_Blocked = skin_sound_generate_array([voc_Foxy_Blocked1, voc_Foxy_Blocked3], UnknownEnum.Value_3, "voc_blocked");
SOUND_BlockedRare = skin_sound(voc_Foxy_Blocked2, UnknownEnum.Value_1, "voc_blockedrare");
SOUND_Anticheese = skin_sound(voc_Foxy_CamCheese, UnknownEnum.Value_3, "voc_cameracheese");
ID = UnknownEnum.Value_3;

enum UnknownEnum
{
    Value_1 = 1,
    Value_3 = 3
}
