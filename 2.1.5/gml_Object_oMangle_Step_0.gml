var AI = global.AILevels[ID];

if (AI == 0)
{
    with (StickyNote)
        sprite_index = sNOTHING;
    
    CurrentCam = 0;
    exit;
}

if (global.CamUp)
{
    WaitForFlip = true;
}
else if (WaitForFlip == true)
{
    CamNum = (CamNum + 1) % array_length(CamOrder);
    
    while (CamOrder[CamNum] == global.Cam || CamOrder[CamNum] == global.SavedCam)
        CamNum = (CamNum + 1) % array_length(CamOrder);
    
    CurrentCam = CamOrder[CamNum];
    WaitForFlip = false;
}

with (StickyNote)
{
    sprite_index = other.SPRITE_StickyNote;
    image_index = other.CurrentCam;
}

if (global.CamUp && global.MonitorSystem == "Cameras" && global.Cam == CurrentCam)
{
    if (!audio_is_playing(SOUND_Garble))
        audio_play_sound(SOUND_Garble, 20, true);
    
    Exposure += 1;
}
else
{
    audio_stop_sound(SOUND_Garble);
    var ExposureDrainRate = lerp(300, 600, AI / 20);
    Exposure = max(Exposure - (1 / ExposureDrainRate), 0);
}

if (Exposure > lerp(180, 60, AI / 20))
    jumpscare(ID, 0);

depth = 4;
