var AI = global.AILevels[ID];
var MaxRage = lerp(7.5, 2.5, AI / 20);
var SatisfactionQuota = lerp(2, 5, AI / 20);
var AnchorX = 1358;
var AnchorY = 740;
var LookFrame = 60;
var LookedAt = abs(o3DMouse.x - 1344) < 128 && !global.CamUp && !global.TurnedAround;

if (Active)
{
    var Speedup = lerp(1, 2, Rage / MaxRage);
    
    if (Satisfied)
    {
        YOffset += YOffsetSpeed;
        YOffsetSpeed = lerp(YOffsetSpeed, (((Frame < 90) ? 0 : 160) - YOffset) * 0.2, 0.25);
        x = AnchorX;
        image_angle = dsin(Frame * 4) * 2;
        
        if (Frame >= 120)
        {
            Active = false;
            reset_timer(AI);
            instance_destroy(Head);
            instance_destroy(Body);
            Head = -1;
            Body = -1;
            clear_window(ID);
        }
    }
    else
    {
        if (Frame < 45)
        {
            AngleOffset *= 0.92;
            YOffset *= 0.92;
        }
        else if (Frame < LookFrame)
        {
            AngleOffset += ((20 - AngleOffset) / 5);
        }
        else if (Frame == LookFrame)
        {
            AngleSpeed = -8;
            Head.DrawDepth -= 2;
            reverb_sound(choose_from_array(SOUND_Appear), 0, 400);
            audio_play_sound(SOUND_Look, 15, false);
            audio_play_sound(SOUND_Ambience, 15, true);
            audio_play_sound(SOUND_Charge, 10, true);
        }
        else
        {
            AngleOffset += AngleSpeed;
            AngleSpeed = lerp(AngleSpeed, (0 - AngleOffset) * 0.3, 0.2);
            AngleShift += ((1 - AngleShift) / 15);
            
            if (LookedAt)
            {
                Satisfaction += 0.016666666666666666;
                Rage = max(0, Rage - 0.0033333333333333335);
            }
            else
            {
                Satisfaction -= (1/120);
                Rage += ((global.CamUp ? 0.5 : 1) / 60);
                Satisfaction = max(Satisfaction, 0);
            }
            
            if (Rage >= MaxRage)
                jumpscare(ID);
            
            audio_sound_gain(SOUND_Charge, LookedAt, 0);
            audio_sound_pitch(SOUND_Charge, lerp(1, 2, Satisfaction / SatisfactionQuota));
        }
        
        if (Satisfaction >= 5)
        {
            audio_stop_sound(SOUND_Charge);
            audio_stop_sound(SOUND_Ambience);
            audio_play_sound(SOUND_Complete, 10, false);
            reverb_sound(choose_from_array(SOUND_Satisfied), 0, 400);
            block_tokens();
            Satisfied = true;
            AngleSpeed = 2;
            YOffsetSpeed = 10;
            Frame = 0;
            Head.sprite_index = sNOTHING;
        }
        
        x = AnchorX - (YOffset * 0.5);
        image_angle = AngleOffset + ((Frame > 90) * (round(random_range(-0.55, 0.55)) + (dsin((Frame - LookFrame) * 3 * Speedup) * -2)) * AngleShift);
    }
    
    y = AnchorY + YOffset;
    var BodyImage = Satisfied;
    var BodyX = x;
    var BodyY = y;
    var BodyAngle = image_angle;
    var HeadImage = Frame >= LookFrame;
    var HeadX = x + rot_x(-35, -67, image_angle);
    var HeadY = y + rot_y(-35, -67, image_angle);
    var HeadAngle = (AngleOffset * 1.5) + ((Frame > 90) * (round(random_range(-0.55, 0.55)) + (dsin((Frame - 30 - LookFrame) * 3 * Speedup) * -3)) * AngleShift);
    
    with (Body)
    {
        x = BodyX;
        y = BodyY;
        image_index = BodyImage;
        image_angle = BodyAngle * -1;
    }
    
    with (Head)
    {
        x = HeadX;
        y = HeadY;
        image_index = HeadImage;
        image_angle = HeadAngle * -1;
    }
}

if (!Active && AI > 0)
{
    WaitTime -= 0.016666666666666666;
    
    if (WaitTime <= 0 && window_available())
    {
        audio_play_sound(SOUND_Creak, 15, false);
        Body = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
        Head = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
        
        with (Body)
        {
            DrawDepth = 2;
            sprite_index = other.SPRITE_Body;
        }
        
        with (Head)
        {
            DrawDepth = 3;
            sprite_index = other.SPRITE_Head;
        }
        
        Frame = 0;
        AngleSpeed = 0;
        AngleOffset = 45;
        YOffset = 100;
        YOffsetSpeed = 0;
        AngleShift = 0;
        Satisfied = false;
        Satisfaction = 0;
        Rage = 0;
        Active = true;
        global.WindowOccupant = ID;
    }
}

Frame++;
