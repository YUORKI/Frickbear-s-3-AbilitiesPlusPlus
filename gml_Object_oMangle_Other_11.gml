draw_on_cam(CurrentCam, function()
{
    draw_sprite(SPRITE_Cameras, 0, 0, 0);
    draw_set_alpha(random_range(1.5, 0));
    draw_rectangle_color(0, 0, 400, 300, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
});
