Pose = 0;
YOffset = 180;
YOffsetSpeed = 0;
ChangePose = false;
PoseTimer = 0;
OffsetTarget = YOffset;
Flashed = false;
AngleSpeed = 0;
FlashFrames = 0;
ShakeDegree = 0;
PosesUntilVulnerable = irandom_range(3, 5);
VulnerablePosesMissed = 0;

function set_vulnerable_ticks(arg0)
{
    PosesUntilVulnerable = round(lerp(random_range(2, 4), random_range(5, 7), arg0 / 20));
}

function reset_timer(arg0)
{
    WaitTime = lerp(46, 21, arg0 / 20) * random_range(0.9, 1.1);
}

Poser = -1;
reset_timer(global.AILevels[UnknownEnum.Value_68]);
Active = false;

enum UnknownEnum
{
    Value_68 = 68
}
