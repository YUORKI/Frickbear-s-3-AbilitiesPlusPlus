if (Delay > 0)
{
    Delay -= 0.016666666666666666;
    exit;
}

var ID = UnknownEnum.Value_52;
var AppearFrames = round(lerp(45, 30, AI / 20));
var ChargeFrames = round(lerp(45, 30, AI / 20));
var FadeoutFrames = 30 + max(15, TimeBetweenShots);

if (PatternType == 3)
{
    x = 320;
    y = 180;
}

image_blend = get_bullet_pattern_color(PatternType);

if (PatternType > 0)
    sprite_index = sChicasMagicRainbow_Special;

if (Frame <= (AppearFrames + ChargeFrames))
{
    Size += ((1 - Size) / 10);
    image_index = 0;
    
    if (Frame == AppearFrames)
        audio_play_sound(oChicasMagicRainbow.SOUND_Charge, 5, false);
    
    if (Frame > AppearFrames)
    {
        YStretch += ((1.2 - YStretch) / 15);
        image_index = 1;
    }
    
    if (Frame == (AppearFrames + ChargeFrames))
    {
        YStretchSpeed = -0.1;
        bullet_pattern(PatternType);
        BlastsMade++;
    }
}
else if (Frame <= (AppearFrames + ChargeFrames + FadeoutFrames))
{
    image_index = 2;
    YStretch += YStretchSpeed;
    YStretchSpeed = lerp(YStretchSpeed, (1 - YStretch) * 0.5, 0.2);
    
    if (BlastsMade < BlastsAllowed && Frame >= (AppearFrames + ChargeFrames + (TimeBetweenShots - 1)))
        Frame -= TimeBetweenShots;
}
else
{
    Size -= ((1.1 - Size) / 5);
    Size = clamp(Size, 0, 1);
    image_index = 2;
    
    if (Size <= 0)
        instance_destroy();
}

Frame++;
image_xscale = Size / YStretch;
image_yscale = Size * YStretch;
depth = -100;

enum UnknownEnum
{
    Value_52 = 52
}
