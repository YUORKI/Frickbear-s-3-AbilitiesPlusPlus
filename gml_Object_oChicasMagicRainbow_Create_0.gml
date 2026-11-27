ID = UnknownEnum.Value_52;
Frame = 999;
WaitTime = 0;

function set_wait_time(arg0)
{
    WaitTime = round(lerp(20, 10, arg0 / 20) * random_range(0.9, 1.1));
}

set_wait_time(global.AILevels[UnknownEnum.Value_52]);
PowerDrain = 1;
TimesHit = 0;
SPRITE_Rainbow = skin_sprite(sChicasMagicRainbow, ID, get_sprite_filenames(1, 3));
SPRITE_Bullet = skin_sprite(sChicasMagicRainbow_Bullets, ID, get_sprite_filenames(4, 6));
SOUND_HitOnce = skin_sound_generate_array([voc_CMR_HaHa, voc_CMR_Whoopsie, voc_CMR_EpicFail, voc_CMR_Pwned], ID, "voc_hit1");
SOUND_HitTwice = skin_sound_generate_array([voc_CMR_GitGud, voc_CMR_MousePluggedIn, voc_CMR_MoveOutOfTheWay, voc_CMR_SupposedToTouchThem], ID, "voc_hit2");
SOUND_HitThrice = skin_sound_generate_array([voc_CMR_Dumbass, voc_CMR_FunnyHowDumbYouAre, voc_CMR_Larper, voc_CMR_Loser, voc_CMR_SuckAtThis], ID, "voc_hit3");
SOUND_Fail = skin_sound(sfxBitPunish, ID, "sq_drain");
SOUND_Shoot = skin_sound(sfxMagicRainbow_Spit, ID, "sq_shoot");
SOUND_Charge = skin_sound(sfxMagicRainbow_Charge, ID, "sq_charge");
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
        sprite_index = other.SPRITE_Rainbow;
        PatternType = arg0;
        AI = arg1;
    }
}

enum UnknownEnum
{
    Value_52 = 52
}
