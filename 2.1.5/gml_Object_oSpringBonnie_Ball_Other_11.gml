draw_on_cam(Camera, function()
{
    shader_set(TransparencyShaderAlpha);
    shader_set_uniform_f(shader_get_uniform(TransparencyShaderAlpha, "Alpha_Value"), lerp(1, 0, Dissipation));
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
    shader_reset();
});
