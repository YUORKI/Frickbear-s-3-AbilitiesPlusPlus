ID = UnknownEnum.Value_85;
SPRITE_Head = skin_sprite(sIgnitedFreddy_Head, ID, "sprite_01.png");
SPRITE_LowerArm = skin_sprite(sIgnitedFreddy_LowerArm, ID, get_sprite_filenames(2, 3));
SPRITE_Pelvis = skin_sprite(sIgnitedFreddy_Pelvis, ID, "sprite_04.png");
SPRITE_Torso = skin_sprite(sIgnitedFreddy_Torso, ID, "sprite_05.png");
SPRITE_UpperArm = skin_sprite(sIgnitedFreddy_UpperArm, ID, get_sprite_filenames(6, 7));
SOUND_Ambience = skin_sound(sfxIgnitedFreddy_Static, ID, "sq_static");
SOUND_Scare = skin_sound(sfxIgnitedFreddy_Spotted, ID, "sq_scare");
SOUND_Appear = skin_sound(sfxIgnitedFreddy_Laugh, ID, "sq_appear");
SOUND_Hit = skin_sound(sfxIgnitedFreddy_Hit2, ID, "sq_flash");
SOUND_Leave = skin_sound(sfxIgnitedFreddy_Hit1, ID, "sq_leave");
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

enum UnknownEnum
{
    Value_85 = 85
}
