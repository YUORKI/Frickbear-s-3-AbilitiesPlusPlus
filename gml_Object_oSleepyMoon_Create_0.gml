ID = UnknownEnum.Value_78;
SPRITE_Icon = skin_sprite(sSleepyMoon_Slider, ID, "sprite_01.png");
SPRITE_Meter = skin_sprite(sSleepyMoon_Meter, ID, "sprite_02.png");
SPRITE_Glitch = skin_sprite(sSleepyMoon_Screen, ID, get_sprite_filenames(3, 4));
SOUND_Fail = skin_sound(sfxBitExplosionAlt, ID, "sq_appear");
SOUND_Glitch = skin_sound(sfxMinigameStartup, ID, "sq_glitch");
SOUND_Laugh = skin_sound(sfxMoonLaugh, ID, "sq_laugh");
MoonMeter = array_create(20, 0);
DisabledMinigames = array_create(20, false);
CurMinigame = -1;
VisualMoonPosition = 0;

function moon_gain(arg0, arg1 = false)
{
    var AI = global.AILevels[UnknownEnum.Value_78];
    
    if (AI == 0)
        exit;
    
    var AIScaler = lerp(0.25, 1.25, AI / 20);
    var DeathScaler = 60 * (60 / lerp(8, 5, AI / 20));
    MoonMeter[CurMinigame] += arg0 * 0.02777777777777778 * (arg1 ? DeathScaler : 1) * lerp(global.NightSpeedup, 1, 0.75);
}

KersplodeFrame = 0;
SleepySurf = -1;
AnimFrame = 0;

enum UnknownEnum
{
    Value_78 = 78
}
