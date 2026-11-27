var RelativeMouseX = x - o3DMouse.x;
var RelativeMouseY = y - o3DMouse.y;
var Accessible = character_active(UnknownEnum.Value_63);

if (RelativeMouseX > -70 && RelativeMouseX < 52 && RelativeMouseY > -60 && RelativeMouseY < 45 && mouse_check_button_pressed(mb_left) && !global.PanelUp && !global.CamUp && Accessible)
{
    mouse_clear(mb_left);
    audio_play_sound(sfxControlPanel_Open, 5, false);
    TabletUp = true;
    global.PanelUp = true;
}

if (instance_exists(oScraptrap) && TaskRunning == -1)
{
    image_index = array_length(oScraptrap.Tasks);
    ScreenFrame = 0;
}
else if (TaskRunning != -1)
{
    image_index = 11 + (floor(ScreenFrame) % 4);
    ScreenFrame += (1/30);
}

if (!Accessible)
    image_index = 11;

enum UnknownEnum
{
    Value_63 = 63
}
