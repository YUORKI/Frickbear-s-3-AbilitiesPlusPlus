function initialize()
{
    Randomizer = random_range(0.85, 1.15);
    FishingLineY = 80;
    FishingLineSpeed = 0;
    AttackFrame = -60;
    Splashed = false;
    ReelSpeed = 0;
    StealFlipFlop = true;
    AttackFrame = -999;
    ArmAngle = -75;
    ArmOffset = 16;
    ArmSpeed = 0;
    Shake = 0;
    DeedeeClicked = false;
    DeedeeAngle = 0;
    DeedeeYOffset = 0;
    DeedeeYSpeed = 0;
    BGXOffset = 0;
    BGXSpeed = 0;
    BGAngle = 0;
    BGYSpeed = 0;
    BGYOffset = 0;
    TokensDrained = 0;
    HP = 1;
}

function attack(arg0)
{
    initialize();
    Active = true;
    AttackFrame = lerp(-120, -90, arg0 / 20);
    HP = 3;
    audio_play_sound(sfxDeedee_Reel, 10, true, 1, 0, 1.5);
    OBJ_FishingLine = instance_create_layer(1344, 448 + FishingLineY, "Behind_Wall", oOfficeSprite);
    OBJ_Sign = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
}

OBJ_FishingLine = undefined;
OBJ_Sign = undefined;
SPRITE_FishingLine = sDeedee_FishingLine;
SPRITE_Sign = sDeedee_Sign;
initialize();
DeedeeSurf = -1;
Active = false;
WaitTime = 0;
DeedeeHitSprite = 0;
SOUND_Hurt = get_misc_voicelines(UnknownEnum.Value_51, "Hurt");

enum UnknownEnum
{
    Value_51 = 51
}
