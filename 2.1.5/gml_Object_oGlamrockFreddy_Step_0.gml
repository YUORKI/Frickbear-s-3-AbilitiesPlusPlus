var AI = global.AILevels[ID];

if (AI <= 0)
    exit;

if (TimeToApproach == 999)
{
    set_time_to_attack();
    TimeToApproach *= random_range(0.7, 1);
}

var WalkDuration = lerp(3, 1.5, global.AILevels[UnknownEnum.Value_66] / 20);
TimeToApproach -= 0.016666666666666666;

if (!LeaningIn && Position < 0)
{
    Position = 0;
    PositionSpeed = 0;
}

if (TimeToApproach <= 0 && !instance_exists(oLaserDoor))
{
    if (StepPosition <= 0)
    {
        Side = find_available_doorway(true);
        
        if (Side == 1 && character_active(UnknownEnum.Value_28) && global.Timer > (oFuntimeFoxy.Showtime - 15))
        {
            if (global.DoorOccupant[0] == -1)
                Side = -1;
            else
                Side = 0;
        }
        
        if (Side != 0)
            occupy_doorway(ID, Side);
        
        ReverseWalk = false;
    }
    
    if (Side != 0)
    {
        StepPosition += ((0.016666666666666666 / WalkDuration) * (ReverseWalk ? -1 : 1));
        StepSoundTimer -= (1 / (10 * WalkDuration));
        
        if (!LeaningIn)
        {
            if (StepSoundTimer <= 0)
            {
                if (StepPosition >= 1)
                {
                    if (global.Doors[sign_to_binary(Side)])
                    {
                        ReverseWalk = true;
                        TimeToApproach = 2;
                        audio_play_sound(sfxMetalImpact, 10, false);
                        audio_play_sound(sfxScoop, 10, false);
                        StepPosition = 0.99;
                        global.Power -= 5;
                        clear_doorway(ID, Side);
                        alarm[1] = 120;
                    }
                    else
                    {
                        simple_sound(sfxServo, 500 * Side, 0, false, 0.5, 15, 0.8);
                        Voiceclip = reverb_sound(PossibleLines[LinesSaid++], 500 * Side, 0, false, 2, 0.5, 0.33);
                        LeaningIn = true;
                        
                        if (LinesSaid >= array_length(PossibleLines))
                            LinesSaid = 0;
                    }
                }
                
                reverb_sound(FootstepSound ? sfxGlamrockFreddy_Footstep1 : sfxGlamrockFreddy_Footstep2, lerp(100 * Side, 500 * Side, StepPosition), lerp(-500, 0, StepPosition), false, lerp(0.25, 1.5, StepPosition), 0.5, lerp(0.5, 0.25, StepPosition));
                StepSoundTimer = 1;
                FootstepSound = !FootstepSound;
            }
        }
    }
    else
    {
        Side = 1;
    }
}

if (LeaningIn && !FunctionallyHit)
{
    with (instance_find(oDoor, sign_to_binary(Side)))
    {
        Bounce = true;
        BounceFloor = other.BonkHeight;
    }
    
    if (!audio_is_playing(Voiceclip))
    {
        PositionSpeed = 0.05;
        LeaningIn = false;
        set_time_to_attack();
        Voiceclip = -1;
        simple_sound(sfxServo, 500 * Side, 0, false, 0.75, 15, 0.9);
        clear_doorway(ID, Side);
        
        with (oDoor)
            Bounce = false;
    }
}

if (FunctionallyHit)
    global.Tools.Doors[sign_to_binary(Side)] = 0.1;

if (Hit)
{
    PositionSpeed = lerp(PositionSpeed, (LeaningIn - Position) * 0.3, 0.1);
    HeadOffset += HeadOffsetSpeed;
    HeadOffsetSpeed = lerp(HeadOffsetSpeed, (0 - HeadOffset) * 0.2, 0.1);
    GregX += (((1088 + (512 * Side) + 256) - GregX) / 15);
    GregSize += ((1 - GregSize) / 10);
    GregY += GregYSpeed;
    GregYSpeed += 1;
    GregSquishSpeed = lerp(GregSquishSpeed, (1 - GregSquish) * 0.2, 0.2);
    GregSquish += GregSquishSpeed;
}
else
{
    PositionSpeed = lerp(PositionSpeed, (LeaningIn - Position) * 0.15, LeaningIn ? 0.2 : 0.1);
}

Position += PositionSpeed;
Squish += ((1 - Squish) / 5);
var Shake = (Hit / 2) + ((1 - Squish) * 30);
var BodyStretch = lerp(1 / Squish, 1, 0.8);
var BodyX = (1344 - (Side * -408)) + (lerp(-96, 8, Position) * Side);
var BodyY = 756;
var BodyA = lerp(0, -45 * Side, Position) + (random(Shake) * random_sign()) + (dsin(abs(TimeToApproach * 180)) * -2);
var HeadX = BodyX + rot_x(0, HeadOffset - (110 * BodyStretch), BodyA);
var HeadY = BodyY + rot_y(0, HeadOffset - (110 * BodyStretch), BodyA);
var HeadA = ((HeadOffset + (random(Shake) * random_sign())) * (-1 * Side)) + (dsin(abs((TimeToApproach * 180) + 45)) * -2);
BonkHeight = HeadY - 610;
var UpperArmX = BodyX + rot_x(80 * Side, -88 * BodyStretch, BodyA);
var UpperArmY = BodyY + rot_y(80 * Side, -88 * BodyStretch, BodyA);
var UpperArmA = point_direction(UpperArmX, UpperArmY, BodyX, BodyY + 48);
var LowerArmX = UpperArmX + rot_x(74, 0, UpperArmA);
var LowerArmY = UpperArmY + rot_y(74, 0, UpperArmA);
var LowerArmA = 0;

if (!Hit)
{
    GregX = BodyX + rot_x(24 * Side, -32, BodyA);
    GregY = BodyY + rot_y(24 * Side, -32, BodyA);
}

with (UpperArm)
{
    DrawDepth = 80;
    sprite_index = sGlamrockFreddy_ArmUpper;
    image_index = 0;
    x = UpperArmX;
    y = UpperArmY;
    image_xscale = 1;
    image_yscale = other.Side * -1;
    image_angle = UpperArmA * -1;
}

with (Body)
{
    DrawDepth = 81;
    sprite_index = sGlamrockFreddy_Body;
    image_index = other.Hit;
    x = BodyX;
    y = BodyY;
    image_xscale = BodyStretch;
    image_yscale = 1 / BodyStretch;
    image_angle = BodyA * -1;
}

with (Head)
{
    DrawDepth = 82;
    sprite_index = sGlamrockFreddy_Head;
    image_index = other.Hit;
    x = HeadX;
    y = HeadY;
    image_xscale = 1 / other.Squish;
    image_yscale = other.Squish;
    image_angle = HeadA * -1;
}

with (LowerArm)
{
    DrawDepth = 83;
    sprite_index = sGlamrockFreddy_ArmLower;
    image_index = 0;
    x = LowerArmX;
    y = LowerArmY;
    image_xscale = other.Side * -1;
    image_yscale = 1;
    image_angle = LowerArmA * -1;
}

with (Gregory)
{
    DrawDepth = 85;
    sprite_index = other.Hit ? sGlamrockFreddy_Gregory : sNOTHING;
    image_index = 0;
    x = other.GregX;
    y = other.GregY;
    image_xscale = other.GregSize / other.GregSquish;
    image_yscale = other.GregSize * other.GregSquish;
}

enum UnknownEnum
{
    Value_28 = 28,
    Value_66 = 66
}
