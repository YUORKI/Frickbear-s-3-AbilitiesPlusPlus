var AI = global.AILevels[ID];
var DuckPos = 0.2;
var DuckingDown = AttackDegree < DuckPos;
var BlindsOpen = instance_find(oWindowBlinds, 0).Open;
var Flashed = global.Flashlight && BlindsOpen;

if (Flashed && AnimMode != "Scared")
{
    Frame = 0;
    StretchSpeed = -0.1;
    AnimMode = "Scared";
}

if (!Flashed && AnimMode == "Scared")
{
    Frame = 0;
    StretchSpeed = 0.1;
    AnimMode = "Approach";
}

var Time_ToBackup = lerp(1.25, 2.5, AI / 20) / oCamera.FlashlightPower;
var Time_ToWindow = lerp(50, 25, AI / 20);
var Time_WindowToKill = lerp(10, 5, AI / 20);

if (Flashed && !DuckingDown)
{
    AttackDegree = clamp(AttackDegree - (0.5 / (60 * Time_ToBackup)), 0, 1);
    
    if (AttackDegree < DuckPos && AttackDegree > 0)
    {
        AttackDegree = 0;
        YOffsetSpeed = -3;
    }
    
    if (!HurtSoundPlayed)
    {
        audio_play_sound(sfxFireImpact, 10, false, Size);
        HurtSoundPlayed = true;
    }
}
else if (!(BlindsOpen && AttackDegree < 1) && AI > 0)
{
    var Time = (AnimMode == "Approach") ? Time_ToWindow : Time_WindowToKill;
    AttackDegree += (1 / (60 * Time));
    
    if (AttackDegree >= 1.5)
    {
        jumpscare(ID);
        exit;
    }
    
    HurtSoundPlayed = false;
}

Size = clamp(AttackDegree, DuckPos, 1);
audio_sound_gain(Static, Flashed * Size * !DuckingDown, 0);
var PrevSize = Size;

if (AttackDegree >= 1 && AnimMode == "Approach")
{
    StretchSpeed = 0.1;
    AnimMode = "Readying";
}

var XScale = Size * Stretch * 1;
var YScale = Size / Stretch;
var AngryAnimation = Size == 1;

if (AnimMode == "Readying")
    global.Temperature += 0.016666666666666666;

x = 1238 + ((1 - Size) * 96);
y = 1248;
var ColorDegree = 255 * lerp(Size, 1, 0.2);
var Color = make_color_rgb(ColorDegree, ColorDegree, ColorDegree);
var BodyX = x + (AngryAnimation ? 0 : (dsin(Frame) * -4));
var BodyY = y + (Flashed ? (abs(dsin(Frame * 8)) * -5) : (dcos(Frame) * -4)) + YOffset;
var BodyA = AngryAnimation ? random_range(-1, 1) : ((dsin(Frame) * 2) + 8);
var HeadX = BodyX + rot_x(-36 * XScale, -82 * YScale, BodyA);
var HeadY = BodyY + rot_y(-36 * XScale, -82 * YScale, BodyA);
var HeadA = AngryAnimation ? random_range(-1, 1) : ((dsin(Frame - 30) * 2) + 8);
var LArmX = BodyX + rot_x(-65 * XScale, -51 * YScale, BodyA);
var LArmY = BodyY + rot_y(-65 * XScale, -51 * YScale, BodyA);
var LArmA = AngryAnimation ? random_range(-1, 1) : (dsin(Frame - 45) * 2);
var RArmX = BodyX + rot_x(36 * XScale, -71 * YScale, BodyA);
var RArmY = BodyY + rot_y(36 * XScale, -71 * YScale, BodyA);

with (LArm)
{
    sprite_index = AngryAnimation ? sNOTHING : sGrimmFoxy_Arm;
    image_index = 0;
    x = LArmX;
    y = LArmY;
    image_xscale = XScale;
    image_yscale = YScale;
    image_angle = LArmA * -1;
    image_blend = Color;
    DrawDepth = 5;
}

with (Body)
{
    image_index = AngryAnimation;
    x = BodyX;
    y = BodyY;
    image_xscale = XScale;
    image_yscale = YScale;
    image_angle = BodyA * -1;
    image_blend = Color;
    DrawDepth = 6;
}

with (Head)
{
    image_index = AngryAnimation;
    x = HeadX;
    y = HeadY;
    image_xscale = XScale;
    image_yscale = YScale;
    image_angle = HeadA * -1;
    image_blend = Color;
    DrawDepth = 7;
}

with (RArm)
{
    image_index = 2 + Flashed;
    x = RArmX;
    y = RArmY;
    image_xscale = XScale;
    image_yscale = YScale;
    image_angle = LArmA * -1;
    image_blend = Color;
    DrawDepth = 8;
}

audio_sound_gain(Burning, clamp((AttackDegree - 0.9) * 5, 0, 1) * 0.5, 0);
Stretch += StretchSpeed;
StretchSpeed = lerp(StretchSpeed, (1 - Stretch) * 0.35, 0.35);
YOffset += YOffsetSpeed;
YOffsetSpeed = lerp(YOffsetSpeed, ((DuckingDown * 240) - YOffset) * 0.2, DuckingDown ? 0.05 : 0.2);
Frame++;
