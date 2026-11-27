draw_set_halign(fa_left);
shader_set(TransparencyShader);
var DrawText = Text;

if (global.MonitorSystem == Text)
    image_index = 1;

if (instance_exists(oFoxyEXE_FakerParent))
{
    var GlitchChance = 100;
    
    if (Text == "Cameras" && instance_exists(oFoxyEXE_FakeCamButton) && irandom(GlitchChance) == 6)
    {
        FakeText = choose_from_array(oFoxyEXE.ATTR_GlitchText);
        FakeTextTimer = 2;
    }
    
    if (Text == "Vents" && instance_exists(oFoxyEXE_FakeVentButton) && irandom(GlitchChance) == 6)
    {
        FakeText = choose_from_array(oFoxyEXE.ATTR_GlitchText);
        FakeTextTimer = 2;
    }
    
    if (Text == "Shop" && instance_exists(oFoxyEXE_FakeShopButton) && irandom(GlitchChance) == 6)
    {
        FakeText = choose_from_array(oFoxyEXE.ATTR_GlitchText);
        FakeTextTimer = 2;
    }
    
    if (Text == "Games" && instance_exists(oFoxyEXE_FakeMinigameButton) && irandom(GlitchChance) == 6)
    {
        FakeText = choose_from_array(oFoxyEXE.ATTR_GlitchText);
        FakeTextTimer = 2;
    }
}

if (FakeText != "")
{
    DrawText = FakeText;
    FakeTextTimer--;
}

if (FakeTextTimer == 0)
    FakeText = "";

draw_self();

if (Text != "Reset Music")
    draw_text(x + 5, y + 1, DrawText);

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
        draw_sprite(oElectrobab.SPRITE_Warning, 1, x + sprite_width, y + sprite_height);
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
