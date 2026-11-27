if (WaitTime <= 0)
{
    if (VentY == YShiftPoint)
    {
        var ShiftDirection = random_sign();
        
        if (VentX < 0)
            ShiftDirection = 1;
        else if (VentX > 0)
            ShiftDirection = -1;
        
        VentX += ShiftDirection;
        YShiftPoint = -2;
    }
    else
    {
        VentY += 1;
    }
    
    if (VentY > 1 && !Dangling)
    {
        var SummonPosition = irandom_range(90, 30) * VentX * -1;
        
        with (instance_create_depth(0, 0, 0, oEnnard_Dangler))
        {
            Jumpscarer = oEnnard_Jumpscarer;
            SourceWire = other;
            Tutorialize = false;
            Timer = lerp(6, 3.5, global.AILevels[UnknownEnum.Value_53] / 20);
            image_angle = SummonPosition;
        }
        
        Dangling = true;
    }
    
    array_push(Path, [VentX, VentY]);
    simple_sound(sfxVentRumble, 200 * VentX, (100 * VentY) - 100, false, (VentY * 0.1) + 0.15);
    set_wait_time();
}

if (Vanishing)
{
    VanishFrame++;
    
    if (VanishFrame >= 30)
        instance_destroy();
}
else if (!Dangling)
{
    WaitTime -= 0.016666666666666666;
}

enum UnknownEnum
{
    Value_53 = 53
}
