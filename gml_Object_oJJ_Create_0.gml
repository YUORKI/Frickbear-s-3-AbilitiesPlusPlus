event_inherited();
ID = UnknownEnum.Value_15;
MoveSpeed = 0.5 + lure_chance_increase();
HeaterSpeed = 0;
YOffset = 512;
SOUND_Enter = skin_sound_generate_array([voc_JJ_Hello, voc_JJ_HelloThere2], ID, "voc_approach");
SOUND_Leave = skin_sound_generate_array([voc_JJ_ByeBye1, voc_JJ_ByeBye2], ID, "voc_leave");
SOUND_CoolGlasses = skin_sound_generate_array([voc_JJ_Shades1, voc_JJ_Shades2], ID, "voc_coolglasses");
SOUND_InOffice = skin_sound(voc_JJ_Oopsies, ID, "voc_officeenter");
SOUND_LeaveOffice = skin_sound(voc_JJ_ByeBye1, ID, "voc_officeleave");
SPRITE_Eyes = skin_sprite(sVentEyes, ID, ["sprite_01.png"]);
SPRITE_Office = skin_sprite(sJJOffice, ID, ["sprite_02.png"]);
MovePitch = 1.25;

enum UnknownEnum
{
    Value_15 = 15
}
