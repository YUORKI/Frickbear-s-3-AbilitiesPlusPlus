var AI = global.AILevels[ID];

if (AI == 0)
{
    Mode = 2;
    WaitTime = 999;
}

var WaitMax = ceil(lerp(90, 30, AI / 20));
WaitTime = min(WaitTime, WaitMax);
WaitTime -= 0.016666666666666666;
WaitTime = max(WaitTime, 0);

switch (Mode)
{
    case 0:
        Position += Speed;
        Speed += 0.005;
        
        if (Position >= 1)
            Mode = 1;
        
        break;
    
    case 1:
        Speed = lerp(Speed, (1 - Position) * 0.8, 0.25);
        Frame++;
        
        if (Frame >= 60)
        {
            Speed = 0.02;
            Mode = 2;
            WaitTime = WaitMax - (global.Timer % 1);
        }
        
        break;
    
    case 2:
        Speed -= 0.003;
        Frame = 0;
        
        if (WaitTime <= 10 && !audio_is_playing(SOUND_Countdown))
            simple_sound(SOUND_Countdown, 500, 250, true, 0.3);
        
        if (WaitTime <= 0)
        {
            Speed = 0.05;
            Mode = 0;
            audio_play_sound(SOUND_Appear, 5, false, 1);
            audio_stop_sound(SOUND_Countdown);
        }
        
        break;
}

if (!(Mode == 2 || wearing_mask()))
    jumpscare(ID, 0);

Position += Speed;
Position = max(Position, 0);
var BodyX = 1192 + lerp(-104, 0, Position);
var BodyY = 758;
var BodyAngle = lerp(0, -40, Position);
var HeadX = BodyX + rot_x(0, -100, BodyAngle);
var HeadY = BodyY + rot_y(0, -100, BodyAngle);
var HeadAngle = lerp(0, -15, Position);
var ArmX = BodyX + rot_x(-26, -72, BodyAngle);
var ArmY = BodyY + rot_y(-26, -72, BodyAngle);
var ArmAngle = 0;
var OtherArmX = BodyX + rot_x(26, -72, BodyAngle);
var OtherArmY = BodyY + rot_y(26, -72, BodyAngle);
var OtherArmAngle = 120;

with (Head)
{
    x = HeadX;
    y = HeadY;
    image_angle = HeadAngle * -1;
    DrawDepth = 33;
}

with (Body)
{
    x = BodyX;
    y = BodyY;
    image_angle = BodyAngle * -1;
    DrawDepth = 32;
}

with (ArmL)
{
    x = ArmX;
    y = ArmY;
    image_angle = ArmAngle * -1;
    DrawDepth = 31;
    image_index = 0;
}

with (ArmR)
{
    x = OtherArmX;
    y = OtherArmY;
    image_angle = OtherArmAngle * -1;
    DrawDepth = 30;
    image_index = 1;
}
