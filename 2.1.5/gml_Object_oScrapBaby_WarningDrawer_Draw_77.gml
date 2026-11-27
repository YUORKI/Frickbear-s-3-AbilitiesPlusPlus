if (instance_exists(oScrapBaby))
{
    set_target_to_ui();
    
    if (oScrapBaby.ShowWarning && (floor(oScrapBaby.Timer / 30) % 2) == 0)
        draw_sprite(oScrapBaby.SPRITE_Warning, 1, 220, 336);
    
    surface_reset_target();
}
