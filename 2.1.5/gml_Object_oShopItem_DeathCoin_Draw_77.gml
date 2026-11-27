if (Active)
{
    var MouseX = global.MouseX - (x + 6);
    var MouseY = global.MouseY - (y + 48);
    
    if (!surface_exists(MenuSurf))
        MenuSurf = surface_create(TilesX * 48, min(TilesY, 5) * 48);
    
    surface_set_target(MenuSurf);
    draw_clear(c_white);
    var Text = "";
    
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
                
                if (Clicked)
                {
                    FadeOut = true;
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
                    
                    Destroy = true;
                    x = TargetX;
                }
            }
            
            draw_sprite(sTileBase, 0, 48 * ix, BoxY);
            draw_sprite(global.IconTiles[CurrentChar], !Selected, 48 * ix, BoxY);
        }
    }
    
    surface_reset_target();
    set_target_to_ui();
    draw_sprite_stretched(sDeathcoinWindow, 0, x, y, WindowWidth, WindowHeight);
    draw_set_font(global.FontW97Black);
    draw_set_halign(fa_left);
    draw_set_halign(fa_left);
    draw_text(x + 11, y + 23, "Select an animatronic to eliminate.");
    draw_surface(MenuSurf, x + 6, y + 48);
    draw_text(x + 11, y + 79 + 22 + (WindowHeight - sprite_get_height(sDeathcoinWindow)), Text);
    var ScrollBar = scroll_bar(BarOffset, BarDragged, x + 6, y + 48, surface_get_width(MenuSurf), surface_get_height(MenuSurf), TilesY * 48, 48);
    BarOffset = ScrollBar[0];
    BarDragged = ScrollBar[1];
}
else
{
    set_target_to_ui();
    
    if (Hovered)
    {
        shader_set(shFlash);
        
        for (var i = -45; i < 360; i += 90)
            draw_sprite(sprite_index, 2, x + round(lengthdir_x(1, i)), y + round(lengthdir_y(1, i)));
        
        if (mouse_check_button_pressed(mb_left))
        {
            Killables = generate_kill_list(false, true);
            
            if (global.AILevels[UnknownEnum.Value_118] > 0)
                array_push(Killables, UnknownEnum.Value_118);
            
            if (array_length(Killables) == 0)
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
        
        shader_reset();
    }
    
    draw_sprite(sprite_index, 2, x, y);
}

surface_reset_target();

if (Destroy)
    instance_destroy();

enum UnknownEnum
{
    Value_20 = 20,
    Value_32 = 32,
    Value_118 = 118,
    Value_120 = 120
}
