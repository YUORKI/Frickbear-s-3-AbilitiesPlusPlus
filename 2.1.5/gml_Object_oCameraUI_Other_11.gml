draw_set_halign(fa_left);
draw_set_font(global.FontW97Black);
shader_set(TransparencyShader);

for (var i = 0; i <= 1; i++)
{
    set_target_to_cam(i);
    var FlashlightX = global.MouseX - (880 - x);
    var FlashlightY = global.MouseY - (32 - y);
    var CamFlashAlpha = global.Brightness;
    
    if (global.ColorMode == 0 && global.Brightness < 0.99)
        CamFlashAlpha *= 0.5;
    
    if (global.CamUp && guard_ability(UnknownEnum.Value_9))
        CamFlashAlpha = 1;
    
    if (global.CamUp)
        draw_sprite_ext(sFlashlight, global.Flashlight, FlashlightX, FlashlightY, oCamera.FlashlightPower, oCamera.FlashlightPower, 0, -1, CamFlashAlpha);
    
    draw_sprite_ext(sStatic, Frame, 0, 0, 1, 1, 0, c_white, FuzzDegree);
    draw_sprite_ext(sStatic, 0, 0, 0, 1, 1, 0, c_black, ZapAlpha);
    shader_reset();
    surface_reset_target();
}

enum UnknownEnum
{
    Value_9 = 9
}
