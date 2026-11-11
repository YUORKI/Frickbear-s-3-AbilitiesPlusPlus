if (ShockTimer > 2 || Active)
{
    draw_on_cam(CurrentCam, function()
    {
        shader_set(TransparencyShader);
        draw_sprite(PhonyMode ? sPhonyBoss_Cameras : sFredbearOnCams, global.Timer * 15, 0, 0);
        shader_reset();
        global.Brightness = global.BaseBrightness;
    });
}
