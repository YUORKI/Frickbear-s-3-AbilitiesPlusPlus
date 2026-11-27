if (global.MonitorSystem == "Cameras")
    y = BaseY;
else
    y = BaseY + 360;

if (global.CamUp && global.MonitorSystem == "Cameras" && (place_meeting(x, y, oMouseHitbox) && mouse_check_button_pressed(mb_left)))
{
    with (oFoxyEXE)
        destroy_faker();
    
    fuzz_up();
}
