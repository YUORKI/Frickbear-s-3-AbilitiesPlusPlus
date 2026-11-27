ID = UnknownEnum.Value_82;
SPRITE_Body = skin_sprite(sBon_Body, ID, "sprite_05.png");
SPRITE_Ear = skin_sprite(sBon_Ear, ID, get_sprite_filenames(3, 4));
SPRITE_Hand = skin_sprite(sBon_Hand, ID, get_sprite_filenames(6, 7));
SPRITE_Head = skin_sprite(sBon_Head, ID, "sprite_01.png");
SPRITE_Jaw = skin_sprite(sBon_Jaw, ID, "sprite_02.png");
SPRITE_Leg = skin_sprite(sBon_Leg, ID, get_sprite_filenames(8, 9));
SPRITE_LowerArm = skin_sprite(sBon_LowerArm, ID, get_sprite_filenames(10, 11));
SPRITE_Tie = skin_sprite(sBon_Tie, ID, "sprite_12.png");
SPRITE_UpperArm = skin_sprite(sBon_UpperArm, ID, get_sprite_filenames(13, 14));
SPRITE_Zapper = skin_sprite(sBon_Zapper, ID, get_sprite_filenames(15, 16));
SPRITE_Life = skin_sprite(sConsumableLife_Glowing, ID, "sprite_17.png");
SOUND_Clatter = skin_sound(sfxBonClatter, ID, "sq_clatter");
SOUND_Music = skin_sound(sfxBonJauntyTune, ID, "sq_music");
SOUND_Impact = skin_sound(sfxMetalImpact, ID, "sq_impact");
SOUND_Zapped = skin_sound(sfxZap2, ID, "sq_zap");
SOUND_Move = skin_sound_generate_array([sfxBonClick1, sfxBonClick2, sfxBonClick3], ID, "sq_move");
SOUND_Clicked = skin_sound(sfxClick, ID, "sq_click");
SOUND_Error = skin_sound(sfxError, ID, "sq_error");
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
    audio_play_sound(SOUND_Clicked, 10, false);
    
    if (Aggro < 1)
    {
        audio_stop_sound(SOUND_Clatter);
        HeadAOffset = 4 * random_sign();
        BodyAOffset = 8 * random_sign();
        ArmLOffset = 5 * random_sign();
        ArmROffset = 5 * random_sign();
        LowerArmROffset = 5 * random_sign();
        LowerArmLOffset = 5 * random_sign();
        Randomizer = (2 - Randomizer) * random_range(0.8, 1.2);
        
        if (Aggro > 0.8)
            audio_play_sound(SOUND_Impact, 10, false);
        
        block_tokens();
        Aggro = -0.1;
    }
    else
    {
        AggroGainTimer += 1;
    }
    
    reverb_sound(SOUND_Zapped, 0, 0, false, 1.5, 1, 0);
    ShockTimer = 3.5;
    oCamera.ZapAlpha = 1;
}

function ticking_sound()
{
    simple_sound(choose_from_array(SOUND_Move), -500, -200, false, random_range(0.05, 0.2), 4, random_range(0.7, 1));
}

AggroGainTimer = 1;
ShockTimer = 0;
ID = UnknownEnum.Value_82;
CandyBowlMode = false;

enum UnknownEnum
{
    Value_82 = 82
}
