if (!ShowWarning || global.CamUp)
    exit;

set_target_to_ui();
draw_sprite(SPRITE_Warning, 0, 320, 20);
surface_reset_target();
