ID = UnknownEnum.Value_72;
SPRITE_Body = skin_sprite(sVIP, ID, ["sprite_01.png", "sprite_02.png"]);
SPRITE_Background = skin_sprite(sVIP_ScrollingBG, ID, "sprite_03.png");
SOUND_Hmm = skin_sound_generate_array([voc_VIP_Hmm1, voc_VIP_Hmm2, voc_VIP_Hmm3], ID, "voc_hmm");
SOUND_Pass = skin_sound_generate_array([voc_VIP_Bigger, voc_VIP_Delightful, voc_VIP_KeepUpTheGoodWork, voc_VIP_ShootForTheMoon, voc_VIP_TheShareholders], ID, "voc_pass");
SOUND_Sparkle = skin_sound(sfxSparkleImpact, ID, "sq_pass");
SOUND_Tick = skin_sound(sfxTick, ID, "sq_tick");
image_angle = 45;
sprite_index = sNOTHING;
AngleSpeed = 0;
Position = 0;
PositionSpeed = 0;
YOffset = 0;
YOffsetSpeed = 0;
FadingOut = true;
Frame = 0;
PigSurf = -1;
LoopFrame = 0;
VisualTokenQuota = 0;
Frame = 999;
RealQuota = 0;

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (global.Tokens < RealQuota)
    {
        jumpscare(UnknownEnum.Value_72);
        return true;
    }
    
    return false;
}

SuccessQuotes = array_shuffle(SOUND_Pass);
Successes = 0;

enum UnknownEnum
{
    Value_72 = 72
}
