OfficeSprite = undefined;
Mode = "Reset";
Timer = 0;
InOffice = 0;
ActivationTime = irandom_range(30, 240);
SPRITE_Office = skin_sprite(sShadowFreddy, UnknownEnum.Value_17, ["sprite_01.png"]);
SOUND_Appear = skin_sound(voc_ShadowFreddy_Laugh, UnknownEnum.Value_17, "voc_appear");

enum UnknownEnum
{
    Value_17 = 17
}
