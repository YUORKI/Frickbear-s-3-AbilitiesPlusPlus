var AI = global.AILevels[ID];
var TimeToAppear = lerp(70, 36, AI / 20) * Randomizer;
var TimeToKill = lerp(24, 14, AI / 20);
var TimePerFlash = lerp(45, 25, AI / 20);
var FlashesNeeded = round(lerp(2, 6, AI / 20));
var ChanceToMove = round(lerp(5, 1, AI / 20));
AngleSpeed = lerp(AngleSpeed, angle_difference(TargetAngle, Angle) * 0.2, 0.25);
Angle += AngleSpeed;
var BlindsOpen = instance_find(oWindowBlinds, sign_to_binary(Side)).Open;

if (Timer > TimeToAppear && !Active && instance_find(oWindowBlinds, 0).FullyClosed && instance_find(oWindowBlinds, 1).FullyClosed && window_available())
{
    global.WindowOccupant = ID;
    initialize();
    Active = true;
    Head = instance_create_layer(999, 999, "Behind_Wall", oOfficeSprite);
    Body = instance_create_layer(999, 999, "Behind_Wall", oOfficeSprite);
    LUpperArm = instance_create_layer(999, 999, "Behind_Wall", oOfficeSprite);
    RUpperArm = instance_create_layer(999, 999, "Behind_Wall", oOfficeSprite);
    LLowerArm = instance_create_layer(999, 999, "Behind_Wall", oOfficeSprite);
    RLowerArm = instance_create_layer(999, 999, "Behind_Wall", oOfficeSprite);
    Pelvis = instance_create_layer(999, 999, "Behind_Wall", oOfficeSprite);
    TotalFlashesNeeded = FlashesNeeded;
    reverb_sound(sfxIgnitedFreddy_Laugh, 0, 400, false, 1);
    Static = audio_play_sound(sfxIgnitedFreddy_Static, 8, true);
    audio_sound_gain(Static, 0, 0);
}

Flashed = Active && point_distance(x, y - 14, o3DMouse.x, o3DMouse.y) <= (34 * oCamera.FlashlightPower) && angle_difference(TargetAngle, Angle) < 15 && global.Flashlight;

if (Active)
{
    audio_sound_gain(Static, BlindsOpen ? (0.1 + ((1 - FlashHP) / 4) + (Flashed * 0.3)) : 0.1, BlindsOpen ? 0 : 500);
    
    if (Flashed)
        KillTimer -= (3 / TimePerFlash);
    else if (AttackMode)
        KillTimer += 0.08333333333333333;
    else
        KillTimer += 0.016666666666666666;
    
    if (KillTimer > TimeToKill)
        jumpscare(ID);
}

if (Flashed && TotalFlashesNeeded > 0)
{
    FlashHP -= (oCamera.FlashlightPower / TimePerFlash);
    
    if (FlashHP <= 0)
    {
        TotalFlashesNeeded--;
        FlashHP = 1;
        
        if (TotalFlashesNeeded <= 0)
        {
            block_tokens();
            clear_window(ID);
            reverb_sound(sfxIgnitedFreddy_Hit2, 15, false, false, 1.2, 1, 0.1);
            TargetAngle = 90;
            YSpeed = -2.5;
        }
        else
        {
            audio_play_sound(sfxIgnitedFreddy_Hit1, 15, false, 1, 0, random_range(0.8, 1.2));
            TargetAngle += irandom_range(90, 270);
            AngleSpeed = sign(angle_difference(TargetAngle, Angle)) * -0.2;
            
            if (irandom(ChanceToMove) == 0)
                Side *= -1;
        }
    }
}

if (TotalFlashesNeeded <= 0 && Active)
{
    CenterY += YSpeed;
    YSpeed += 2;
    
    if (CenterY >= (DefaultCenterY + 512))
        initialize();
    
    audio_stop_sound(Static);
}

var XTarget = DefaultCenterX + (112 * Side);
XSpeed = lerp(XSpeed, (XTarget - CenterX) * 0.1, 0.25);
CenterX += XSpeed;

if (AI > 0)
    Timer += 0.016666666666666666;

var TorsoA = point_direction(x, y, CenterX, CenterY + 128) + 90 + (Flashed ? random_range(-1, 1) : 0) + (XSpeed * -1);
var HeadA = other.Flashed ? ((random_range(-8, 8) * (1 - (FlashHP * 0.5))) / lerp(TotalFlashesNeeded, 1, 0.5)) : 0;
var HeadOffset = dsin(Timer * 45) * 5;
x = CenterX + lengthdir_x(XRange, Angle) + rot_x(0, HeadOffset, TorsoA);
y = CenterY + lengthdir_y(YRange, Angle) + rot_y(0, HeadOffset, TorsoA);

if (Head != -1)
{
    var RUpperArmX = x + rot_x(53, 23, TorsoA);
    var RUpperArmY = y + rot_y(53, 23, TorsoA);
    var RUpperArmA = point_direction(RUpperArmX, RUpperArmY, CenterX + (XRange * 3), CenterY + 160);
    var LUpperArmX = x + rot_x(-53, 23, TorsoA);
    var LUpperArmY = y + rot_y(-53, 23, TorsoA);
    var LUpperArmA = point_direction(LUpperArmX, LUpperArmY, CenterX - (XRange * 3), CenterY + 160);
    var RLowerArmX = RUpperArmX + rot_x(52, 0, RUpperArmA);
    var RLowerArmY = RUpperArmY + rot_y(52, 0, RUpperArmA);
    var RLowerArmA = point_direction(RLowerArmX, RLowerArmY, CenterX + XRange, CenterY + 160);
    var LLowerArmX = LUpperArmX + rot_x(52, 0, LUpperArmA);
    var LLowerArmY = LUpperArmY + rot_y(52, 0, LUpperArmA);
    var LLowerArmA = point_direction(LLowerArmX, LLowerArmY, CenterX - XRange, CenterY + 160);
    var PelvisX = x + rot_x(0, 80, TorsoA);
    var PelvisY = y + rot_y(0, 80, TorsoA);
    
    with (Head)
    {
        sprite_index = sIgnitedFreddy_Head;
        x = other.x;
        y = other.y;
        image_angle = HeadA;
        DrawDepth = 50;
        image_xscale = -1;
    }
    
    with (Body)
    {
        sprite_index = sIgnitedFreddy_Torso;
        x = other.x;
        y = other.y;
        image_angle = TorsoA * -1;
        DrawDepth = 49;
        image_xscale = -1;
    }
    
    with (LLowerArm)
    {
        sprite_index = sIgnitedFreddy_LowerArm;
        x = LLowerArmX;
        y = LLowerArmY;
        image_angle = LLowerArmA * -1;
        image_yscale = 1;
        DrawDepth = 47;
        image_index = 0;
    }
    
    with (LUpperArm)
    {
        sprite_index = sIgnitedFreddy_UpperArm;
        x = LUpperArmX;
        y = LUpperArmY;
        image_angle = LUpperArmA * -1;
        image_yscale = 1;
        DrawDepth = 48;
        image_index = 0;
    }
    
    with (RLowerArm)
    {
        sprite_index = sIgnitedFreddy_LowerArm;
        x = RLowerArmX;
        y = RLowerArmY;
        image_angle = RLowerArmA * -1;
        image_yscale = 1;
        DrawDepth = 47;
        image_index = 1;
    }
    
    with (RUpperArm)
    {
        sprite_index = sIgnitedFreddy_UpperArm;
        x = RUpperArmX;
        y = RUpperArmY;
        image_angle = RUpperArmA * -1;
        image_yscale = 1;
        DrawDepth = 48;
        image_index = 1;
    }
    
    with (Pelvis)
    {
        sprite_index = sIgnitedFreddy_Pelvis;
        x = PelvisX;
        y = PelvisY;
        image_angle = 0;
        DrawDepth = 46;
        image_xscale = -1;
    }
}
