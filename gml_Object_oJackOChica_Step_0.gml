var AI = global.AILevels[UnknownEnum.Value_48];

if (AI == 0)
{
    Frame = 0;
    WaitTime = 999;
    exit;
}

if (Reset == true)
{
    WaitTime = lerp(52, 32, AI / 20) * random_range(0.8, 1.2);
    Reset = false;
    Frame = 0;
}

var WallOriginX = 1088;
var WallOriginY = 448;
var TorsoX = (WallOriginX - 192) + Frame;
var TorsoY = (WallOriginY - abs(dsin(Frame * 3) * 16)) + 306;
var TorsoA = ((dsin(Frame * 6) * 6) - 15) + (Cur_HeadB / 2);
var FrontArmX = TorsoX + rot_x(-22, -74, TorsoA);
var FrontArmY = TorsoY + rot_y(-22, -74, TorsoA);
var FrontArmA = (dsin((Frame * 6) - 30) * 4) - 15;
var BackArmX = TorsoX + rot_x(67, -75, TorsoA);
var BackArmY = TorsoY + rot_y(67, -75, TorsoA);
var BackArmA = (dsin((Frame * 6) - 90) * 8) + (Cur_HeadB / 2);
var HeadX = TorsoX + rot_x(46, -94 + Cur_HeadB, TorsoA);
var HeadY = TorsoY + rot_y(46, -94 + Cur_HeadB, TorsoA);
var HeadA = (dsin((Frame * 6) - 45) * 8) + (Cur_HeadB / 4);

if (Frame == round(300 - (AI * 2)) || Frame == round(420 + (AI * 2)))
{
    if (HeadTurned)
    {
        CurSpeed_HeadB = 6;
        audio_play_sound(SOUND_HeadTurn, 10, false, 0.75, 1, 0.8);
    }
    else
    {
        CurSpeed_HeadB = -6;
        audio_play_sound(SOUND_HeadTurn, 10, false, 0.5);
    }
    
    HeadTurning = true;
}

if (HeadTurning)
{
    if (CurSpeed_HeadB > 0 && !HeadTurned)
    {
        HeadTurned = true;
        HeadTurning = false;
    }
    
    if (CurSpeed_HeadB < 0 && HeadTurned)
    {
        HeadTurned = false;
        HeadTurning = false;
    }
}

CurSpeed_HeadB = lerp(CurSpeed_HeadB, (0 - Cur_HeadB) * 0.95, 0.1);
Cur_HeadB += CurSpeed_HeadB;
var RaiseTemp = HeadTurned && !wearing_mask();

if (RaiseTemp)
{
    KillTimer += 0.016666666666666666;
    global.Temperature += (lerp(10, 20, AI / 20) / 60);
}

if (KillTimer > 2 || (global.Temperature >= 39 && RaiseTemp))
{
    jumpscare(UnknownEnum.Value_48);
    exit;
}

if (!HeadTurned)
    KillTimer = 0;

if ((Frame % 60) == 45)
{
    audio_play_sound(SOUND_FootstepAlt, 10, false, 0.5, 0, random_range(0.9, 1.1));
    audio_play_sound(SOUND_Footstep, 10, false, 0.5);
}

if (WaitTime <= 0)
{
    Frame++;
    
    if (!audio_is_playing(BurningSound))
        BurningSound = audio_play_sound(SOUND_Burning, 12, true, 1, 0, 0.5);
    
    var BurnVolume = abs(Frame - 340) / 340;
    show_debug_message($"VOL: {BurnVolume}");
    BurnVolume = (1 - BurnVolume) / (RaiseTemp ? 1 : 4);
    audio_sound_gain(BurningSound, BurnVolume, 0);
}
else if (audio_is_playing(BurningSound))
{
    audio_stop_sound(BurningSound);
}

with (Head)
{
    x = HeadX;
    y = HeadY;
    image_angle = -1 * HeadA;
    image_index = 0;
    DrawDepth = 7;
    image_index = other.HeadTurned;
}

with (Arm)
{
    x = clamp(FrontArmX, 1050, 1750);
    y = FrontArmY;
    image_angle = -1 * FrontArmA;
    DrawDepth = 6;
}

with (Torso)
{
    x = clamp(TorsoX, 1050, 1800);
    y = TorsoY;
    image_angle = -1 * TorsoA;
    DrawDepth = 5;
    image_index = floor(other.Frame / 15) % 4;
}

with (Cupcake)
{
    x = clamp(BackArmX, 0, 1580);
    y = BackArmY;
    image_angle = -1 * BackArmA;
    image_index = other.HeadTurned;
    DrawDepth = 4;
}

if (Frame > 680)
    Reset = true;

if (!Frozen)
    WaitTime -= 0.016666666666666666;

enum UnknownEnum
{
    Value_48 = 48
}
