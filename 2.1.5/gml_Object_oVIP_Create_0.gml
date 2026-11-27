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

SuccessQuotes = array_shuffle([voc_VIP_Bigger, voc_VIP_Delightful, voc_VIP_KeepUpTheGoodWork, voc_VIP_ShootForTheMoon, voc_VIP_TheShareholders]);
Successes = 0;

enum UnknownEnum
{
    Value_72 = 72
}
