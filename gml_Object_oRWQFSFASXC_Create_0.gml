Frame = 0;
Anger = -0.5;
image_angle = 55;
x = oCamera.x + lengthdir_y(128, image_angle + 180);
y = oCamera.y + lengthdir_x(128, image_angle + 180);
SPRITE_Office = skin_sprite(sRWQOffice, UnknownEnum.Value_18, ["sprite_01.png", "sprite_02.png"]);
SOUND_FadeIn = skin_sound(sfxRWQ, UnknownEnum.Value_18, "sq_appear");
SOUND_FadeOut = skin_sound(sfxRWQFade, UnknownEnum.Value_18, "sq_vanish");

enum UnknownEnum
{
    Value_18 = 18
}
