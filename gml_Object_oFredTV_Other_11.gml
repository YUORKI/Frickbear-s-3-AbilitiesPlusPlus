if (!surface_exists(TVSurf))
    TVSurf = surface_create(128, 128);

surface_set_target(TVSurf);
draw_clear_alpha(c_black, 0);

if (Frame >= 180)
    Frame = 0;

var TVImage = (floor(Frame / 15) % 2) + (CurrentAnimation * 2);

if (surface_exists(global.CamSurface))
{
    shader_set(shFullAlpha);
    
    if (global.CamUp)
    {
        draw_sprite(SPRITE_Off, 0, 0, 0);
    }
    else
    {
        draw_surface_ext((x > 320) ? global.CamSurface : global.CamSurfaceAlt, 10, 12, 0.27, 0.28, 0, c_white, 1);
        shader_reset();
        draw_sprite(SPRITE_On, 0, 0, 0);
    }
}

Frame++;
surface_reset_target();
