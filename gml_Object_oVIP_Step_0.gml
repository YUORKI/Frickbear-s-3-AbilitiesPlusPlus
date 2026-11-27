var ID = UnknownEnum.Value_72;
var AI = global.AILevels[ID];
var AnchorX = 640;
var AnchorY = 160;
var Interval = 60;
var NightTimer = global.Timer - ((1 - (1 / global.NightSpeedup)) * 360);

if (AI <= 0)
    exit;

if ((global.Timer % Interval) == (Interval - 1.5) && NightTimer > 0)
{
    Frame = 0;
    FadingOut = false;
    Position = 0;
    PositionSpeed = 0;
    YOffset = 0;
    YOffsetSpeed = 0;
    reverb_sound(choose_from_array(SOUND_Hmm), 500, 0, false, 3, 1, 0);
}

image_index = Frame > 90;
image_angle = lerp(45, 0, Position);
x = AnchorX + lerp(160, 22, Position);
y = AnchorY + YOffset;
Position += PositionSpeed;
PositionSpeed = lerp(PositionSpeed, (!FadingOut - Position) * 0.2, 0.25);
YOffset += YOffsetSpeed;
YOffsetSpeed = lerp(YOffsetSpeed, (1 - YOffset) * 0.25, 0.3);
var NightScaler = lerp(global.NightSpeedup, 1, 0.5) / 2;
var TokensPer = floor(lerp(5, 10, AI / 20) * NightScaler);
RealQuota = floor((floor(max(NightTimer - 1, 0) / Interval) + 1) * TokensPer);

if (Frame == 90)
{
    YOffsetSpeed = 12;
    
    if (global.Tokens >= RealQuota)
    {
        audio_play_sound(SOUND_Sparkle, 10, false);
        
        if (array_length(SuccessQuotes) > 0)
        {
            reverb_sound(SuccessQuotes[Successes], 500, 0, false, 2, 1, 0);
            Successes = (Successes + 1) % array_length(SuccessQuotes);
        }
    }
    else
    {
        jumpscare(ID);
    }
}

if (Frame == 150)
{
    FadingOut = true;
    PositionSpeed = 0.1;
}

if (VisualTokenQuota < RealQuota && Frame >= 150)
{
    VisualTokenQuota += 0.25;
    
    if ((VisualTokenQuota % 1) == 0)
        audio_play_sound(SOUND_Tick, 3, false);
}

Frame++;

enum UnknownEnum
{
    Value_72 = 72
}
