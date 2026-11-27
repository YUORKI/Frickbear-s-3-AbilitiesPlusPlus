var AI = global.AILevels[ID];
depth = 8;
AmountOfPhantoms = floor(((AI * 6) / 24) + 1);

if (AI == 0)
    AmountOfPhantoms = 0;

if (global.CamUp)
{
    WaitForFlip = true;
}
else if (WaitForFlip == true)
{
    CurrentCams = array_concat([0], array_shuffle(get_phantom_list()));
    WaitForFlip = false;
    Aggro = 0;
}

if (global.Cam != CurrentCam)
{
    CurrentCam = global.Cam;
    Aggro = 0;
}

if (CurrentCams[global.Cam] != 0 && CurrentCams[global.Cam] <= AmountOfPhantoms && global.CamUp)
{
    if (oCamera.CamAlpha == 0)
        Aggro += (lerp(0.333, 0.75, global.AILevels[UnknownEnum.Value_19] / 20) / 60);
    
    if (global.Flashlight)
        Aggro = max(Aggro - ((1.5 * oCamera.FlashlightPower) / 60), -1);
}

if (Aggro >= 1)
{
    if (global.CamUp)
    {
        global.CamUp = 0;
        audio_play_sound(sfxMonitor, 10, false);
    }
    
    audio_play_sound(SOUND_Jumpscare, 10, false);
    
    with (instance_create_depth(0, 0, 0, oJumpscarePhantoms))
    {
        sprite_index = other.SPRITE_Jumpscare;
        JumpscareID = other.CurrentCams[global.Cam] - 1;
        
        if (JumpscareID == 4)
            jump_origin(0, 1);
    }
}

enum UnknownEnum
{
    Value_19 = 19
}
