Frame = 0;
JawOffset = 0;
JawDirection = 1;
Pose = 0;
HeadAOffset = 0;
HeadATarget = 0;
BodyAOffset = 0;
BodyATarget = 0;
ArmLOffset = 0;
ArmLTarget = 0;
LowerArmLOffset = 0;
LowerArmLTarget = 0;
ArmROffset = 0;
ArmRTarget = 0;
LowerArmROffset = 0;
LowerArmRTarget = 0;
Aggro = 0;
Surf = -1;
YOffset = 0;
Randomizer = random_range(0.8, 1.2);

function when_zapped()
{
    audio_play_sound(sfxClick, 10, false);
    
    if (Aggro < 1)
    {
        audio_stop_sound(sfxBonClatter);
        HeadAOffset = 4 * random_sign();
        BodyAOffset = 8 * random_sign();
        ArmLOffset = 5 * random_sign();
        ArmROffset = 5 * random_sign();
        LowerArmROffset = 5 * random_sign();
        LowerArmLOffset = 5 * random_sign();
        Randomizer = (2 - Randomizer) * random_range(0.8, 1.2);
        
        if (Aggro > 0.8)
            audio_play_sound(sfxMetalImpact, 10, false);
        
        block_tokens();
        Aggro = -0.1;
    }
    else
    {
        AggroGainTimer += 1;
    }
    
    reverb_sound(sfxZap2, 0, 0, false, 1.5, 1, 0);
    ShockTimer = 3.5;
    oCamera.ZapAlpha = 1;
}

function ticking_sound()
{
    simple_sound(choose(sfxBonClick1, sfxBonClick2, sfxBonClick3), -500, -200, false, random_range(0.05, 0.2), 4, random_range(0.7, 1));
}

AggroGainTimer = 1;
ShockTimer = 0;
ID = UnknownEnum.Value_82;
CandyBowlMode = false;

enum UnknownEnum
{
    Value_82 = 82
}
