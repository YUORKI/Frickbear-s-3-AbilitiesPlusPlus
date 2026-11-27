initialize_minigame_scores();
Minigame = tonights_cabinet_game();
Description = get_minigame_data(Minigame).Desc;
Targets = get_cabinet_scores(Minigame);
DisplayScore = 0;

if (global.MinigameCleared > 0)
    DisplayScore = 1;

function clear_minigame(arg0)
{
    if (!arg0)
        global.MinigameCleared = max(global.MinigameCleared, 1);
    else
        global.MinigameCleared = max(global.MinigameCleared, 2);
    
    instance_destroy(oTextBox);
    
    with (instance_create_depth(0, 0, 0, oTextBox))
        game_text("Arcade_Clear");
    
    if (!audio_is_playing(sfxChildrenCheering))
        bitcrush_sound(sfxChildrenCheering, 0, 0, false, 1, 8);
    
    FlashFrames = 120;
}

YOffset = 360;
FlashFrames = 0;
