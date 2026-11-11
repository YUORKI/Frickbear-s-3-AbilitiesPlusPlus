BaseX = 1344;
BaseY = 736;
Body = instance_create_layer(BaseX, BaseY, "Behind_Wall", oOfficeSprite);
Frame = 0;
SpriteFrame = 0;
LeewayFrames = 0;

with (Body)
    y = other.BaseY + sprite_height;

TargetY = Body.y;
Mode = "Down";
RandomValue = random_range(0.75, 1.25);
SPRITE_Window = skin_sprite(sEndoskeleton, UnknownEnum.Value_5, ["sprite_01.png", "sprite_02.png", "sprite_03.png", "sprite_04.png"]);
SOUND_Appear = skin_sound(sfxEndoCreak, UnknownEnum.Value_5, "sq_creak");
SOUND_Stare = skin_sound(sfxServo, UnknownEnum.Value_5, "sq_look");

enum UnknownEnum
{
    Value_5 = 5
}
