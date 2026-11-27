ID = UnknownEnum.Value_66;
Position = 0;
PositionSpeed = 0;
LeaningIn = false;
Squish = 1;
SquishSpeed = 0;
Hit = false;
HeadOffset = 0;
HeadOffsetSpeed = 0;
GregX = 0;
GregY = 0;
GregYSpeed = 0;
GregSize = 0.5;
GregSquish = 1;
GregSquishSpeed = 0;
Body = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
Head = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
UpperArm = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
LowerArm = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
Gregory = instance_create_layer(-999, -999, "Behind_Wall", oOfficeSprite);
BonkHeight = 0;
Side = random_sign();
StepPosition = 0;
StepSoundTimer = 0;
FootstepSound = true;
FunctionallyHit = false;
ReverseWalk = false;

function set_time_to_attack()
{
    TimeToApproach = lerp(40, 20, global.AILevels[UnknownEnum.Value_66] / 20) * random_range(0.8, 1.1);
    StepPosition = 0;
    StepSoundTimer = 0;
}

TimeToApproach = 999;

function slam(arg0)
{
    if (binary_to_sign(arg0) != Side)
        exit;
    
    if (FunctionallyHit)
        exit;
    
    with (oDoor)
        Bounce = false;
    
    audio_play_sound(sfxMetalImpact, 10, false);
    audio_play_sound(sfxScoop, 10, false);
    audio_stop_sound(Voiceclip);
    alarm[0] = 2;
    alarm[1] = 120;
    Squish = 0.6;
    HeadOffsetSpeed = 12;
    PositionSpeed = 0.1;
    GregSquish = 0.75;
    GregYSpeed = -12;
    GregSize = 0.5;
    FunctionallyHit = true;
}

Voiceclip = -1;
PossibleLines = array_shuffle(get_misc_voicelines(UnknownEnum.Value_66, "Greet"));
LinesSaid = 0;

enum UnknownEnum
{
    Value_66 = 66
}
