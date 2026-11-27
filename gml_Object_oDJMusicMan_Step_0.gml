var AI = global.AILevels[ID];

if (!Active)
{
    var TimeToAttack = 1;
    
    if (global.Timer >= ActivationTime && AI > 0)
    {
        if (doorway_available(-1))
        {
            Occupied[0] = true;
            occupy_doorway(ID, -1);
        }
        
        if (window_available())
        {
            Occupied[1] = true;
            global.WindowOccupant = ID;
        }
        
        if (doorway_available(1))
        {
            Occupied[2] = true;
            occupy_doorway(ID, 1);
        }
        
        show_debug_message(Occupied);
        
        if (!array_contains(Occupied, false))
        {
            simple_sound(SOUND_Creak, 0, 0, false, 2, 10, 0.75);
            Active = true;
            HandL = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
            HandR = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
            HandAnimStage = "Lower";
            Frame = 0;
        }
    }
}
else if (HandL != -1 && HandR != -1)
{
    if (HandAnimStage == "Lower" || HandAnimStage == "Upward")
    {
        HandL.image_index = 0;
        HandR.image_index = 0;
        YOffset += ((150 - YOffset) / 12);
        Size += ((1 - Size) / 12);
        var Darkness = clamp(lerp(-1, 1, Size), 0, 1) * 255;
        var HandColor = make_color_rgb(Darkness, Darkness, Darkness);
        HandL.image_blend = HandColor;
        HandR.image_blend = HandColor;
        var HandLayer = (Size < 0.75) ? layer_get_id("Behind_Wall") : layer_get_id("OnWall");
        HandL.layer = HandLayer;
        HandR.layer = HandLayer;
        
        if (Frame >= 30 && HandAnimStage != "Upward")
        {
            reverb_sound(choose_from_array(SOUND_Appear), 0, 500, false, 2);
            Frame = 0;
            HandAnimStage = "Upward";
            reverb_sound(SOUND_Slam, 0, 0, false, 3, 0.5, 0.5);
            simple_sound(SOUND_Creak, 0, 0, false, 0.7, 20, 0.5);
        }
        
        global.Tools.Doors[0] = 1/30;
        global.Tools.Doors[1] = 1/30;
    }
    
    if (HandAnimStage == "Upward")
    {
        HandL.image_index = 0;
        HandR.image_index = 0;
        YSpeed -= 5;
        YOffset += YSpeed;
        var HandLayer = (YStretch > 1.2) ? layer_get_id("Behind_Wall") : layer_get_id("OnWall");
        HandL.layer = HandLayer;
        HandR.layer = HandLayer;
        YStretch = lerp(1, abs(YSpeed), 0.02);
        
        if (YOffset < 0)
        {
            Frame = 0;
            HandAnimStage = "Settle";
            YStretch = 0.9;
            YOffset = 0;
            alarm[0] = 10;
        }
    }
    else if (HandAnimStage == "Remove")
    {
        Prying = false;
        YOffset += YSpeed;
        YSpeed += -1.25;
        Size -= (Size / 50);
        var Darkness = clamp(lerp(-1, 1, Size), 0, 1) * 255;
        var HandColor = make_color_rgb(Darkness, Darkness, Darkness);
        HandL.image_blend = HandColor;
        HandR.image_blend = HandColor;
        HandL.image_index = 0;
        HandR.image_index = 0;
        var HandLayer = layer_get_id("Behind_Wall");
        HandL.layer = HandLayer;
        HandR.layer = HandLayer;
    }
    else if (HandAnimStage == "Settle")
    {
        var HandLayer = layer_get_id("OnWall");
        HandL.layer = HandLayer;
        HandR.layer = HandLayer;
        HandL.image_index = 1;
        HandR.image_index = 1;
        YOffset += ((0 - YOffset) / 5);
        YStretch += ((1 - YStretch) / 5);
        global.Tools.Doors[0] = 1/30;
        global.Tools.Doors[1] = 1/30;
        Prying = true;
        
        if (round(YOffset) == 0)
        {
            YOffset = 0;
            HandAnimStage = "Attacking";
            KillFrames = 0;
        }
    }
    else if (HandAnimStage == "Attacking")
    {
        var KillTime = lerp(14, 8, AI / 20);
        HandL.image_index = 1;
        HandR.image_index = 1;
        
        if ((input_check_pressed(UnknownEnum.Value_8) || input_check_pressed(UnknownEnum.Value_9)) && global.Power > 0)
        {
            YOffset = 0;
            YSpeed += lerp(8, 5, 0.5);
        }
        
        if (instance_exists(oLaserDoor))
            YOffset = 201;
        
        YStretch += ((1 - YStretch) / 5);
        
        if (Prying)
        {
            YOffset = max(YOffset + (YSpeed - 1), 0);
            YSpeed *= 0.75;
        }
    }
    
    if (HandL != -1 && HandR != -1)
    {
        HandL.x = 832 + (round(random_range(-0.6, 0.6)) * (HandAnimStage == "Attacking" && YOffset > 0));
        HandL.y = 586 + YOffset;
        HandR.x = 1856 + (round(random_range(-0.6, 0.6)) * (HandAnimStage == "Attacking" && YOffset > 0));
        HandR.y = 586 + YOffset;
        HandL.sprite_index = other.SPRITE_Hand;
        HandR.sprite_index = other.SPRITE_Hand;
        HandL.image_xscale = Size / YStretch;
        HandL.image_yscale = Size * YStretch;
        HandR.image_xscale = (Size / YStretch) * -1;
        HandR.image_yscale = Size * YStretch;
    }
}

Frame++;

enum UnknownEnum
{
    Value_8 = 8,
    Value_9
}
