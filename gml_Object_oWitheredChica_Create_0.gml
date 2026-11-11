event_inherited();
ID = UnknownEnum.Value_12;
LureChance = 0.25 + lure_chance_increase();
HeaterSpeed = 0.75;
MoveSpeed = 0.8;
SOUND_Enter = skin_sound_generate_array([voc_WitheredChica_InHereSomewhere, voc_WitheredChica_NeedAHug, voc_WitheredChica_SqueezePastHere], ID, "voc_approach");
SOUND_Leave = skin_sound_generate_array([voc_WitheredChica_MySensors, voc_WitheredChica_SeeingThings, voc_WitheredChica_TheWind], ID, "voc_leave");
SOUND_CoolGlasses = skin_sound_generate_array([voc_WitheredChica_Shades], ID, "voc_coolglasses");
SPRITE_Eyes = skin_sprite(sVentEyes, ID, ["sprite_01.png"]);
MovePitch = 0.95;

enum UnknownEnum
{
    Value_12 = 12
}
