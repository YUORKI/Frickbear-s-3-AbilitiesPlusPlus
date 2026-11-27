SnowflakeFrame = 0.2;
PushSpeed = 0;
Direction = 270;
PushX = 0;
PushY = 0;
Frame = 999;
WaitTime = 0;

function set_wait_time(arg0)
{
    WaitTime = lerp(30, 15, arg0 / 20) * random_range(0.9, 1.1);
}

set_wait_time(global.AILevels[UnknownEnum.Value_65]);
audio_sound_gain(sfxFrostbearWind, 0, 0);

enum UnknownEnum
{
    Value_65 = 65
}
