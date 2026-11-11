if (instance_exists(oMarionette))
{
    set_target_to_ui();
    
    if (oMarionette.ShowWarning)
        draw_sprite(oMarionette.SPRITE_Warning, 0, 320, 340);
    
    surface_reset_target();
}
