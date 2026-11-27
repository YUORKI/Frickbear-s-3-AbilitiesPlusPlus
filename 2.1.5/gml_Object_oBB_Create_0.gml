event_inherited();
ID = UnknownEnum.Value_14;
LureChance = 0 + lure_chance_increase();
MoveSpeed = 0.5;
YOffset = 512;
SOUND_Enter = skin_sound_generate_array([voc_BB_Hello2, voc_BB_Hello3, voc_BB_Hi], ID, "voc_approach");
SOUND_Leave = skin_sound_generate_array([voc_BB_BuhBye, voc_BB_Laugh1, voc_BB_Laugh2], ID, "voc_leave");
SOUND_CoolGlasses = skin_sound_generate_array([voc_BB_Shades], ID, "voc_coolglasses");
SOUND_InOffice = skin_sound(voc_BB_Laugh3, ID, "voc_officeenter");
SOUND_LeaveOffice = skin_sound(voc_BB_Laugh2, ID, "voc_officeleave");
SPRITE_Eyes = skin_sprite(sVentEyes, ID, ["sprite_01.png"]);
SPRITE_Office = skin_sprite(sBBOffice, ID, ["sprite_02.png"]);
SPRITE_Cameras = skin_sprite(sCameras_BB, ID, ["sprite_03.png"]);
MovePitch = 1.2;

enum UnknownEnum
{
    Value_14 = 14
}
