if (global.MonitorSystem != "Cameras")
    exit;

shader_set(TransparencyShader);
draw_sprite_ext(sMXES_Glitch, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
shader_reset();
