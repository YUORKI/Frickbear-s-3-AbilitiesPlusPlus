var AI = global.AILevels[ID];
var IgnitedFreddyFreeze = (character_active(UnknownEnum.Value_85) && oIgnitedFreddy.AttackMode) || (instance_exists(oFredbearAttack_BackWindow) && oFredbearAttack_BackWindow.AttackMode);

if (AI > 0 && !instance_exists(oOfficeSunPoster))
    instance_create_layer(1167, 589, "OnWall", oOfficeSunPoster);

if (global.CamUp && AI > 0)
{
    WaitForLower = true;
    
    if (AnimMode == 1 && !IgnitedFreddyFreeze)
    {
        KillTimer -= (1/30);
        WaitForLower = false;
    }
}

if (!global.CamUp && WaitForLower)
{
    AnimMode = irandom(1);
    WaitForLower = false;
    KillTimer = 0;
    
    if (AnimMode == 1)
        KillTimer = lerp(30, 8, AI / 20);
}

var BlindsOpen = instance_find(oWindowBlinds, 1).Open;

if (BlindsOpen && !IgnitedFreddyFreeze)
{
    if (AnimMode == 0 && KillTimer == 0)
    {
        reverb_sound(choose_from_array(SOUND_Sun), 0, -400, false, 1);
        KillTimer = 0.5;
    }
    else if (AnimMode == 1)
    {
        reverb_sound(choose_from_array(SOUND_Moon), 0, -400, false, 0.5);
        MoonHead.y = 1070;
        MoonYSpeed = 6;
        AnimMode = -1;
        audio_play_sound(SOUND_Scrape, 5, false);
        KillTimer = 0;
    }
}

MoonHead.y += MoonYSpeed;
MoonHead.y = max(MoonHead.y, 960);
MoonYSpeed -= 0.75;
MoonHead.image_angle = 180;

with (oOfficeSunPoster)
    PosterMode = other.AnimMode;

if (KillTimer > 0 && AI > 0 && !IgnitedFreddyFreeze)
{
    KillTimer -= 0.016666666666666666;
    
    if (KillTimer <= 0)
        jumpscare(UnknownEnum.Value_70, 0, AnimMode);
}

enum UnknownEnum
{
    Value_70 = 70,
    Value_85 = 85
}
