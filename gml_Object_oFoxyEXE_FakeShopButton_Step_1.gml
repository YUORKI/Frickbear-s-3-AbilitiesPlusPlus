instance_deactivate_object(PlacementItem);

if (place_meeting(x, y, oMouseHitbox) && mouse_check_button_pressed(mb_left))
{
    with (oFoxyEXE)
        destroy_faker();
    
    mouse_clear(mb_left);
}

if (global.MonitorSystem == "Shop")
    y = BaseY;
else
    y = BaseY + 360;
