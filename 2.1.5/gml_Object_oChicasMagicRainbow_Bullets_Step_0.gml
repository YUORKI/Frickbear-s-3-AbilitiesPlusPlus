image_angle += (Speed * 2);
image_index = Color;
image_xscale = Size;
image_yscale = Size;
x += lengthdir_x(Speed, Direction);
y += lengthdir_y(Speed, Direction);

if (point_distance(x, y, global.MouseX, global.MouseY) < (16 * Size) && CanCollide)
{
    audio_play_sound(sfxBitPunish, 10, false);
    
    with (oChicasMagicRainbow_Bullets)
        CanCollide = false;
    
    var DrainAmount = round(oChicasMagicRainbow.PowerDrain * global.NightSpeedup);
    
    if (global.AILevels[UnknownEnum.Value_52] == 21)
        DrainAmount = 40;
    
    if (global.AILevels[UnknownEnum.Value_40] == 21)
        DrainAmount = 25;
    
    with (instance_create_depth(x, y, depth - 2, oTextPopup))
        Text = string("-{0}%", DrainAmount);
    
    drain_power(DrainAmount);
    
    with (oChicasMagicRainbow)
    {
        PowerDrain = min(oChicasMagicRainbow.PowerDrain + 1, 5);
        TimesHit++;
        
        switch (TimesHit)
        {
            case 1:
                audio_play_sound(choose_from_array(SOUND_HitOnce), 3, false);
                break;
            
            case 2:
                audio_play_sound(choose_from_array(SOUND_HitTwice), 3, false);
                break;
            
            default:
                audio_play_sound(SOUND_HitThrice[TimesHit % array_length(SOUND_HitThrice)], 3, false);
                break;
        }
    }
    
    instance_destroy();
}

Frame++;

if (x > 656 || x < -16)
{
    if (BouncesLeft > 0)
    {
        x = clamp(x, -16, 656);
        var XSpeed = lengthdir_x(Speed, Direction) * -1;
        var YSpeed = lengthdir_y(Speed, Direction);
        Direction = point_direction(0, 0, XSpeed, YSpeed);
        BouncesLeft--;
    }
    else
    {
        instance_destroy();
    }
}

if (y > 376 || y < -16)
{
    if (BouncesLeft > 0)
    {
        y = clamp(y, -16, 376);
        var XSpeed = lengthdir_x(Speed, Direction);
        var YSpeed = lengthdir_y(Speed, Direction) * -1;
        Direction = point_direction(0, 0, XSpeed, YSpeed);
        BouncesLeft--;
    }
    else
    {
        instance_destroy();
    }
}

enum UnknownEnum
{
    Value_40 = 40,
    Value_52 = 52
}
