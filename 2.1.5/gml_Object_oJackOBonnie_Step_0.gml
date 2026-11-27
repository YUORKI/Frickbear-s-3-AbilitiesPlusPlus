var AI = global.AILevels[ID];

if (AI == 0)
{
    Frame = 0;
    Attacking = false;
    exit;
}

var FlashX = o3DMouse.x - 1344;

if (Reset == true)
{
    Frame = 0;
    WaitTime = lerp(48, 23, AI / 20) * random_range(0.75, 1.25);
    Reset = false;
    Attacking = false;
}

if (!Attacking)
{
    ClatterGain = max(ClatterGain - (1/120), 0);
    
    if (ClatterGain == 0)
        audio_stop_sound(SOUND_Approach);
    
    var ChosenDoorway = find_available_doorway(true);
    
    if (Frame > WaitTime && ChosenDoorway != 0)
    {
        DoorClosedTime = 0;
        Frame = 0;
        Attacking = true;
        Side = ChosenDoorway;
        occupy_doorway(ID, Side);
        ClatterGain = 0;
        audio_play_sound_on(CoolEmitter, SOUND_Approach, false, 25, 1, 0, 0.9);
    }
}
else
{
    var KillTime = lerp(8, 4.5, AI / 20);
    ClatterGain += (1.5 / (KillTime * 60));
    
    if (global.Doors[sign_to_binary(Side)])
        DoorClosedTime += 0.016666666666666666;
    
    if (DoorClosedTime > 0.5)
    {
        audio_stop_sound(SOUND_Approach);
        simple_sound(sfxBlock, 300 * Side, 0, false);
        simple_sound(SOUND_Blocked, 300 * Side, 0, false);
        Reset = true;
        
        if (!instance_exists(oLaserDoor))
            global.Temperature += lerp(5, 10, AI / 20);
        
        clear_doorway(ID, Side);
    }
    else if (Frame > 1 && ClatterGain > 0.25 && (abs(FlashX) > 400 && abs(FlashX) < 620) && sign(FlashX) == Side && global.Flashlight)
    {
        audio_stop_sound(SOUND_Approach);
        simple_sound(SOUND_Blocked, 256 * Side, 0, false, 1, 10, 1.1);
        simple_sound(SOUND_Scare, 256 * Side, 0, false, 1);
        block_tokens();
        Reset = true;
        
        with (instance_create_depth(0, 0, depth, oJackOBonnie_Animation))
            Side = other.Side * -1;
        
        clear_doorway(ID, Side);
    }
    
    if (Frame > KillTime)
        jumpscare(ID, Side);
}

Frame += 0.016666666666666666;
global.AudioBusSPECIAL3.effects[1].gain = ClatterGain * 2;
global.AudioBusSPECIAL3.effects[0].mix = (ClatterGain / 2) + 0.5;
global.AudioBusSPECIAL3.effects[0].size = 1 - (ClatterGain / 2);

if (audio_emitter_exists(CoolEmitter))
    audio_emitter_position(CoolEmitter, oCamera.x + (Side * 256), oCamera.y + (ClatterGain * -256), oCamera.depth);
