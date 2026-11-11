if (!ShowWarning || global.CamUp)
    exit;

set_target_to_ui();
draw_sprite(sElectrobabWarning, 0, 320, 20);
surface_reset_target();
