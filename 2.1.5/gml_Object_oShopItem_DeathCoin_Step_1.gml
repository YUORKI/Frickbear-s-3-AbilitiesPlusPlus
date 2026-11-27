InInventory = !Active;
event_inherited();
Clicked = false;

if (Active)
{
    WindowWidth = sprite_get_width(sDeathcoinWindow);
    WindowHeight = sprite_get_height(sDeathcoinWindow);
    TilesX = min(array_length(Killables), MaxWidth);
    TilesY = ceil(array_length(Killables) / MaxWidth);
    WindowWidth += (max(TilesX - 5, 0) * 48);
    WindowHeight += (clamp(TilesY - 1, 0, 4) * 48);
    WindowWidth += 16;
    x = (640 - WindowWidth) / 2;
    
    if (FadeOut)
        y += ((((-360 - WindowHeight) / 2) - y) / 5);
    else
        y += ((((360 - WindowHeight) / 2) - y) / 5);
    
    if (surface_exists(MenuSurf))
    {
        if (clicked(x + 6, y + 48, surface_get_width(MenuSurf), surface_get_height(MenuSurf)))
        {
            mouse_clear(mb_left);
            Clicked = true;
        }
    }
    
    if (clicked((x + WindowWidth) - 22, y + 6, 16, 14))
    {
        audio_play_sound(sfxBump, 5, false);
        mouse_clear(mb_left);
        Active = false;
    }
}
