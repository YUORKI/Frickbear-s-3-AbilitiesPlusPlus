event_inherited();
MaxWidth = 8;
SorterArray = get_sorter_array(countup_array(90));
Killables = [];
FadeOut = false;
OriginalX = 0;
MenuSurf = -1;
BarOffset = 0;
BarDragged = false;
Destroy = false;
PaidMode = false;

KillFunction = function(arg0)
{
    instance_destroy(get_animatronic_object(arg0));
    
    for (var a = 0; a < array_length(global.AllTimeSalvages); a++)
    {
        if (global.AllTimeSalvages[a] == arg0)
        {
            array_delete(global.AllTimeSalvages, a, 1);
            array_push(global.EndlessInventory.WhackedChars, arg0);
            break;
        }
    }
    
    play_deathcoin_voiceline(arg0);
    
    if (PaidMode)
    {
        global.RunEarnings -= (get_animatronic_data(arg0).SalvageValue / 100);
        audio_play_sound(sfxRegister, 10, false);
    }
};

function draw_everything(arg0)
{
    if (Active)
    {
        var MouseX = global.MouseX - (x + 6);
        var MouseY = global.MouseY - (y + 48);
        
        if (!surface_exists(MenuSurf))
            MenuSurf = surface_create(TilesX * 48, min(TilesY, 5) * 48);
        
        surface_set_target(MenuSurf);
        draw_clear(c_white);
        var Text = "";
        var HoveredChar = -1;
        
        for (var iy = 0; iy < TilesY; iy++)
        {
            for (var ix = 0; ix < TilesX; ix++)
            {
                var CurrentTile = ix + (iy * MaxWidth);
                
                if (CurrentTile >= array_length(Killables))
                    break;
                
                var CurrentChar = Killables[CurrentTile];
                var Selected = false;
                var BoxY = (iy * 48) - BarOffset;
                
                if ((ix * 48) <= MouseX && ((ix + 1) * 48) > MouseX && BoxY <= MouseY && (BoxY + 48) > MouseY && !FadeOut)
                {
                    Selected = true;
                    Text = global.Descriptions[CurrentChar][0];
                    HoveredChar = CurrentChar;
                    
                    if (Clicked)
                    {
                        if (PaidMode && (get_animatronic_data(CurrentChar).SalvageValue / 100) > global.RunEarnings)
                        {
                            audio_play_sound(sfxError, 10, false);
                        }
                        else
                        {
                            var CanKill = true;
                            
                            if (CurrentChar == UnknownEnum.Value_32 && instance_exists(oMrHippo))
                            {
                                if (oMrHippo.Mode == "InOffice")
                                {
                                    CanKill = false;
                                    
                                    with (oMrHippo)
                                        Funny = 1;
                                }
                            }
                            
                            if (CurrentChar == UnknownEnum.Value_120 && instance_exists(oSalvage))
                            {
                                with (oSalvage)
                                {
                                    SayDeathcoinLine = true;
                                    lose_hp(20 / HPDrainRate, true);
                                }
                                
                                CanKill = false;
                            }
                            
                            if (CurrentChar == UnknownEnum.Value_118)
                                get_trophy(UnknownEnum.Value_20);
                            
                            if (CanKill)
                                KillFunction(CurrentChar);
                            
                            audio_play_sound(sfxMetalImpact, 50, false);
                            
                            with (oCamera)
                                Itemless = 0;
                            
                            if (PaidMode)
                            {
                                Uses = 0;
                            }
                            else
                            {
                                deplete_uses();
                                Active = false;
                            }
                        }
                    }
                }
                
                draw_sprite(sTileBase, 0, 48 * ix, BoxY);
                draw_sprite(global.IconTiles[CurrentChar], !Selected, 48 * ix, BoxY);
            }
        }
        
        surface_reset_target();
        
        if (arg0)
            set_target_to_ui();
        
        draw_sprite_stretched(sDeathcoinWindow, 0, x, y, WindowWidth, WindowHeight);
        draw_set_font(global.FontW97Black);
        draw_set_halign(fa_left);
        draw_set_halign(fa_left);
        draw_text(x + 11, y + 23, (PaidMode && audio_is_playing(sfxError)) ? "Not enough cash!" : "Select an animatronic to eliminate.");
        draw_surface(MenuSurf, x + 6, y + 48);
        draw_text(x + 11, y + 79 + 22 + (WindowHeight - sprite_get_height(sDeathcoinWindow)), Text);
        
        if (HoveredChar != -1)
        {
            draw_set_halign(fa_right);
            draw_set_font(global.FontW97White);
            var Price = get_animatronic_data(HoveredChar).SalvageValue / 100;
            var PriceString = "$" + string_format(Price, 1, 2);
            var TextColor = (global.RunEarnings >= Price) ? 0 : 255;
            
            if (PaidMode)
                draw_text_color((x + WindowWidth) - 9, y + 79 + 22 + (WindowHeight - sprite_get_height(sDeathcoinWindow)), PriceString, TextColor, TextColor, TextColor, TextColor, 1);
            
            draw_set_halign(fa_left);
            draw_set_font(global.FontW97Black);
        }
        
        var ScrollBar = scroll_bar(BarOffset, BarDragged, x + 6, y + 48, surface_get_width(MenuSurf), surface_get_height(MenuSurf), TilesY * 48, 48);
        BarOffset = ScrollBar[0];
        BarDragged = ScrollBar[1];
    }
    else
    {
        if (arg0)
            set_target_to_ui();
        
        if (Hovered)
        {
            shader_set(shFlash);
            
            for (var i = -45; i < 360; i += 90)
                draw_sprite(sprite_index, UnknownEnum.Value_9, x + round(lengthdir_x(1, i)), y + round(lengthdir_y(1, i)));
            
            shader_reset();
        }
        
        draw_sprite(sprite_index, UnknownEnum.Value_9, x, y);
        draw_lives();
        
        if (mouse_check_button_pressed(mb_left) && Hovered)
        {
            Killables = generate_kill_list(true);
            
            if (array_length(Killables) <= 0)
            {
                error();
            }
            else
            {
                OriginalX = x;
                y = -200;
                Active = true;
                audio_play_sound(sfxClick, 10, false);
            }
        }
    }
    
    if (arg0)
        surface_reset_target();
}

enum UnknownEnum
{
    Value_9 = 9,
    Value_20 = 20,
    Value_32 = 32,
    Value_118 = 118,
    Value_120 = 120
}
