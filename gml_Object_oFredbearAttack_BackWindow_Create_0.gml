ID = UnknownEnum.Value_126;
DefaultCenterX = 1344;
DefaultCenterY = 1184;
CenterX = DefaultCenterX;
CenterY = DefaultCenterY;
XRange = 72;
YRange = 40;
TargetAngle = 0;
Angle = 0;
AngleSpeed = 0;
Head = -1;
Static = -1;

function initialize()
{
    XSpeed = 0;
    YSpeed = 0;
    CenterY = DefaultCenterY;
    TotalFlashesNeeded = 99;
    FlashHP = 1;
    Side = -1;
    
    if (Head != -1)
    {
        instance_destroy(Head);
        instance_destroy(Body);
        instance_destroy(LUpperArm);
        instance_destroy(RUpperArm);
        instance_destroy(LLowerArm);
        instance_destroy(RLowerArm);
        instance_destroy(Pelvis);
    }
    
    Head = -1;
    Body = -1;
    LUpperArm = -1;
    RUpperArm = -1;
    LLowerArm = -1;
    RLowerArm = -1;
    Pelvis = -1;
    Active = false;
    Timer = 0;
    KillTimer = 0;
    Spooked = false;
    Randomizer = random_range(0.8, 1.2);
}

initialize();
AttackMode = false;
DeletionFlag = false;

enum UnknownEnum
{
    Value_126 = 126
}
