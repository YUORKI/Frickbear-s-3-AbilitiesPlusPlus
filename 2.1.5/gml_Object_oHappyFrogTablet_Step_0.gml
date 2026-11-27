if (!instance_exists(oHappyFrog))
{
    instance_destroy();
    exit;
}

if (Active)
{
    Frame++;
    image_angle = 0;
    
    if (oHappyFrog.TabletUp)
    {
        audio_stop_sound(sfxHappyFrog_Rumble);
    }
    else
    {
        if ((Frame % 120) == 1)
            audio_play_sound(sfxHappyFrog_Rumble, 2, false);
        
        if ((Frame % 120) < 60)
            image_angle = random_range(-4, 4);
    }
    
    image_index = 1;
    
    if (abs(x - o3DMouse.x) < 40 && abs(y - o3DMouse.y) < 20 && mouse_check_button_pressed(mb_left) && turnaround_accessible())
    {
        audio_play_sound(sfxMonitor, 10, false);
        
        with (oHappyFrog)
            TabletUp = true;
        
        global.PanelUp = true;
    }
    
    oHappyFrog.KillTimer -= 0.016666666666666666;
}
else
{
    image_index = 0;
    Frame = 0;
}
