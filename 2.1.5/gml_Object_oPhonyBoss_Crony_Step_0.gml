var BodyX = x + lengthdir_x(HeightOffset, (BodyAngle + image_angle) - 90);
var BodyY = y + lengthdir_y(HeightOffset, (BodyAngle + image_angle) - 90);
var BodyA = BodyAngle + image_angle;
var HeadX = x + lengthdir_x(HeightOffset - 56, (BodyAngle + image_angle) - 90);
var HeadY = y + lengthdir_y(HeightOffset - 56, (BodyAngle + image_angle) - 90);
var HeadA = BodyAngle + image_angle + HeadAngle + round(random_range(-0.6, 0.6));

with (Body)
{
    x = BodyX;
    y = BodyY;
    image_angle = BodyA * -1;
    sprite_index = sPhonyBoss_CronieBody;
    image_index = other.HeadSprite;
    DrawDepth = 100;
}

with (Head)
{
    x = HeadX;
    y = HeadY;
    image_angle = HeadA * -1;
    sprite_index = sPhonyBoss_CronieHead;
    image_index = other.HeadSprite;
    DrawDepth = 101;
}

var BlockedByDoor = (x < 1088 && global.Doors[0]) || (x > 1600 && global.Doors[1]);
sprite_index = sNOTHING;

if (Sound == undefined)
{
    var Direction = 90;
    
    if (x < 1088)
        Direction = 180;
    else if (x > 1600)
        Direction = 0;
    
    Sound = simple_sound(sfxFreddleScreech_Phony, lengthdir_x(512, Direction), lengthdir_y(512, Direction), true, 0.5);
    simple_sound(sfxCartoonPop, lengthdir_x(512, Direction), lengthdir_y(512, Direction), false, 0.25);
}

if (!Flashed)
{
    OffsetSpeed = lerp(OffsetSpeed, (0 - HeightOffset) * 0.5, 0.25);
    HeadTiltFrames--;
    
    if (!BlockedByDoor)
        TimeToKill -= (STAT_KillSpeed / 60);
    
    if (HeadTiltFrames <= 0)
    {
        HeadAngleTarget = irandom_range(-3, 3) * 10;
        HeadTiltFrames = random_range(30, 120);
    }
}
else
{
    OffsetSpeed += 0.75;
    BodyAngle = HeadAngle / -4;
    
    if (HeightOffset > 256)
    {
        if (TimeToKill <= 0)
            jumpscare(UnknownEnum.Value_127, 0);
        
        instance_destroy();
    }
}

HeightOffset += OffsetSpeed;
HeadAngle += HeadAngleSpeed;
HeadAngleSpeed = lerp(HeadAngleSpeed, (HeadAngleTarget - HeadAngle) * 0.8, 0.2);

if (((global.Flashlight && point_distance(o3DMouse.x, o3DMouse.y, HeadX, HeadY) < (80 * STAT_FlashGenerosity * oCamera.FlashlightPower) && !global.CamUp) || TimeToKill <= 0) && !Flashed && (!BlockedByDoor || instance_exists(oLaserDoor)))
{
    FlashMeter += (STAT_FlashSpeed / 20);
    TimeToKill -= (STAT_KillSpeed / 60);
    HeadAngleTarget = 0;
    HeadAngle = random_range(FlashMeter * -1, FlashMeter) * 6;
    BodyAngle = random_range(FlashMeter * -1, FlashMeter) * 6;
    HeadTiltFrames++;
    
    if (FlashMeter >= 1)
    {
        audio_stop_sound(Sound);
        STAT_HP--;
        OffsetSpeed = -5;
        
        if (TimeToKill > 0)
            HeadAngleSpeed = 20;
        
        HeadAngleTarget = 0;
        Flashed = true;
        var Direction = 90;
        
        if (x < 1088)
            Direction = 180;
        else if (x > 1600)
            Direction = 0;
        
        if (TimeToKill > 0)
            simple_sound(sfxPhonyCronieScare, lengthdir_x(512, Direction), lengthdir_y(512, Direction), false, 1);
    }
}

audio_sound_pitch(Sound, 1 + (FlashMeter / 2));

enum UnknownEnum
{
    Value_127 = 127
}
