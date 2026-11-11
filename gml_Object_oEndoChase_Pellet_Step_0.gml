image_index = IsPowerPellet;

if (!instance_exists(oEndoChase_Player))
    instance_destroy();

if (point_distance(x, y, oEndoChase_Player.x, oEndoChase_Player.y) < 4)
{
    if (IsPowerPellet)
    {
        with (oMinigame_EndoChase)
        {
            power_pellet();
            earn_points(50);
        }
        
        audio_play_sound(sfxBitBoost, 5, false);
    }
    else
    {
        with (oMinigame_EndoChase)
            earn_points(10);
        
        audio_play_sound(sfxBump, 5, false);
    }
    
    if ((instance_number(oEndoChase_Pellet) - 1) == 0)
    {
        audio_play_sound(sfxBitBoost, 5, false);
        
        with (oMinigame_EndoChase)
        {
            earn_points(1500);
            
            if (ScoreThisRound >= 1000)
                get_trophy(UnknownEnum.Value_59);
        }
        
        oMinigame_EndoChase.Won = true;
        oMinigame_EndoChase.FreezeFrames = 120;
        oEndoChase_Player.DeathFrames = 120;
    }
    
    if ((instance_number(oEndoChase_Pellet) - 1) == 50)
    {
        with (oMinigame_EndoChase)
            instance_create_depth(BonusFruitSpawnX, BonusFruitSpawnY, depth - 1, oEndoChase_BonusCupcake);
        
        audio_play_sound(sfxBitThud, 10, false);
    }
    
    with (oEndoChase_Player)
        SimulationSpeed += PelletBoost;
    
    oMinigame_EndoChase.ScatterDuration = max(oMinigame_EndoChase.ScatterDuration - 1.5, 0);
    instance_destroy();
}

enum UnknownEnum
{
    Value_59 = 59
}
