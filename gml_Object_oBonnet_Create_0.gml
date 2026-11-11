ID = UnknownEnum.Value_55;

function initialize()
{
    AngleSpeed = 0;
    Grabbed = false;
    Thrown = false;
    XSpeed = 0;
    YSpeed = 0;
    BodyAngle = 0;
    JumpAngle = 0;
    JumpOffset = 480;
    JumpSpeed = 0;
    AngleSpeed = 0;
    Randomizer = random_range(0.8, 1.2);
    GrabDelay = 30;
    image_angle = JumpAngle;
}

initialize();
AttackTimer = 0;
Active = false;
GrabDelay = 0;
SOUND_Appear = get_misc_voicelines(ID, "Appear");
SOUND_AppearRare = get_misc_voicelines(ID, "AppearRare");
SOUND_Thrown = get_misc_voicelines(ID, "Thrown");

enum UnknownEnum
{
    Value_55 = 55
}
