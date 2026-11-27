var AI = global.AILevels[ID];

if (!instance_exists(oWetFloorBot) && character_active(ID))
    instance_create_layer(0, 0, "InFrontOf_Wall", oWetFloorBot);

if (AI <= 0)
    exit;

depth = 90;
var TimeToMove = lerp(60, 30, AI / 20) * Randomizer;

if (!InHallway)
{
    var TimeToLook = TimeToMove * 0;
    
    if (Side == 0 && (Timer / TimeToMove) >= 0.66)
    {
        if (irandom(2) == 1)
            Side = oWetFloorBot.Side;
        else
            Side = oWetFloorBot.Side * -1;
        
        fuzz_up(UnknownEnum.Value_2);
    }
    
    if (Timer >= TimeToMove)
    {
        VanishTimer = 1.8;
        Timer = 0;
        InHallway = true;
        fuzz_up(UnknownEnum.Value_2);
        reverb_sound(SOUND_Appear, Side * 10, -400, false, 0.8, 1, 0.1);
        audio_sound_gain(BubblingSound, 0.5, 1000);
    }
}
else
{
    var TimeToKill = lerp(32, 16, AI / 20);
    
    if ((Timer / TimeToKill) >= 0.9 && Side == oWetFloorBot.Side)
    {
        block_tokens();
        fuzz_up(UnknownEnum.Value_4 + sign_to_binary(Side));
        reverb_sound(SOUND_Leave, Side * 10, -400, false, 0.8, 1, 0.1);
        VanishTimer = 2.5;
        Randomizer = random_range(0.8, 1.2);
        InHallway = false;
        Side = 0;
        Timer = 0;
        audio_sound_gain(BubblingSound, 0, 1000);
    }
    else if (Timer >= TimeToKill && !global.Doors[sign_to_binary(Side)])
    {
        jumpscare(ID, Side);
    }
}

Timer += 0.016666666666666666;

if (VanishTimer > 0)
{
    VanishTimer = max(0, VanishTimer - 0.016666666666666666);
    
    if (VanishTimer == 0)
        fuzz_up(!InHallway ? UnknownEnum.Value_2 : (UnknownEnum.Value_4 + sign_to_binary(Side)));
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_4 = 4
}
