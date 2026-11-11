DefaultHeadTarget = 160;

function initialize()
{
    Frame = 0;
    HeadPosition = -128;
    HandPosition = -128;
    HeadSpeed = 0;
    HandSpeed = 0;
    DefeatPosition = -144;
    HeadTargetY = DefaultHeadTarget;
    Defeated = false;
    Crankitude = 2;
    CrankingIt = false;
    CrankAngle = 0;
    HeadStretch = 1;
    HeadStretchSpeed = 0;
    Expression = 0;
    CrankPos = 440;
    CrankSpeed = 0;
    PermanentProgressGain = 0;
    Randomizer = random_range(0.8, 1.2);
    KillTimer = 999;
}

initialize();
Active = false;
ID = UnknownEnum.Value_74;
Body = -1;
Head = -1;
ArmL = -1;
HandL = -1;
PigtailL = -1;
ArmR = -1;
HandR = -1;
PigtailR = -1;
SOUND_Appear = get_misc_voicelines(UnknownEnum.Value_74, "Appear");

enum UnknownEnum
{
    Value_74 = 74
}
