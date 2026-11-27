var ID = UnknownEnum.Value_23;
var AI = global.AILevels[ID];

if (AI <= 0)
    exit;

if (!global.CamUp && !Active)
{
    WaitForFlip = true;
    CanSpawn = true;
}

if (((WaitForFlip == true && oCamera.CamAlpha < 1) || (global.Cam != PreviousCamera && global.MonitorSystem == "Cameras")) && (CanSpawn && global.CamUp))
{
    var CanAppear = irandom_range(0, round(lerp(5, 1, AI / 20))) == 0;
    
    if (instance_exists(oMangle) && global.AILevels[UnknownEnum.Value_9] > 0)
    {
        if (oMangle.CurrentCam == global.Cam)
            CanAppear = false;
    }
    
    if (global.Cam == 0)
        CanAppear = false;
    
    if (CanAppear)
    {
        audio_play_sound(SOUND_Scare, 15, false);
        audio_play_sound(choose_from_array(SOUND_Appear), 15, false);
        Frame = 0;
        HitsLeft = round(lerp(3, 8, AI / 20));
        Camera = global.Cam;
        HeightSpeed = 0;
        Height = 0;
        Active = true;
        CanSpawn = false;
    }
    
    WaitForFlip = false;
    PreviousCamera = global.Cam;
}

if (global.Cam == Camera && global.CamUp && global.MonitorSystem == "Cameras")
{
    if (mouse_check_button_pressed(mb_left) && HitsLeft > 0 && mouse_in_zone(240, 32, 400, 300) && Active)
    {
        Shakiness += 10;
        HitsLeft--;
        Frame = max(Frame - 1, 0);
        
        for (var i = 0; i < array_length(SOUND_Appear); i++)
            audio_stop_sound(SOUND_Appear[i]);
        
        for (var i = 0; i < array_length(SOUND_Hurt); i++)
            audio_stop_sound(SOUND_Hurt[i]);
        
        audio_play_sound(choose_from_array(SOUND_Smack), 15, false);
        audio_play_sound(choose_from_array(SOUND_Hurt), 15, false);
        
        if (HitsLeft == 0)
        {
            HeightSpeed = 10;
            block_tokens();
        }
    }
    
    if (instance_exists(oPhantoms) && Active)
        oPhantoms.Aggro = 0;
}

if (HitsLeft == 0)
{
    if (Active)
    {
        audio_play_sound(SOUND_Slip, 15, false);
        audio_play_sound(choose_from_array(SOUND_Leave), 15, false);
    }
    
    if (Height > -400)
    {
        Height += HeightSpeed;
        HeightSpeed -= 2;
    }
    
    Active = false;
}

if (Frame > lerp(10, 3, AI / 20) && Active)
    jumpscare(ID, 0);

Shakiness += ((0 - Shakiness) / 10);
Frame += 0.016666666666666666;
depth = 6;

enum UnknownEnum
{
    Value_9 = 9,
    Value_23 = 23
}
