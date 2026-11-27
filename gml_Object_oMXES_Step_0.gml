depth = -2;
var TargSize = FullSize;

if (!Active)
{
    WaitTime -= 0.016666666666666666;
    
    if (WaitTime <= 0 && global.AILevels[UnknownEnum.Value_71] > 0)
        startup();
}

if (Active)
{
    var Direction_ToDest = point_direction(x, y, TargetX, TargetY);
    var Distance_ToDest = point_distance(x, y, TargetX, TargetY);
    
    if (WaitTime <= 0)
    {
        set_destination();
    }
    else if (Distance_ToDest == 0)
    {
        WaitTime -= 0.016666666666666666;
    }
    else
    {
        TargSize = 1;
        var AlterSpeed = (global.CamUp && global.MonitorSystem == "Cameras") ? Speed : (Speed / 4);
        var MaxMove = min(AlterSpeed, Distance_ToDest);
        x += lengthdir_x(MaxMove, Direction_ToDest);
        y += lengthdir_y(MaxMove, Direction_ToDest);
        
        if (Distance_ToDest <= AlterSpeed)
        {
            x = TargetX;
            y = TargetY;
            infect_camera();
            SizeSpeed = 0.2;
            audio_play_sound(SOUND_Fall, 10, false, 0.5);
        }
    }
}

image_xscale = Size;
image_yscale = Size;
AnimFrame = (AnimFrame + 1) % 20;
Size += SizeSpeed;
SizeSpeed = lerp(SizeSpeed, (TargSize - Size) * 0.2, 0.25);

if (Size < 0)
{
    Size = 0;
    SizeSpeed = 0;
}

enum UnknownEnum
{
    Value_71 = 71
}
