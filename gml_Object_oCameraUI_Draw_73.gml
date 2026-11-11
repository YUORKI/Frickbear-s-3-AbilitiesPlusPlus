shader_set(TransparencyShader);
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
var BoxWidth, BoxHeight, EntryHeight;

switch (global.MonitorSystem)
{
    case "Cameras":
        repeat (5)
            draw_surface(global.CamSurface, 880, 32);
        
        image_index = 0;
        break;
    
    case "Vents":
        image_index = 1;
        break;
    
    case "Shop":
        image_index = 2;
        break;
    
    case "Games":
        image_index = 3;
        
        if (surface_exists(global.MinigameSurface))
        {
            draw_rectangle(x + 312, y + 36, 400, 400, false);
            shader_set(shRecolor);
            var Pal = oWall.Data.MinigamePalette;
            replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
            draw_surface_ext(global.MinigameSurface, x + 314, y + 38, global.MinigameWindowScale, global.MinigameWindowScale, 0, c_white, 1);
            shader_set(TransparencyShader);
        }
        
        BoxWidth = 282;
        BoxHeight = 144;
        draw_set_font(global.FontW97White);
        draw_rectangle_color(x + 6, y + 50, x + 6 + BoxWidth, y + 50 + BoxHeight, c_white, c_white, c_white, c_white, false);
        EntryHeight = 16;
        
        for (var i = 0; i < array_length(AvailableMinigames); i++)
        {
            var Disabled = DisabledMinigames[i];
            var ButtonX = x + 6;
            var ButtonY = (y + 50 + (EntryHeight * i)) - MinigameScrollOffset;
            var Data = get_minigame_data(AvailableMinigames[i]);
            var TexColor = Disabled ? 12632256 : 0;
            
            if (instance_exists(Data.Object))
            {
                draw_rectangle_color(ButtonX, ButtonY, ButtonX + BoxWidth, ButtonY + EntryHeight, c_black, c_black, c_black, c_black, false);
                TexColor = 16777215;
            }
            else if (clicked(ButtonX - x, ButtonY - y, BoxWidth, EntryHeight) && mouse_in_zone(6, 50, BoxWidth, BoxHeight))
            {
                if (Disabled)
                {
                    audio_play_sound(sfxError, 10, false);
                }
                else
                {
                    audio_play_sound(sfxCamSwitch, 10, false);
                    instance_destroy(oMinigameParent);
                    SelectedMinigame = AvailableMinigames[i];
                    instance_create_layer(-256, -256, "CameraView", Data.Object);
                    
                    with (oSleepyMoon)
                        CurMinigame = i;
                }
            }
            
            draw_sprite(sCamRadarIcons, get_minigame_icon(AvailableMinigames[i]), ButtonX + 1, ButtonY);
            draw_text_color(ButtonX + 21, ButtonY - 1, Data.Name, TexColor, TexColor, TexColor, TexColor, 1);
            
            if (instance_exists(oEleanor_ScoreTracker) && AvailableMinigames[i] == oEleanor_ScoreTracker.ChosenMinigame)
                draw_sprite(sCamRadarIcons, UnknownEnum.Value_34, (ButtonX + BoxWidth) - 17, ButtonY + 1);
        }
        
        draw_set_font(global.FontW97Black);
        break;
}

draw_self();

switch (global.MonitorSystem)
{
    case "Cameras":
        draw_text(x + 92, y + 25, global.CamName[global.Cam]);
        break;
    
    case "Vents":
        draw_text(x + 92, y + 25, global.CamName[global.Cam]);
        
        if (global.Tools.AudioLure[0] > 0 && floor(global.Tools.AudioLure[0] / 15) % 2)
        {
            draw_set_font(global.FontW97White);
            draw_text_color(x + 9, y + 25 + 260, "! - AUDIO LURE OFFLINE", c_red, c_red, c_red, c_red, 1);
            draw_set_font(global.FontW97Black);
        }
        
        if (global.Tools.AudioLure[1] > 0 && floor(global.Tools.AudioLure[1] / 15) % 2)
        {
            draw_set_font(global.FontW97White);
            draw_text_color(x + 9, y + 10 + 260, "! - AUDIO LURE OFFLINE", #6463D6, #6463D6, #6463D6, #6463D6, 1);
            draw_set_font(global.FontW97Black);
        }
        
        break;
    
    case "Shop":
        draw_text(x + 92, y + 25, "Spend your tokens for items here.");
        break;
    
    case "Games":
        draw_text(x + 92, y + 25, "Play minigames to earn tokens.");
        break;
}

if (global.MonitorSystem == "Shop")
{
    if (kill_mendo())
    {
        draw_sprite(sMendoOffline, floor(ShopkeepFrame / 30) % 2, x + 301, y + 28);
    }
    else if (character_active(UnknownEnum.Value_25))
    {
        if (ShopkeepAnim == 1 && ShopkeepFrame == 0)
            audio_play_sound(choose_from_array(oLolbit.SOUND_Purchase), 10, false);
        
        if (ShopkeepAnim == 1 && ShopkeepFrame >= 15)
        {
            ShopkeepAnim = 2;
            ShopkeepFrame = 0;
        }
        
        if (ShopkeepAnim == 2 && ShopkeepFrame >= 60)
        {
            ShopkeepAnim = 3;
            ShopkeepFrame = 0;
        }
        
        if (ShopkeepAnim == 3 && ShopkeepFrame >= 15)
        {
            ShopkeepAnim = 0;
            ShopkeepFrame = 0;
        }
        
        var LolbitFrame = floor(ShopkeepFrame / 5) % 3;
        draw_sprite(oLolbit.SPRITE_Shop, LolbitFrame + (ShopkeepAnim * 3), x + 301, y + 28);
    }
}

if (global.MonitorSystem == "Games")
{
    var DescriptionText = "Select a game from the menu above!";
    var YourScore = "-";
    var EnemyScore = "-";
    var ToyFreddyExists = character_active(UnknownEnum.Value_6);
    
    if (ToyFreddyExists)
    {
        if (!oToyFreddy.Active)
            ToyFreddyExists = false;
    }
    
    if (instance_exists(oMinigameParent) && SelectedMinigame > -1)
    {
        DescriptionText = get_minigame_data(SelectedMinigame).Desc;
        YourScore = global.HiScores[SelectedMinigame];
        
        if (timer_based_minigame(SelectedMinigame))
            YourScore = format_as_timer(YourScore);
        
        if (instance_exists(oEleanor_ScoreTracker) && SelectedMinigame == oEleanor_ScoreTracker.ChosenMinigame)
        {
            EnemyScore = oEleanor_ScoreTracker.TFScores[SelectedMinigame];
            
            if (timer_based_minigame(SelectedMinigame))
                EnemyScore = format_as_timer(EnemyScore);
        }
        
        if (ToyFreddyExists)
        {
            EnemyScore = oToyFreddy.TFScores[SelectedMinigame];
            
            if (timer_based_minigame(SelectedMinigame))
                EnemyScore = format_as_timer(EnemyScore);
        }
    }
    
    draw_text_ext(9 + x, 198 + y, DescriptionText, 14, 294);
    draw_text(9 + x, 283 + y, "HIGH SCORE: " + string(YourScore));
    
    if (EnemyScore != "-")
        EnemyScore = "SCORE TO BEAT: " + string(EnemyScore);
    
    draw_text(161 + x, 283 + y, EnemyScore);
    
    if (!instance_exists(oMinigameParent) || !surface_exists(global.MinigameSurface))
        draw_sprite_ext(sEmilySoftScreen, 0, x + 314, y + 38, 2, 2, 0, c_white, 1);
    
    var ScrollBar = scroll_bar(MinigameScrollOffset, MinigameScrollDragged, x + 6, y + 50, BoxWidth, BoxHeight, array_length(AvailableMinigames) * EntryHeight, EntryHeight, x, y);
    MinigameScrollOffset = ScrollBar[0];
    MinigameScrollDragged = ScrollBar[1];
}

Frame += 0.25;
ShopkeepFrame += 1;
FuzzDegree = max(FuzzDegree - 0.05, 0.15);
shader_reset();

enum UnknownEnum
{
    Value_6 = 6,
    Value_25 = 25,
    Value_34 = 34
}
