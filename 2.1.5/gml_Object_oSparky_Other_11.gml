draw_on_cam(CurrentCam, function()
{
    var AngleOffset = dsin(Shake) * 5;
    var EyeAlpha = 1;
    
    if (ShockTimer <= 2.25)
        EyeAlpha = (ShockTimer - 2) * 4;
    
    if (ShockTimer > 2)
    {
        draw_sprite_ext(SPRITE_Head, 1, 128 + lengthdir_x(400 * (Offset + 0.35), -120), 160 + lengthdir_y(400 * (Offset + 0.35), -120), 1, 1, -30, c_white, 1);
        draw_sprite_ext(SPRITE_Head, 0, 128 + lengthdir_x(400 * Offset, -120), 160 + lengthdir_y(400 * Offset, -120), 1, 1, -30 + AngleOffset, c_white, 1);
        draw_sprite_ext(SPRITE_Head, 2, 128 + lengthdir_x(400 * Offset, -120), 160 + lengthdir_y(400 * Offset, -120), 1, 1, -30 + AngleOffset, c_white, EyeAlpha);
    }
});
