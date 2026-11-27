Shakiness = 0;
Frame = 0;
HitsLeft = 10;
HeightSpeed = 0;
Height = 0;
Active = false;
WaitForFlip = true;
Camera = 0;
PreviousCamera = 0;
CanSpawn = false;
SOUND_Scare = skin_sound(sfxWindowScare, UnknownEnum.Value_23, "sq_scare");
SOUND_Slip = skin_sound(sfxCartoonHitSlip, UnknownEnum.Value_23, "sq_slip");
SOUND_Appear = skin_sound_generate_array([voc_NightmareBB_Laugh1, voc_NightmareBB_Laugh2, voc_NightmareBB_Laugh3], UnknownEnum.Value_23, "voc_appear");
SOUND_Smack = skin_sound_generate_array([sfxPunch1, sfxPunch2, sfxPunch3], UnknownEnum.Value_23, "sq_hit");
SOUND_Hurt = skin_sound_generate_array([voc_NightmareBB_Hurt1, voc_NightmareBB_Hurt2, voc_NightmareBB_Hurt3, voc_NightmareBB_Hurt4, voc_NightmareBB_Hurt5], UnknownEnum.Value_23, "voc_hurt");
SOUND_Leave = skin_sound_generate_array([voc_NightmareBB_Leave1, voc_NightmareBB_Leave2, voc_NightmareBB_Leave3], UnknownEnum.Value_23, "voc_leave");
SPRITE_Head = skin_sprite(sCameras_NightmareBB, UnknownEnum.Value_23, ["sprite_01.png", "sprite_02.png"]);
SPRITE_Eyes = skin_sprite(sCameras_NightmareBBEye, UnknownEnum.Value_23, ["sprite_03.png", "sprite_04.png"]);

enum UnknownEnum
{
    Value_23 = 23
}
