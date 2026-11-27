event_inherited();
ID = UnknownEnum.Value_60;
LureChance = 0 + lure_chance_increase();
MoveSpeed = 0.5;
HeaterSpeed = 3;
FooledByMask = false;
MovePitch = 0.8;
SOUND_Enter = skin_sound_generate_array(get_misc_voicelines(ID, "Approach"), ID, "voc_approach");
SPRITE_Eyes = skin_sprite(sVentEyes, ID, "sprite_01.png");

enum UnknownEnum
{
    Value_60 = 60
}
