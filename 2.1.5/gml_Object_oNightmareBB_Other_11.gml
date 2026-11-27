draw_on_cam(Camera, function()
{
    var Direction = -30;
    var XOffset = random_range(-1 * Shakiness, Shakiness) + lengthdir_x(Height, Direction + 90);
    var YOffset = random_range(-1 * Shakiness, Shakiness) + lengthdir_y(Height, Direction + 90);
    var JawHeight = (Height + (Shakiness * -12)) - 48;
    var JawXOffset = XOffset + lengthdir_x(JawHeight, Direction + 90);
    var JawYOffset = YOffset + lengthdir_y(JawHeight, Direction + 90);
    var ShakeOffset = random_range(-1 * Shakiness, Shakiness);
    var Size = 1 - (Shakiness * 0.01);
    var EyeSize = 1 - (clamp(Shakiness, 0, 10) / 20);
    draw_sprite_ext(SPRITE_Head, 1, 200 + JawXOffset, 150 + JawYOffset, Size, Size, Direction + ShakeOffset, c_white, 1);
    draw_sprite_ext(SPRITE_Head, 0, 200 + XOffset, 150 + YOffset, Size, Size, Direction + ShakeOffset, c_white, 1);
    var EyeXOffset = XOffset + lengthdir_x(64 + Shakiness, Direction);
    var EyeYOffset = YOffset + lengthdir_y(64 + Shakiness, Direction);
    draw_sprite_ext(SPRITE_Eyes, EyeSize < 0.9, 200 + EyeXOffset, 150 + EyeYOffset, EyeSize, EyeSize, Direction + ShakeOffset, c_white, 1);
    EyeXOffset = XOffset + lengthdir_x(-64 - Shakiness, Direction);
    EyeYOffset = YOffset + lengthdir_y(-64 - Shakiness, Direction);
    draw_sprite_ext(SPRITE_Eyes, 0, 200 + EyeXOffset, 150 + EyeYOffset, EyeSize, EyeSize, Direction + ShakeOffset, c_white, 1);
});
