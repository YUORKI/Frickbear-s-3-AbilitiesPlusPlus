event_inherited();
ID = UnknownEnum.Value_33;
LureChance = 1;
MoveSpeed = 1;
FooledByMask = false;
VentX = irandom_range(-1, 1);
VentY = -1;
SPRITE_Eyes = skin_sprite(sVentEyes, ID, ["sprite_01.png"]);
SOUND_Enter = skin_sound_generate_array([voc_Lefty_Shhhhhhhhhh], ID, "voc_approach");
SOUND_Leave = [sfxVentSqueak2];

enum UnknownEnum
{
    Value_33 = 33
}
