var ID = UnknownEnum.Value_79;
var AI = global.AILevels[ID];
var MaxPopsicleTimer = round(lerp(540, 360, AI / 20));
var MoveX = global.MouseX - x;
var MoveY = global.MouseY - y;
x += (MoveX / 2);
y += (MoveY / 2);
depth = -50;
var MoveDiff = point_distance(0, 0, MoveX, MoveY);
image_index = (MoveDiff < 0.25) ? (BlinkFrame < 0) : (2 + (floor(WalkFrame / 30) % 2));

if (abs(MoveX) >= 0.5)
    image_xscale = sign(MoveX);

if (global.AILevels[UnknownEnum.Value_52] == 21)
    PopsicleTimer = 999;

if (BlinkFrame <= -5)
    BlinkFrame = irandom_range(5, 60);

if (PopsicleTimer <= 0 && AI > 0 && global.Power > 0)
{
    if (PopsiclesToSummon > 0)
    {
        with (instance_create_depth(irandom_range(20, 620), irandom_range(20, 340), depth, (irandom(4) == 3) ? oDoofas_Coin : oDoofas_Popsicle))
            PopsicleTimer = round(lerp(360, 240, AI / 20));
        
        PopsiclesToSummon--;
        audio_play_sound(sfxDoofas_Pop, 2, false, 1, 0, random_range(0.8, 1.2));
    }
    
    if (PopsiclesToSummon == 0)
    {
        PopsicleTimer = MaxPopsicleTimer * random_range(0.8, 1.2);
        PopsiclesToSummon = round(lerp(1, 3, AI / 20) + random_range(-0.8, 0.8));
    }
    else
    {
        PopsicleTimer = irandom_range(5, 15);
    }
}

BlinkFrame--;
PopsicleTimer--;
WalkFrame += MoveDiff;

enum UnknownEnum
{
    Value_52 = 52,
    Value_79 = 79
}
