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
SPRITE_Arm = skin_sprite(sJackie_Arm, ID, get_sprite_filenames(3, 4));
SPRITE_Body = skin_sprite(sJackie_Body, ID, "sprite_05.png");
SPRITE_Crank = skin_sprite(sJackie_Crank, ID, get_sprite_filenames(10, 12));
SPRITE_Hair = skin_sprite(sJackie_Hair, ID, get_sprite_filenames(6, 7));
SPRITE_Hand = skin_sprite(sJackie_Hand, ID, get_sprite_filenames(8, 9));
SPRITE_Head = skin_sprite(sJackie_Head, ID, get_sprite_filenames(1, 2));
SOUND_Drop = skin_sound(sfxSalvage_WireDrop, ID, "sq_drop");
SOUND_Slam = skin_sound(sfxMetalSlam, ID, "sq_slam");
SOUND_Popup = skin_sound(sfxJackie_Popup, ID, "sq_popup");
SOUND_Impact = skin_sound(sfxMetalImpact, ID, "sq_impact");
SOUND_Release = skin_sound(sfxJackie_Released, ID, "sq_release");
SOUND_Crank = skin_sound(sfxJackie_Crank, ID, "sq_crank");
SOUND_Pull = skin_sound(sfxJackie_Pull, ID, "sq_pull");
SOUND_Launch = skin_sound(voc_Jackie_Launch, ID, "voc_launch");
SOUND_Appear = skin_sound_generate_array(get_misc_voicelines(UnknownEnum.Value_74, "Appear"), ID, "voc_appear");
Body = -1;
Head = -1;
ArmL = -1;
HandL = -1;
PigtailL = -1;
ArmR = -1;
HandR = -1;
PigtailR = -1;

enum UnknownEnum
{
    Value_74 = 74
}
