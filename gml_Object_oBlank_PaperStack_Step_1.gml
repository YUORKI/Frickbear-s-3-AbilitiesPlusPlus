var RelativeMouseX = x - o3DMouse.x;
var RelativeMouseY = y - o3DMouse.y;

if (mouse_check_button_pressed(mb_left) && RelativeMouseX >= -64 && RelativeMouseX <= 48 && RelativeMouseY <= 40 && RelativeMouseY >= -24 && turnaround_accessible())
{
    audio_play_sound(sfxPaperFlip, 0, false);
    mouse_clear(mb_left);
    
    with (oBlank)
        PaperUp = true;
    
    global.PanelUp = true;
}

if (!instance_exists(oBlank))
    instance_destroy();
else if (oBlank.rated)
    instance_destroy();
