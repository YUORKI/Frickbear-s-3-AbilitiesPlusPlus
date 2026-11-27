draw_on_cam(Camera, function()
{
    shader_set(TransparencyShader);
    draw_sprite(sprite_index, image_index, 0, 0);
    shader_reset();
});
