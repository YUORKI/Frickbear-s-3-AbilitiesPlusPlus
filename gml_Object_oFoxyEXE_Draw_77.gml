if (!surface_exists(StaticSurf))
    StaticSurf = surface_create(640, 360);

surface_set_target(StaticSurf);
draw_clear_alpha(c_black, 0);
shader_set(TransparencyShader);
draw_sprite_ext(sBurningVignette, 0, 320, 180, lerp(2, 1, Aggro), lerp(2, 1, Aggro), 0, c_white, 1);
gpu_set_colorwriteenable(1, 1, 1, 0);
draw_sprite_ext(sStatic, StaticTimer, 0, 0, 2, 1, 0, c_red, 1);
gpu_set_colorwriteenable(1, 1, 1, 1);
surface_reset_target();
set_target_to_ui();
draw_surface_ext(StaticSurf, 0, 0, 1, 1, 0, c_white, lerp(0, 1, Aggro));

if (ScareTimer > 0)
{
    var Alpha = random_range(lerp(0, 1, ScareTimer), lerp(0.1, 2, ScareTimer));
    
    if (ScareTimer == 1)
        Alpha = 1;
    
    draw_sprite_ext(SPRITE_Screen, 0, 320, 180, 1, 1, 0, c_white, Alpha);
    ScareTimer -= 0.016666666666666666;
}

surface_reset_target();
shader_reset();
