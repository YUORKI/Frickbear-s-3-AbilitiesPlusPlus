ID = UnknownEnum.Value_52;
Frame = 999;
WaitTime = 0;

function set_wait_time(arg0)
{
    WaitTime = round(lerp(20, 10, arg0 / 20) * random_range(0.9, 1.1));
}

set_wait_time(global.AILevels[UnknownEnum.Value_52]);
sprite_index = sChicasMagicRainbow;
PowerDrain = 1;
TimesHit = 0;
SPRITE_Rainbow = sChicasMagicRainbow;
SPRITE_Bullet = sChicasMagicRainbow_Bullets;
SOUND_HitOnce = [voc_CMR_HaHa, voc_CMR_Whoopsie, voc_CMR_EpicFail, voc_CMR_Pwned];
SOUND_HitTwice = [voc_CMR_GitGud, voc_CMR_MousePluggedIn, voc_CMR_MoveOutOfTheWay, voc_CMR_SupposedToTouchThem];
SOUND_HitThrice = [voc_CMR_Dumbass, voc_CMR_FunnyHowDumbYouAre, voc_CMR_Larper, voc_CMR_Loser, voc_CMR_SuckAtThis];
SOUND_HitThrice = array_shuffle(SOUND_HitThrice);
PatternType = 6;

function spawn_shooter(arg0, arg1, arg2 = -1, arg3 = -1)
{
    if (arg2 == -1)
        arg2 = irandom_range(96, 544);
    
    if (arg3 == -1)
        arg3 = irandom_range(96, 264);
    
    with (instance_create_depth(arg2, arg3, depth, oChicasMagicRainbow_Shooter))
    {
        PatternType = arg0;
        AI = arg1;
    }
}

enum UnknownEnum
{
    Value_52 = 52
}
