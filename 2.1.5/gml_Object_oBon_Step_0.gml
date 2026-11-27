var AI = global.AILevels[ID];
var SecondsToActivation = lerp(80, 40, AI / 20);
var BoostInterval = 1;

if (AggroGainTimer <= 0)
{
    if (Aggro >= 1)
    {
        jumpscare(ID, -1);
        Aggro = 0;
    }
    
    Aggro += ((Randomizer * BoostInterval) / SecondsToActivation);
    AggroGainTimer = BoostInterval * random_range(0.8, 1.2);
    
    if (Aggro >= 1)
    {
        AggroGainTimer = (random_range(0.75, 1.25) * SecondsToActivation) / 5;
        reverb_sound(sfxBonClatter, -400, -400, true);
        reverb_sound(sfxBonJauntyTune, -400, -400, true);
    }
}
else if (AI > 0)
{
    AggroGainTimer -= 0.016666666666666666;
    
    if (!instance_exists(oBonZapper))
        instance_create_layer(1344, 1272, "OnWall", oBonZapper);
}

if (ShockTimer > 0)
{
    if (ShockTimer > 2.5)
        oCamera.ZapAlpha = lerp(random_range(2, -0.25), 3.5 - ShockTimer, 0.5);
    else
        oCamera.ZapAlpha = ShockTimer / 2;
    
    ShockTimer -= 0.016666666666666666;
}
