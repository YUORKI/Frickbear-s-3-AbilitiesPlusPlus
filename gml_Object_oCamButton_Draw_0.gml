draw_set_halign(fa_left);
shader_set(TransparencyShader);

if (global.Cam == CamNumber)
    image_index = 1;
else
    image_index = 0;

if (MXESInfected)
    draw_outline(16777215, sprite_index, image_index, x + random_range(-0.5, 0.5), y + random_range(-0.5, 0.5), random_range(1, 3));

draw_self();
draw_text(x + 5, y + 1, "CAM " + string(CamNumber));

if (character_active(UnknownEnum.Value_16))
{
    if (CamNumber == UnknownEnum.Value_6 && oMarionette.ShowWarning && global.Cam != CamNumber)
        draw_sprite(oMarionette.SPRITE_Warning, 1, x + sprite_width, y + sprite_height);
}

if (character_active(UnknownEnum.Value_56))
{
    if (CamNumber == oElectrobab.TargetCam && global.Cam != CamNumber && oElectrobab.ShowWarning)
        draw_sprite(oElectrobab.SPRITE_Warning, 1, x + sprite_width, y + sprite_height);
}

if (instance_exists(oSalvage))
{
    if (array_contains(oSalvage.BreakerWarnings, CamNumber) && floor(oSalvage.VentWarningTimer / 15) % 2)
        draw_sprite(sMarionetteWarning, 1, x + sprite_width, y);
}

if (instance_exists(oFredbearAttack_PowerOut) && oFredbearAttack_PowerOut.PhonyMode)
{
    if (array_contains(oFredbearAttack_PowerOut.AffectedCams, CamNumber) && floor(oFredbearAttack_PowerOut.VentWarningTimer / 15) % 2)
        draw_sprite(sMarionetteWarning, 1, x + sprite_width, y);
}

CharsOnCam = [];
CharsOnCamSubtypes = [];

if (RadarMode > 0)
{
    if (character_active(UnknownEnum.Value_0))
    {
        if (oFreddy.Stage == "ShowStage")
            radar_draw(oFreddy.SPRITE_CamRadar, UnknownEnum.Value_1);
        
        if (oFreddy.Stage == "DiningArea")
            radar_draw(oFreddy.SPRITE_CamRadar, UnknownEnum.Value_2);
        
        if ((oFreddy.Stage == "Hallway" || oFreddy.Stage == "Doorway" || oFreddy.Stage == "Blocked") && oFreddy.Side == -1)
            radar_draw(oFreddy.SPRITE_CamRadar, UnknownEnum.Value_4);
        
        if ((oFreddy.Stage == "Hallway" || oFreddy.Stage == "Doorway" || oFreddy.Stage == "Blocked") && oFreddy.Side == 1)
            radar_draw(oFreddy.SPRITE_CamRadar, UnknownEnum.Value_5);
    }
    
    if (character_active(UnknownEnum.Value_1))
    {
        if (oBonnie.Stage == "ShowStage")
            radar_draw(oBonnie.SPRITE_CamRadar, UnknownEnum.Value_1);
        
        if (oBonnie.Stage == "DiningArea")
            radar_draw(oBonnie.SPRITE_CamRadar, UnknownEnum.Value_2);
        
        if (oBonnie.Stage == "Hallway")
            radar_draw(oBonnie.SPRITE_CamRadar, UnknownEnum.Value_4);
    }
    
    if (character_active(UnknownEnum.Value_2))
    {
        if (oChica.Stage == "ShowStage")
            radar_draw(oChica.SPRITE_CamRadar, UnknownEnum.Value_1);
        
        if (oChica.Stage == "DiningArea")
            radar_draw(oChica.SPRITE_CamRadar, UnknownEnum.Value_2);
        
        if (oChica.Stage == "Hallway")
            radar_draw(oChica.SPRITE_CamRadar, UnknownEnum.Value_5);
    }
    
    if (character_active(UnknownEnum.Value_3))
    {
        if (oFoxy.Mode == "Wait")
            radar_draw(oFoxy.SPRITE_CamRadar, UnknownEnum.Value_3);
    }
    
    if (character_active(UnknownEnum.Value_9))
        radar_draw(oMangle.SPRITE_CamRadar, oMangle.CurrentCam);
    
    if (character_active(UnknownEnum.Value_19))
    {
        for (var p = 1; p < array_length(oPhantoms.CurrentCams); p++)
        {
            if (oPhantoms.CurrentCams[p] != 0 && oPhantoms.CurrentCams[p] <= oPhantoms.AmountOfPhantoms)
                radar_draw(oPhantoms.SPRITE_CamRadar, p, oPhantoms.CurrentCams[p] - 1);
        }
    }
    
    if (character_active(UnknownEnum.Value_20))
    {
        if (oSpringtrap.Stage == 0)
            radar_draw(oSpringtrap.SPRITE_CamRadar, UnknownEnum.Value_8);
        
        if (oSpringtrap.Stage == 1)
            radar_draw(oSpringtrap.SPRITE_CamRadar, UnknownEnum.Value_1);
        
        if (oSpringtrap.Stage == 2)
            radar_draw(oSpringtrap.SPRITE_CamRadar, UnknownEnum.Value_2);
        
        if (oSpringtrap.Stage == 3 || oSpringtrap.Stage == 4)
            radar_draw(oSpringtrap.SPRITE_CamRadar, UnknownEnum.Value_4);
    }
    
    if (character_active(UnknownEnum.Value_23))
    {
        if (oNightmareBB.HitsLeft > 0)
            radar_draw(oNightmareBB.SPRITE_CamRadar, oNightmareBB.Camera);
    }
    
    if (character_active(UnknownEnum.Value_26))
    {
        if (oBaby.BidybabsLeft > 0)
            radar_draw(oBaby.SPRITE_CamRadar, UnknownEnum.Value_7, 0);
        
        for (var p = 0; p < instance_number(oBidybab); p++)
            radar_draw(oBaby.SPRITE_CamRadar, instance_find(oBidybab, p).Camera, 1);
    }
    
    if (character_active(UnknownEnum.Value_27))
    {
        if (oFuntimeFreddy.Mode != "Waiting")
        {
            radar_draw(oFuntimeFreddy.SPRITE_CamRadar, UnknownEnum.Value_4 + sign_to_binary(oFuntimeFreddy.Side), 0);
            radar_draw(oFuntimeFreddy.SPRITE_CamRadar, UnknownEnum.Value_4 + sign_to_binary(oFuntimeFreddy.ActualSide), 1);
        }
    }
    
    if (character_active(UnknownEnum.Value_29))
    {
        for (var p = 0; p < array_length(oBallora.SliceLocations); p++)
        {
            if (oBallora.SliceLocations[p])
                radar_draw(oBallora.SPRITE_CamRadar, p);
        }
    }
    
    if (character_active(UnknownEnum.Value_35))
    {
        if (oScrapBaby.Active)
            radar_draw(oScrapBaby.SPRITE_CamRadar, UnknownEnum.Value_8);
    }
    
    if (character_active(UnknownEnum.Value_43))
    {
        if (oSparky.Active)
            radar_draw(oSparky.SPRITE_CamRadar, oSparky.CurrentCam);
    }
    
    if (character_active(UnknownEnum.Value_45))
        radar_draw(oPopgoes.SPRITE_CamRadar, oPopgoes.CurrentCam);
    
    if (character_active(UnknownEnum.Value_84))
        radar_draw(oReagent.SPRITE_CamRadar, oReagent.InHallway ? (UnknownEnum.Value_4 + sign_to_binary(oReagent.Side)) : UnknownEnum.Value_2);
    
    if (character_active(UnknownEnum.Value_88))
        radar_draw(oRalph.SPRITE_CamRadar, oRalph.CurrentCam);
    
    if (instance_exists(oSalvage))
        radar_draw(sCamRadarIcon_Salvage, oSalvage.CurrentCam);
}

var MimicIcons = [];

if (character_active(UnknownEnum.Value_73) && global.AILevels[UnknownEnum.Value_73] > 0)
{
    for (var i = 0; i < instance_number(oMimicSuit); i++)
    {
        var Suit = instance_find(oMimicSuit, i);
        
        if (CamNumber == Suit.Camera)
            array_push(MimicIcons, Suit.Identity);
    }
}

var a = array_length(CharsOnCam) - 1;

while (a >= 0)
{
    var Sep = 8;
    
    if (array_length(CharsOnCam) > 4)
        Sep = 4;
    
    draw_sprite(CharsOnCam[a], CharsOnCamSubtypes[a], x + 3 + (Sep * a), y + 3);
    a--;
}

a = array_length(MimicIcons) - 1;

while (a >= 0)
{
    var Sep = 8;
    
    if (array_length(MimicIcons) > 4)
        Sep = 4;
    
    draw_sprite(oMimic.SPRITE_CamRadar, MimicIcons[a], x + 3 + (Sep * a), y + 3 + 8);
    a--;
}

shader_reset();

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_16 = 16,
    Value_19 = 19,
    Value_20,
    Value_23 = 23,
    Value_26 = 26,
    Value_27,
    Value_29 = 29,
    Value_35 = 35,
    Value_43 = 43,
    Value_45 = 45,
    Value_56 = 56,
    Value_73 = 73,
    Value_84 = 84,
    Value_88 = 88
}
