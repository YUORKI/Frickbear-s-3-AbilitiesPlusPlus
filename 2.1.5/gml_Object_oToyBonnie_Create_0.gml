event_inherited();
ID = UnknownEnum.Value_7;
LureChance = 0.75 + lure_chance_increase();
MoveSpeed = 1.15;
SOUND_Enter = skin_sound_generate_array([voc_ToyBonnie_OhSecurityGuy, voc_ToyBonnie_ISeeYou, voc_ToyBonnie_ISpy], ID, "voc_approach");
SOUND_Leave = skin_sound_generate_array([voc_ToyBonnie_JustFreddy, voc_ToyBonnie_FindYouEventually, voc_ToyBonnie_TimeForThis], ID, "voc_leave");
SOUND_CoolGlasses = skin_sound_generate_array([voc_ToyBonnie_Shades1, voc_ToyBonnie_Shades2], ID, "voc_coolglasses");
SPRITE_Eyes = skin_sprite(sVentEyes, ID, ["sprite_01.png"]);
MovePitch = 1.1;

enum UnknownEnum
{
    Value_7 = 7
}
