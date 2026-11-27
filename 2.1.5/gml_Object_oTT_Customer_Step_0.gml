if (!instance_exists(oMinigame_TipsyTapper))
{
    instance_destroy();
    exit;
}

if (!oMinigame_TipsyTapper.Running)
{
    image_index = 0;
    exit;
}

if (Drinking <= 0)
{
    if (abs(x - PosTarget) < 0.5)
        x = PosTarget;
    else
        x += (sign(PosTarget - x) * 0.5);
}
else
{
    x += clamp((PosTarget - x) / 10, -2, 2);
}

if (x == PosTarget)
{
    MoveTimer -= 0.016666666666666666;
    
    if (MoveTimer <= 0)
    {
        reset_timer();
        PosTarget += 16;
    }
    
    image_index = (floor(MoveTimer * 2) % 2) ? 0 : 3;
}
else
{
    switch (floor(32 + (x / 4)) % 4)
    {
        case 0:
        case 2:
            image_index = 0;
            break;
        
        case 1:
            image_index = 1;
            break;
        
        case 3:
            image_index = 2;
            break;
    }
}

if (Drinking)
    image_index = 3;

if (Drinking > 0)
{
    Drinking -= 0.016666666666666666;
    
    if (Drinking <= 0)
    {
        reset_timer();
        
        with (instance_create_depth(x, y, depth, oTT_Mug))
        {
            Speed = 0.5;
            Alley = other.Alley;
        }
        
        audio_play_sound(sfxBitThud, 2, false);
        PosTarget = x;
    }
}

y = (Alley * 32) + 26;

if (PosTarget <= -8 && x <= -8)
{
    with (oMinigame_TipsyTapper)
    {
        CustomersPerAlley[other.Alley]--;
        earn_points();
    }
    
    instance_destroy();
}

if (x > (104 + (8 * Alley)))
{
    with (oMinigame_TipsyTapper)
        die(-8, -8);
}

if (PosTarget <= 0)
    PosTarget = -16;
