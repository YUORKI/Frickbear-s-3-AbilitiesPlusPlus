ID = UnknownEnum.Value_77;
SPRITE_Head = skin_sprite(sWhiteTiger_Head, ID, "sprite_01.png");
SPRITE_Arm = skin_sprite(sWhiteTiger_Arm, ID, ["sprite_02.png", "sprite_03.png"]);
SPRITE_Tail = skin_sprite(sWhiteTiger_Tail, ID, "sprite_04.png");
SOUND_Appear = skin_sound_generate_array(get_misc_voicelines(ID, "Appear"), ID, "voc_appear");
SOUND_Leave = skin_sound_generate_array(get_misc_voicelines(ID, "Leave"), ID, "voc_leave");
SOUND_Activate = skin_sound(sfxSalvage_WireDrop, ID, "sq_appear");
Frame = 0;
HeadOffset = 0;
HeadOffsetSpeed = 0;
HeadTarget = 0;
LimbOffset = 0;
LimbOffsetSpeed = 0;
LimbTarget = 0;
WaitTimer = 0;
Active = 0;
RandomRange = random(1);

enum UnknownEnum
{
    Value_77 = 77
}
