function moon_passive_gain(arg0 = 1)
{
    with (oSleepyMoon)
        moon_gain(arg0);
}

function moon_death_gain(arg0 = 1)
{
    with (oSleepyMoon)
        moon_gain(arg0, true);
    
    if (instance_exists(oCarnieMinigame) && arg0 >= 1)
    {
        with (oCarnieMinigame)
            minigame_failed();
        
        CarnieDeath = true;
    }
}

CarnieDeath = false;

function carnie_check()
{
    if (CarnieDeath)
    {
        with (oCarnieMinigame)
            minigame_fail_aftermath();
    }
}

if (surface_exists(global.MinigameSurface))
    surface_free(global.MinigameSurface);

global.MinigameWindowScale = 2;
