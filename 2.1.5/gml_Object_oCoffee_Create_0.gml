ID = UnknownEnum.Value_40;
BallX = 96;
BallY = 180;
XSpeed = 4;
YSpeed = 4;
BunnyY = 180;
BunnySpeed = 0;
Frame = -3;
SpriteDraw = 0;
Rallies = 0;
Cleared = false;
ActivationTime = irandom_range(5, 270);
SPRITE_Coffee = skin_sprite(sCoffee, ID, ["sprite_01.png", "sprite_02.png", "sprite_03.png", "sprite_04.png", "sprite_05.png", "sprite_06.png"]);
SPRITE_Grid = skin_sprite(sCoffeeGrid, ID, ["sprite_07.png", "sprite_08.png", "sprite_09.png", "sprite_10.png", "sprite_11.png", "sprite_12.png"]);
SOUND_Bounce = skin_sound(sfxCoffeeBounce, ID, "sq_bounce");
SOUND_Warning = skin_sound(sfxCoffeeWarning, ID, "sq_warning");
SOUND_Fail = skin_sound(sfxBitExplosion, ID, "sq_fail");

function bounce(arg0)
{
    if (global.AILevels[UnknownEnum.Value_40] == 21 && arg0)
    {
        XSpeed = sign(XSpeed) * lerp(4, 10, (global.Timer - 240) / 120);
        YSpeed = sign(YSpeed) * abs(XSpeed) * random_range(0.9, 1.1);
    }
    
    audio_play_sound(SOUND_Bounce, 15, false, 0.25 + (0.25 * arg0), 0, 1);
}

enum UnknownEnum
{
    Value_40 = 40
}
