if (global.MonitorSystem == "Vents")
    y = BaseY;
else
    y = BaseY + 360;

if (place_meeting(x + 24, y + 24, oMouseHitbox) && mouse_check_button_pressed(mb_left))
{
    mouse_clear(mb_left);
    
    with (oFoxyEXE)
        destroy_faker();
}

depth = -2;
Timer = (Timer + 0.016666666666666666) % 2;
