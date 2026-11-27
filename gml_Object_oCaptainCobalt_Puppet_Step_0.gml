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
    image_index = other.HeadSprite;
    DrawDepth = 100;
}

with (Head)
{
    x = HeadX;
    y = HeadY;
    image_angle = HeadA * -1;
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
    
    Sound = simple_sound(oCaptainCobalt.SOUND_Screech, lengthdir_x(512, Direction), lengthdir_y(512, Direction), true, 0.75);
    simple_sound(oCaptainCobalt.SOUND_Popup, lengthdir_x(512, Direction), lengthdir_y(512, Direction), false, 0.25);
    var Lines = [sfxNOTHING];
    
    switch (HeadSprite)
    {
        case 0:
            Name = "Foxy";
            Lines = oCaptainCobalt.SOUND_Appear1;
            break;
        
        case 1:
            Name = "Roxy";
            Lines = oCaptainCobalt.SOUND_Appear2;
            break;
        
        case 2:
            Name = "Kit";
            Lines = oCaptainCobalt.SOUND_Appear3;
            break;
        
        case 3:
            Name = "Bawson";
            Lines = oCaptainCobalt.SOUND_Appear4;
            break;
        
        case 4:
            Name = "Renard";
            Lines = oCaptainCobalt.SOUND_Appear5;
            break;
        
        default:
            Name = "Secret";
            break;
    }
    
    if (Vocalize)
        reverb_sound(choose_from_array(Lines), (90 - Direction) * 5, (Direction == 90) ? 450 : 0, false, 0.85);
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
        {
            var side = instance_exists(oCaptainCobalt_Puppet_Facehugger) ? 1 : -1;
            jumpscare(UnknownEnum.Value_76, 0);
        }
        
        if (STAT_HP > 0)
        {
            with (oCaptainCobalt)
                spawn_puppet(other.HeadSprite, 2 - other.STAT_HP);
        }
        
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
        
        var Lines = [sfxNOTHING];
        
        switch (HeadSprite)
        {
            case 0:
                Lines = oCaptainCobalt.SOUND_Scare1;
                break;
            
            case 1:
                Lines = oCaptainCobalt.SOUND_Scare2;
                break;
            
            case 2:
                Lines = oCaptainCobalt.SOUND_Scare3;
                break;
            
            case 3:
                Lines = oCaptainCobalt.SOUND_Scare4;
                break;
            
            case 4:
                Lines = oCaptainCobalt.SOUND_Scare5;
                break;
        }
        
        if (TimeToKill > 0)
        {
            reverb_sound(choose_from_array(Lines), (90 - Direction) * 5, (Direction == 90) ? 450 : 0, false, 0.75);
            simple_sound(oCaptainCobalt.SOUND_Scare, lengthdir_x(512, Direction), lengthdir_y(512, Direction), false, 1);
        }
        
        with (oCaptainCobalt)
        {
            PuppetSlots[other.SlotID] = false;
            PuppetsActive--;
        }
    }
}

audio_sound_pitch(Sound, 1 + (FlashMeter / 2));

enum UnknownEnum
{
    Value_76 = 76
}
