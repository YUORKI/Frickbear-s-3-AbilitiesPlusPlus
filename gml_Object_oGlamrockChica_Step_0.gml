var AI = global.AILevels[ID];
var MaxKillTimer = lerp(25, 15, AI / 20);
var TimeToAppear = lerp(78, 38, AI / 20) * Randomizer;
var AnchorX = 1344;
var AnchorY = 740;
var LookFrame = 60;
ToppingCount = ceil(lerp(0, 5, AI / 20));
ToppingBins = floor(lerp(4, 7, AI / 20));
var LookedAt = abs(o3DMouse.x - 1344) < 128 && !global.CamUp && !global.TurnedAround;

if (Active)
{
    var Speedup = lerp(2, 1, KillTimer / MaxKillTimer);
    
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
            audio_play_sound(sfxWhipCrack, 15, false);
            audio_play_sound(sfxRoxyAmbience, 15, true);
            reverb_sound(choose_from_array(SOUND_Appear), 0, 400);
            RequestedToppings = [];
            
            for (var i = 0; i < ToppingBins; i++)
                array_push(RequestedToppings, i);
            
            Hungry = true;
            KillTimer = MaxKillTimer;
            SpeechBubbleOffsetSpeed = 4;
            
            while (array_length(RequestedToppings) > ToppingCount)
                array_delete(RequestedToppings, irandom(array_length(RequestedToppings) - 1), 1);
            
            RequestedToppings = array_shuffle(RequestedToppings);
            
            with (instance_create_depth(0, 0, 0, oGlamrockChica_AssemblyMenu))
                BinCount = other.ToppingBins;
        }
        else
        {
            AngleOffset += AngleSpeed;
            AngleSpeed = lerp(AngleSpeed, (0 - AngleOffset) * 0.3, 0.2);
            AngleShift += ((1 - AngleShift) / 15);
            KillTimer -= (1 / (global.CamUp ? 120 : 60));
            
            if (KillTimer <= 0)
                jumpscare(ID);
        }
        
        x = AnchorX + (YOffset * 0.5);
        image_angle = (AngleOffset * -1) + ((Frame > 90) * (round(random_range(-0.55, 0.55)) + (dsin((Frame - LookFrame) * 3 * Speedup) * -2)) * AngleShift);
    }
    
    y = AnchorY + YOffset;
    var BodyImage = Satisfied;
    var BodyX = x;
    var BodyY = y;
    var BodyAngle = image_angle;
    var HeadImage = Frame >= LookFrame;
    var HeadX = x + rot_x(35, -54, image_angle);
    var HeadY = y + rot_y(35, -54, image_angle);
    var HeadAngle = (AngleOffset * -1.5) + ((Frame > 90) * (round(random_range(-0.55, 0.55)) + (dsin((Frame - 30 - LookFrame) * 3 * Speedup) * -3)) * AngleShift);
    
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
    WaitTime += 0.016666666666666666;
    
    if (WaitTime >= TimeToAppear && window_available())
    {
        audio_play_sound(sfxEndoCreak, 15, false);
        Body = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
        Head = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
        
        with (Body)
        {
            DrawDepth = 3;
            sprite_index = sGlamrockChica_Body;
        }
        
        with (Head)
        {
            DrawDepth = 2;
            sprite_index = sGlamrockChica_Head;
        }
        
        Frame = 0;
        AngleSpeed = 0;
        AngleOffset = 45;
        YOffset = 100;
        YOffsetSpeed = 0;
        AngleShift = 0;
        Satisfied = false;
        Rage = 0;
        Active = true;
        global.WindowOccupant = ID;
    }
}

Frame++;
