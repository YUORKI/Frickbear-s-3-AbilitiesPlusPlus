var ID = UnknownEnum.Value_65;
var AI = global.AILevels[ID];
var Speed = lerp(1.5, 2, AI / 20);
var StormDuration = round(lerp(180, 360, AI / 20));

if (WaitTime <= 0 && AI > 0)
{
    Frame = -30;
    set_wait_time(AI);
    Direction += 90;
    audio_play_sound(sfxFrostbearWind, 50, false, 0.5);
    audio_sound_gain(sfxFrostbearWind, 1, 1000);
}
else if (Frame >= StormDuration)
{
    WaitTime -= 0.016666666666666666;
}

if (Frame >= -30)
{
    audio_sound_pitch(sfxFrostbearWind, lerp(1, PushSpeed / Speed, 0.5));
    
    if (Frame < StormDuration && Frame > 0)
    {
        PushSpeed += ((Speed - PushSpeed) / 20);
        global.Temperature -= 0.016666666666666666;
    }
    else
    {
        PushSpeed *= 0.95;
    }
    
    var ScaleWidth = window_get_width() / 640;
    var ScaleHeight = window_get_height() / 360;
    var RawPushX = ScaleWidth * lengthdir_x(PushSpeed, Direction);
    var RawPushY = ScaleHeight * lengthdir_y(PushSpeed, Direction);
    PushX += RawPushX;
    PushY += RawPushY;
    display_mouse_set(display_mouse_get_x() + floor(PushX), display_mouse_get_y() + floor(PushY));
    PushX -= floor(PushX);
    PushY -= floor(PushY);
    
    if (SnowflakeFrame <= 0)
    {
        var SnowflakeSpeed = (Speed * 640) / 360;
        var SpawnX, SpawnY;
        
        switch (Direction % 360)
        {
            case 0:
                SpawnX = -16;
                SpawnY = random_range(0, 640);
                break;
            
            case 90:
                SpawnX = random_range(0, 640);
                SpawnY = 376;
                break;
            
            case 180:
                SpawnX = 656;
                SpawnY = random_range(0, 360);
                break;
            
            case 270:
                SpawnX = random_range(0, 640);
                SpawnY = -16;
                break;
        }
        
        with (instance_create_depth(SpawnX, SpawnY, 0, oFreddyFrostbear_Snowflake))
        {
            Direction = other.Direction;
            OwnSpeed = SnowflakeSpeed * random_range(1, 2);
            Image = irandom(3);
        }
        
        SnowflakeFrame += 0.2;
    }
    
    if (Frame < StormDuration)
        SnowflakeFrame -= (Speed / 60);
    
    if (Frame == StormDuration)
        audio_sound_gain(sfxFrostbearWind, 0, 2000);
    
    if (Frame > StormDuration && audio_sound_get_gain(sfxFrostbearWind) == 0)
        audio_stop_sound(sfxFrostbearWind);
}

Frame++;

enum UnknownEnum
{
    Value_65 = 65
}
