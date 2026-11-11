if (surface_exists(global.UISurface))
{
    if (eleanor_challenge_active(UnknownEnum.Value_8))
    {
        RFX_init(1, sprite_get_texture(spr_DitherPattern, 0), 100);
        RFX_set_palswap(sprite_get_texture(RFXpalettes_spr, 12));
        RFX_draw_surface(global.UISurface, 0, 0, 1, 1, 0, 16777215, 1);
    }
    else if (WetMode)
    {
        shader_set(shWavy);
        shader_set_uniform_f(WaveTimer, current_time);
        draw_surface(global.UISurface, 0, 0);
        draw_set_alpha(0.25);
        draw_rectangle_color(0, 0, 640, 360, c_teal, c_teal, c_teal, c_teal, false);
        draw_set_alpha(1);
        shader_reset();
    }
    else
    {
        draw_surface_ext(global.UISurface, rot_x(-320, -180, ScreenAngle) + 320, rot_y(-320, -180, ScreenAngle) + 180, 1, 1, ScreenAngle, c_white, 1);
    }
}

ScreenAngle += ScreenAngleSpeed;
ScreenAngleSpeed = lerp(ScreenAngleSpeed, (UpsideDown - ScreenAngle) * 0.2, 0.2);

enum UnknownEnum
{
    Value_8 = 8
}
