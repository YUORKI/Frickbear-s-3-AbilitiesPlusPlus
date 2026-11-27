var Seconds = 15 - (global.AILevels[UnknownEnum.Value_8] / 2);
DeathTimer = Seconds;
OriginalX = x;
OriginalY = y;
Mode = "Wait";
BlinkFrames = 0;
DrawDepth = 10;
SOUND_Blink = sfxCupcakeBlink;
SOUND_Clicked = sfxMarioKick;

enum UnknownEnum
{
    Value_8 = 8
}
