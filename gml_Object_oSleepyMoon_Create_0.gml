MoonMeter = array_create(20, 0);
DisabledMinigames = array_create(20, false);
CurMinigame = -1;
VisualMoonPosition = 0;

function moon_gain(arg0, arg1 = false)
{
    var AI = global.AILevels[UnknownEnum.Value_78];
    
    if (AI == 0)
        exit;
    
    var AIScaler = lerp(0.25, 1.25, AI / 20);
    var DeathScaler = 60 * (60 / lerp(8, 5, AI / 20));
    MoonMeter[CurMinigame] += arg0 * 0.02777777777777778 * (arg1 ? DeathScaler : 1) * lerp(global.NightSpeedup, 1, 0.75);
}

KersplodeFrame = 0;
SleepySurf = -1;
AnimFrame = 0;

enum UnknownEnum
{
    Value_78 = 78
}
