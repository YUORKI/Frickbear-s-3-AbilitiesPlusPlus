draw_set_halign(fa_left);
shader_set(TransparencyShader);

if (global.MonitorSystem == Text)
    image_index = 1;

draw_self();

if (Text != "Reset Music")
    draw_text(x + 5, y + 1, Text);

if (character_active(UnknownEnum.Value_16))
{
    if (Text == "Reset Music" && global.Cam == 6)
    {
        draw_text(x + 5, y + 1, oMarionette.ButtonText);
        
        if (oMarionette.ShowWarning)
            draw_sprite(oMarionette.SPRITE_Warning, 1, x + sprite_width, y + sprite_height);
        
        draw_pie(x + 104, y + 11, ceil(oMarionette.MusicTimer), oMarionette.MusicMax, 8421504, 8, 1);
    }
    
    if (Text == "Cameras" && global.MonitorSystem != "Cameras" && oMarionette.ShowWarning)
        draw_sprite(oMarionette.SPRITE_Warning, 1, x + sprite_width, y + sprite_height);
}

if (character_active(UnknownEnum.Value_56))
{
    if ((oElectrobab.ShowWarning && Text == "Repair Wiring") || (Text == "Cameras" && global.MonitorSystem != "Cameras" && oElectrobab.ShowWarning))
        draw_sprite(sElectrobabWarning, 1, x + sprite_width, y + sprite_height);
}

if (instance_exists(oSalvage_VentCrawler) && instance_exists(oSalvage))
{
    if (Text == "Vents" && global.MonitorSystem != "Vents" && !(floor(oSalvage.VentWarningTimer / 15) % 2))
        draw_sprite(sMarionetteWarning, 1, -10 + x + sprite_width, -11 + y + sprite_height);
}

shader_reset();

enum UnknownEnum
{
    Value_16 = 16,
    Value_56 = 56
}
