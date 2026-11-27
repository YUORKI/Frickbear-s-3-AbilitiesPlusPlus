set_target_to_ui();
var AlreadyCleared = global.SalvagedMinigames[global.Night - 1];

if (surface_exists(global.MinigameSurface))
{
    draw_sprite(sMinigameBorder2, 0, 0, YOffset);
    var DescriptionText = "Select a game from the menu above!";
    var YourScore = global.HiScores[Minigame];
    var EnemyScore = Targets;
    
    if (timer_based_minigame(Minigame))
    {
        if (YourScore <= EnemyScore[0] && global.MinigameCleared == 0)
            clear_minigame(false);
        
        if (YourScore <= EnemyScore[1] && global.MinigameCleared == 1)
            clear_minigame(true);
    }
    else
    {
        if (YourScore >= EnemyScore[0] && global.MinigameCleared == 0)
            clear_minigame(false);
        
        if (YourScore >= EnemyScore[1] && global.MinigameCleared == 1)
            clear_minigame(true);
    }
    
    draw_set_font(global.FontW97White);
    draw_set_color(#002F33);
    draw_text_ext(40, 35 + YOffset, Description, 14, 224);
    draw_text(40, 35 + YOffset + 28 + string_height_ext(Description, 14, 224), array_contains([UnknownEnum.Value_8, UnknownEnum.Value_15, UnknownEnum.Value_14], Minigame) ? "Move your mouse away from the window and press space to quit." : "Press space to quit.");
    
    if (FlashFrames > 0)
    {
        FlashFrames--;
        
        if ((floor(FlashFrames / 4) % 2) == 0)
            draw_set_color(#346856);
    }
    
    draw_text(39, 306 + YOffset, "HIGH SCORE: " + string(timer_based_minigame(Minigame) ? format_as_timer(YourScore) : YourScore));
    EnemyScore = "SCORE TO BEAT: " + string(timer_based_minigame(Minigame) ? format_as_timer(EnemyScore[DisplayScore]) : EnemyScore[DisplayScore]);
    draw_text(161, 306 + YOffset, EnemyScore);
    draw_set_color(c_white);
    global.MinigameWindowX = 284;
    global.MinigameWindowY = 36;
    draw_surface_ext(global.MinigameSurface, 284, 324 + YOffset, global.MinigameWindowScale, -1 * global.MinigameWindowScale, 0, c_white, 1);
}

if (global.CupcakeMeter < 1)
    global.CupcakeMeter = max(global.CupcakeMeter - 0.002, 0);

surface_reset_target();
YOffset -= (YOffset / 10);

enum UnknownEnum
{
    Value_8 = 8,
    Value_14 = 14,
    Value_15
}
