if (!instance_exists(oArchie))
{
    instance_destroy();
    exit;
}

var RelativeMouseX = x - o3DMouse.x;
var RelativeMouseY = y - o3DMouse.y;
var Active = !oArchie.WonGame;
image_index = !Active;

if (mouse_check_button_pressed(mb_left) && RelativeMouseX >= -32 && RelativeMouseX <= 72 && RelativeMouseY <= 40 && RelativeMouseY >= -50 && turnaround_accessible() && Active)
{
    audio_play_sound(sfxControlPanel_Open, 0, false);
    mouse_clear(mb_left);
    
    with (oArchie)
        TabletUp = true;
    
    global.PanelUp = true;
}
