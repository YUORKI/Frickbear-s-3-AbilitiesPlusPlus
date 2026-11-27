if (global.MonitorSystem != "Cameras")
    exit;

var GlitchFrame = floor(AnimFrame / 10) % 4;
shader_set(TransparencyShader);
draw_sprite_ext(SPRITE_Glitch, GlitchFrame, x, y, image_xscale, image_yscale, 0, c_white, 1);
shader_reset();
