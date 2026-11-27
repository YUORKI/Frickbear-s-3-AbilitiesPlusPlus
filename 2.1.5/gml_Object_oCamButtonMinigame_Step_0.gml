if (global.MonitorSystem == "Games")
    y = BaseY;
else
    y = BaseY + 360;

var Data = get_minigame_data(MinigameID);

if (place_meeting(x, y, oMouseHitbox) && mouse_check_button_pressed(mb_left) && !instance_exists(Data.Object))
{
    if (Disabled)
    {
        audio_play_sound(sfxError, 10, false);
        exit;
    }
    
    audio_play_sound(sfxCamSwitch, 10, false);
    instance_destroy(oMinigameParent);
    
    if (MinigameID != undefined)
    {
        instance_create_layer(-256, -256, "CameraView", Data.Object);
        
        with (oSleepyMoon)
            CurMinigame = other.MinigameID;
    }
    
    with (oCameraUI)
        MinigameDescriptionText = Data.Desc;
}
