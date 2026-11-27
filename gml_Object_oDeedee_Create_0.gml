ID = UnknownEnum.Value_51;
SPRITE_Deedee = skin_sprite(sDeedee, ID, get_sprite_filenames(1, 9));
SPRITE_Background = skin_sprite(sDeedee_BG, ID, get_sprite_filenames(10, 11));
SPRITE_FishingLine = skin_sprite(sDeedee_FishingLine, ID, "sprite_12.png");
SPRITE_Sign = skin_sprite(sDeedee_Sign, ID, "sprite_13.png");
SPRITE_Tokens = skin_sprite(sToken, ID, get_sprite_filenames(14, 17));
SOUND_Reel = skin_sound(sfxDeedee_Reel, ID, "sq_reel");
SOUND_Splash = skin_sound(sfxDeedee_Splash, ID, "sq_splash");
SOUND_Drain = skin_sound(sfxBitPunish, ID, "sq_drain");
SOUND_Clicked = skin_sound_generate_array([sfxPunch1, sfxPunch2, sfxPunch3], ID, "sq_hit");
SOUND_Kick = skin_sound(sfxMarioKick, ID, "sq_kick");
SOUND_Slip = skin_sound(sfxCartoonHitSlip, ID, "sq_slip");
SOUND_Hurt = skin_sound_generate_array(get_misc_voicelines(UnknownEnum.Value_51, "Hurt"), ID, "voc_hurt");

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
    audio_play_sound(SOUND_Reel, 10, true, 1, 0, 1.5);
    OBJ_FishingLine = instance_create_layer(1344, 448 + FishingLineY, "Behind_Wall", oOfficeSprite);
    OBJ_Sign = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
}

OBJ_FishingLine = undefined;
OBJ_Sign = undefined;
initialize();
DeedeeSurf = -1;
Active = false;
WaitTime = 0;
DeedeeHitSprite = 0;

enum UnknownEnum
{
    Value_51 = 51
}
