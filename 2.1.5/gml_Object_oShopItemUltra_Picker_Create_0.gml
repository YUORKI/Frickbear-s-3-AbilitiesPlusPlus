event_inherited();
MaxWidth = 8;
SorterArray = get_sorter_array(countup_array(86));

function generate_selection_list()
{
    Killables = [];
    
    for (var i = 0; i < 86; i++)
    {
        if (!array_contains(global.AllTimeSalvages, i) && global.UnlockedAnimatronics[i])
            array_push(Killables, i);
    }
}

FadeOut = false;
OriginalX = 0;
MenuSurf = -1;
BarOffset = 0;
BarDragged = false;
Destroy = false;

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
                        with (oEndless_AnimatronicPicker)
                        {
                            array_push(UltraPickerChar, CurrentChar);
                            pick_choices();
                        }
                        
                        play_selection_voiceline(CurrentChar);
                        earn_money(get_animatronic_data(CurrentChar).SalvageValue / 100);
                        audio_play_sound(sfxRegister, 10, false);
                        audio_play_sound(sfxSparkleImpact, 50, false);
                        deplete_uses();
                        Active = false;
                    }
                }
                
                draw_sprite(sTileBase, 0, 48 * ix, BoxY);
                draw_sprite(global.IconTiles[CurrentChar], !Selected, 48 * ix, BoxY);
            }
        }
        
        surface_reset_target();
        
        if (arg0)
            set_target_to_ui();
        
        draw_sprite_stretched(sDeathcoinWindow, 1, x, y, WindowWidth, WindowHeight);
        draw_set_font(global.FontW97Black);
        draw_set_halign(fa_left);
        draw_set_halign(fa_left);
        draw_text(x + 11, y + 23, "Select an animatronic.");
        draw_surface(MenuSurf, x + 6, y + 48);
        draw_text(x + 11, y + 79 + 22 + (WindowHeight - sprite_get_height(sDeathcoinWindow)), Text);
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
                draw_sprite(sprite_index, UnknownEnum.Value_8, x + round(lengthdir_x(1, i)), y + round(lengthdir_y(1, i)));
            
            if (mouse_check_button_pressed(mb_left))
            {
                generate_selection_list();
                
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
        
        draw_sprite(sprite_index, UnknownEnum.Value_8, x, y);
        draw_lives();
    }
    
    if (arg0)
        surface_reset_target();
}

enum UnknownEnum
{
    Value_8 = 8
}
