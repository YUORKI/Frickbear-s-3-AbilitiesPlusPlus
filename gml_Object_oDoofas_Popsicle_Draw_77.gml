set_target_to_ui();

if (PopsicleTimer > 90 || floor(PopsicleTimer / 4) % 2)
    draw_self();

surface_reset_target();
