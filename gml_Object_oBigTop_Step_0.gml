var AI = global.AILevels[ID];

if (!Active)
{
    var TimeToAttack = lerp(45, 25, AI / 20) * Randomizer;
    
    if ((Frame / 60) > TimeToAttack && AI > 0)
    {
        Side = find_available_doorway();
        
        if (Side != 0)
        {
            simple_sound(sfxEndoCreak, 500 * Side, 0, false, 2, 10, 0.75);
            Active = true;
            Hand = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
            HandAnimStage = "Lower";
            Frame = 0;
            occupy_doorway(ID, Side);
        }
    }
}
else if (Hand != -1)
{
    if (HandAnimStage == "Lower" || HandAnimStage == "Upward")
    {
        Hand.image_index = 0;
        YOffset += ((150 - YOffset) / 12);
        Size += ((1 - Size) / 12);
        var Darkness = clamp(lerp(-1, 1, Size), 0, 1) * 255;
        Hand.image_blend = make_color_rgb(Darkness, Darkness, Darkness);
        Hand.layer = (Size < 0.75) ? layer_get_id("Behind_Wall") : layer_get_id("OnWall");
        
        if (Frame >= 30 && HandAnimStage != "Upward")
        {
            Frame = 0;
            HandAnimStage = "Upward";
            reverb_sound(sfxMetalSlam, 500 * Side, 0, false, 3, 0.5, 0.5);
            Eyes = instance_create_layer(-256, -256, "Behind_Wall", oOfficeSprite);
            EyePosition = 0;
        }
        
        global.Tools.Doors[sign_to_binary(Side)] = 1/30;
    }
    
    if (HandAnimStage == "Upward")
    {
        image_index = 0;
        YSpeed -= 5;
        YOffset += YSpeed;
        Hand.layer = (YStretch > 1.2) ? layer_get_id("Behind_Wall") : layer_get_id("OnWall");
        YStretch = lerp(1, abs(YSpeed), 0.02);
        
        if (YOffset < 0)
        {
            Frame = 0;
            HandAnimStage = "Settle";
            YStretch = 0.9;
            YOffset = 0;
            reverb_sound(sfxBigTopMusicBox, 500 * Side, 0, false, 1, 1, 0.5);
            alarm[0] = 10;
        }
    }
    else if (HandAnimStage == "Settle")
    {
        Hand.layer = layer_get_id("OnWall");
        Hand.image_index = 1;
        YOffset += ((0 - YOffset) / 5);
        YStretch += ((1 - YStretch) / 5);
        global.Tools.Doors[sign_to_binary(Side)] = 1/30;
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
        Hand.image_index = 1;
        
        if ((input_check_pressed(UnknownEnum.Value_8) && Side == -1) || ((input_check_pressed(UnknownEnum.Value_9) && Side == 1) && global.Power > 0))
            YSpeed += lerp(8, 5, 0.5);
        
        if (instance_exists(oLaserDoor))
            YOffset = 201;
        
        YStretch += ((1 - YStretch) / 5);
        
        if (Prying)
        {
            YOffset = max(YOffset + (YSpeed - 1), 0);
            YSpeed *= 0.75;
        }
        
        if (YOffset > 200)
        {
            KillFrames = 0;
            Hand.layer = layer_get_id("Behind_Wall");
            Hand.image_index = 0;
            
            if (Prying)
            {
                Frame = 0;
                Randomizer = random_range(0.8, 1.2);
                Prying = false;
                audio_stop_sound(sfxBigTopMusicBox);
                block_tokens();
            }
            
            Size += ((0.5 - Size) / 5);
            YSpeed = 5;
            global.Doors[sign_to_binary(Side)] = true;
            global.Tools.Doors[sign_to_binary(Side)] = 1/30;
            
            if (Frame > 30)
            {
                instance_destroy(Hand);
                Hand = -1;
                instance_destroy(Eyes);
                Eyes = -1;
                Active = false;
                clear_doorway(ID, Side);
            }
        }
        
        KillFrames += ((YOffset == 0) ? (1/30) : 0.016666666666666666);
        
        if (KillFrames > KillTime)
            jumpscare(ID, Side);
    }
    
    if (Hand != -1)
    {
        Hand.x = 1344 + (512 * Side) + (round(random_range(-0.6, 0.6)) * (HandAnimStage == "Attacking" && YOffset > 0));
        Hand.y = 586 + YOffset;
        Hand.sprite_index = sBigTop_Hand;
        Hand.image_xscale = Size / YStretch;
        Hand.image_yscale = Size * YStretch;
    }
    
    if (Eyes != -1)
    {
        Eyes.x = 1088 + ((Side == -1) ? (-512 + lerp(32, 192, EyePosition)) : (1024 - lerp(32, 192, EyePosition)));
        Eyes.y = 448 + lerp(150, 228, EyePosition) + EyeYOffset;
        Eyes.image_angle = lerp(0, -70, EyePosition) * Side;
        Eyes.sprite_index = sBigTop_Eyes;
        EyeYOffset += (((YOffset / 6) - EyeYOffset) / 10);
        EyePosition += EyeSpeed;
        EyeSpeed = lerp(EyeSpeed, (Prying - EyePosition) / 15, 0.1);
    }
}

Frame++;

enum UnknownEnum
{
    Value_8 = 8,
    Value_9
}
