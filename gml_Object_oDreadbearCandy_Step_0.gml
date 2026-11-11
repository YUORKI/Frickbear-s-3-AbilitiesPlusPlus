depth = 10;
image_index = Color;

if (Grabbed == true)
{
    x = global.MouseX;
    y = global.MouseY;
}
else
{
    if (instance_exists(oDreadbear))
    {
        if (abs(o3DMouse.x - 1344) < 50 && (o3DMouse.y - 704) < 0 && (o3DMouse.y - 704) > -100 && oDreadbear.Mode == "Hoist" && Alpha == 1)
        {
            with (oDreadbear)
                eat_candy();
            
            instance_destroy();
        }
    }
    
    DropSpeed += 1;
    y += DropSpeed;
    Alpha -= (1/15);
    
    if (Alpha <= 0)
        instance_destroy();
}

if (!mouse_check_button(mb_left))
    Grabbed = false;

Size += ((1 - Size) / 5);
