if (!instance_exists(oMinigame_TipsyTapper))
{
    instance_destroy();
    exit;
}

if (!oMinigame_TipsyTapper.Running)
{
    image_index = (Speed < 0) ? 4 : (floor(x / 8) % 4);
    exit;
}

if ((x + Speed) < 8 && Speed < 0)
{
    with (oMinigame_TipsyTapper)
        die(8, other.y);
    
    instance_destroy();
}

if (x > -8 && x < 160)
    x += Speed;
else
    instance_destroy();

if (Speed > 0)
{
    if (abs(x - oMinigame_TipsyTapper.TipsyX) < 16 && Alley == oMinigame_TipsyTapper.Alley)
    {
        audio_play_sound(sfxBitThud, 2, false);
        
        with (oMinigame_TipsyTapper)
            earn_points();
        
        instance_destroy();
    }
    else if (x > (112 + (8 * Alley)))
    {
        with (oMinigame_TipsyTapper)
            die(other.x, other.y);
        
        instance_destroy();
    }
}

image_index = (Speed < 0) ? 4 : (floor(x / 8) % 4);
y = (Alley * 32) + 32;
