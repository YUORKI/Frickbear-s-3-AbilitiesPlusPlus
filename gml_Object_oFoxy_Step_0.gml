var AI = global.AILevels[ID];

if (AI == 0)
    Phase = 0;

var TimeFrozen = lerp(6, 3, AI / 20);
WaitTime = 360 - (AI * 15);
var CheeseConditions = Mode == "Wait" && !instance_exists(oMarionette) && TimeSinceFlipped > 55;

if (Mode == "Wait")
{
    var Speedup = lerp(1, global.NightSpeedup, 0.5);
    
    if (camera_viewed(UnknownEnum.Value_3))
        FreezeFrames = TimeFrozen;
    else if (FreezeFrames > 0)
        FreezeFrames -= 0.016666666666666666;
    else if (global.CamUp || global.Cam == UnknownEnum.Value_3)
        Phase += (Speedup / 90);
    else
        Phase += (Speedup / 60);
    
    Phase = max(Phase, 0);
    
    if (Phase >= WaitTime && doorway_available(-1))
    {
        simple_sound(SOUND_Run, -400, -400, false, 1.5, 50);
        Mode = "Run";
        Phase = 0;
        occupy_doorway(ID, -1);
    }
}
else
{
    Phase += 1;
    
    if (Phase >= 90)
    {
        if (global.Doors[0])
        {
            var BlockSound = SOUND_BlockedRare;
            
            if (irandom(9) != 0)
                BlockSound = choose_from_array(SOUND_Blocked);
            
            if (!CheeseConditions)
            {
                reverb_sound(BlockSound, -300, 0, false, 1);
                block_tokens();
            }
            
            simple_sound(sfxBlock, -300, 0, false, 1);
            clear_doorway(ID, -1);
            
            if (!instance_exists(oLaserDoor))
                drain_power(PowerDrain);
            
            PowerDrain = min(PowerDrain + 1, 5);
            Phase = 0;
            Mode = "Wait";
        }
        else
        {
            jumpscare(ID, -1);
        }
    }
}

if (!global.CamUp)
{
    TimeSinceFlipped += 0.016666666666666666;
}
else
{
    TimeSinceFlipped = 0;
    Anticheese = false;
    CheeseConditions = false;
}

if (CheeseConditions)
{
    if (!Anticheese)
    {
        reverb_sound(SOUND_Anticheese, -300, 300, false, 1);
        Anticheese = true;
    }
    
    if (TimeSinceFlipped > 60)
        Phase = WaitTime;
}

depth = 50;

enum UnknownEnum
{
    Value_3 = 3
}
