var AI = global.AILevels[ID];
depth = -40;

if (AI == 21)
{
    ActivationTime = 1;
    global.Timer = max(240, global.Timer);
    
    if (global.Timer < 290)
    {
        with (oHelpy)
            Timer = 0;
    }
    
    if (global.AILevels[UnknownEnum.Value_79] > 0)
        global.AILevels[UnknownEnum.Value_79] = lerp(5, 15, get_proportional_night_progress());
    
    if (global.AILevels[UnknownEnum.Value_52] > 0)
        global.AILevels[UnknownEnum.Value_52] = lerp(5, 15, get_proportional_night_progress());
}

if (global.Timer < ActivationTime || AI <= 0)
    exit;

var EdgeT = 16;
var EdgeR = 568;
var EdgeB = 344;
var EdgeL = 72;

if (Frame >= 0 && !Cleared)
{
    var Passed = BallX <= EdgeL;
    var MinRallies = ceil(lerp(2, 8, AI / 20) / global.NightSpeedup);
    var Completed = Rallies >= MinRallies && (AI != 21 || global.Timer > 355);
    
    if (abs(global.MouseY - BallY) > 52 || Passed)
        EdgeL = -32;
    
    if ((BallX + XSpeed) <= EdgeL && !Passed)
    {
        BallX = EdgeL;
        XSpeed *= -1;
        bounce(true);
    }
    else if ((BallX + XSpeed) >= EdgeR && !Completed)
    {
        BallX = EdgeR;
        XSpeed *= -1;
        Rallies++;
        bounce(true);
    }
    else
    {
        BallX += XSpeed;
    }
    
    if ((BallY + YSpeed) <= EdgeT)
    {
        BallY = EdgeT;
        YSpeed *= -1;
        bounce(false);
    }
    else if ((BallY + YSpeed) >= EdgeB)
    {
        BallY = EdgeB;
        YSpeed *= -1;
        bounce(false);
    }
    else
    {
        BallY += YSpeed;
    }
    
    if (XSpeed > 0 && !Completed)
        BunnySpeed = lerp(BunnySpeed, (BallY - BunnyY) * 0.5, 0.1);
    else
        BunnySpeed *= 0.8;
    
    BunnyY += BunnySpeed;
    
    if (abs(BallX - 320) > 352)
    {
        Cleared = true;
        audio_play_sound(SOUND_Warning, 15, false);
        
        if (BallX < 320)
        {
            audio_play_sound(SOUND_Fail, 15, false);
            global.Power = 0;
            
            if (AI == 21)
            {
                with (oFoxy)
                    Phase = 344;
            }
        }
    }
}

if (!Cleared && SpriteDraw < 1)
    SpriteDraw += (1/120);
else if (Cleared && SpriteDraw > 0)
    SpriteDraw -= 0.016666666666666666;

if (Frame < 0 && ((Frame + 10) % 1) == 0.016666666666666666)
    audio_play_sound(SOUND_Warning, 15, false);

if (Frame == 0)
{
    XSpeed = lerp(2, 5, AI / 20);
    bounce(true);
    YSpeed = XSpeed;
}

Frame += 0.016666666666666666;

enum UnknownEnum
{
    Value_52 = 52,
    Value_79 = 79
}
