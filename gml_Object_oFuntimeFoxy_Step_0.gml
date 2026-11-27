AI = global.AILevels[ID];

if (AI <= 0)
    exit;

if (Initialize)
{
    Showtime = global.Timer;
    delay_showtime(AI);
    Initialize = false;
}

if (global.Timer >= Showtime)
{
    var AutoBlock = !doorway_available(1, false);
    
    if (global.Doors[1] || AutoBlock)
    {
        simple_sound(sfxBlock, 300, 0, false, 1);
        simple_sound(SOUND_Blocked, 300, 0, false, 0.5);
        
        if (!AutoBlock)
            block_tokens();
        
        fuzz_up(UnknownEnum.Value_2);
        delay_showtime(AI);
    }
    else
    {
        jumpscare(ID, 1);
    }
}

enum UnknownEnum
{
    Value_2 = 2
}
