var ID = UnknownEnum.Value_13;
var AI = global.AILevels[ID];

if (AI == 0)
    exit;

var FadeoutTime = lerp(2.5, 3.5, AI / 20);
var ExposureLimit = lerp(18, 8, AI / 20);
var Flashed = global.Flashlight && Mode == "Clench" && Timer < -1 && abs(o3DMouse.x - 1344) < 256 && !global.CamUp && !global.TurnedAround;

if (Mode == "Reset")
{
    Timer = round((900 / (AI + 10)) * random_range(0.75, 1.25));
    Mode = "Wait";
    Exposure = 0;
    Tolerance = 1;
    BodyY = 256;
    HeadY = 256;
    ArmX = -64;
    ArmY = 256;
    BodyAngle = 30;
    HeadAngle = 0;
}

if (Mode == "Wait" && Timer <= 0)
{
    if (window_available())
    {
        global.WindowOccupant = ID;
        Mode = "Rise";
        simple_sound(SOUND_Creak, 0, -200, false);
        audio_sound_gain(SOUND_Screech, 0, 0);
        Screech = simple_sound(SOUND_Screech, 0, -200, true, 1);
        Tolerance = 1;
    }
    else
    {
        Timer += 0.016666666666666666;
    }
}

if (Mode == "Rise")
{
    ArmX -= (ArmX / 8);
    ArmY -= (ArmY / 8);
    
    if (round(ArmY / 4) == 0)
    {
        Mode = "Fall";
        simple_sound(SOUND_Slam, 0, -500, false);
    }
}

if (Mode == "Fall")
{
    ArmX -= (ArmX / 8);
    ArmY += ArmY;
    
    if (ArmY > 90)
    {
        ArmY = 0;
        Mode = "Clench";
    }
}

if (Mode == "Clench")
    ArmY += ((-8 - ArmY) / 4);

HandFrame = 0;
HeadFrame = Flashed;
audio_sound_gain(SOUND_Screech, Flashed * (1 - (Tolerance / 2)), 0);
var FlashSecondsLeft = Tolerance * FadeoutTime;
var WillKill = FlashSecondsLeft > (ExposureLimit - Exposure);

if (Mode == "Clench")
    HandFrame = 1;

if (Mode == "Die")
{
    HeadFrame = 2;
    
    if (WillKill)
        HeadFrame = 3;
}

if ((Tolerance <= 0 || WillKill) && Mode == "Clench")
{
    Mode = "Die";
    ArmY += 50;
    Timer = 0.25;
    
    if (!WillKill)
    {
        simple_sound(SOUND_Defeated, 50, -200, false, 0.5);
        block_tokens();
    }
    
    audio_stop_sound(SOUND_Ambience);
    audio_stop_sound(Screech);
}

if (Mode != "Die")
{
    if (Timer == -1)
    {
        simple_sound(SOUND_Creak, 0, -500, false);
        audio_play_sound(SOUND_Scare, 5, false, 1);
        simple_sound(SOUND_Ambience, 0, -500, true, 1);
    }
    
    if (Timer < -1)
    {
        BodyY -= (BodyY / 8);
        HeadY -= (HeadY / 10);
        BodyAngle -= (BodyAngle / 10);
        Exposure += 0.016666666666666666;
    }
}
else
{
    BodyY = min(0.5 + (BodyY * 1.5), 256);
    HeadY = min(0.4 + (HeadY * 1.5), 256);
    
    if (Timer > 0)
        ArmY -= (ArmY / 4);
    else
        ArmY = min(0.25 + (ArmY * 1.5), 256);
    
    ArmX += ((-20 - ArmX) / 8);
    BodyAngle += ((30 - BodyAngle) / 10);
    HeadAngle += ((30 - BodyAngle) / 5);
    
    if (ArmY == 256)
    {
        Mode = "Reset";
        clear_window(ID);
        
        if (WillKill)
            jumpscare(ID, 0);
    }
}

with (Body)
{
    sprite_index = other.SPRITE_Body;
    image_index = 0;
    x = other.BaseX;
    y = other.BaseY + other.BodyY;
    image_angle = (other.BodyAngle * -1) + round(random_range(-0.6, 0.6));
}

with (Head)
{
    sprite_index = other.SPRITE_Head;
    image_index = other.HeadFrame;
    x = other.BaseX + 2 + (-88 * dsin(other.BodyAngle));
    y = (other.BaseY - 88) + other.HeadY;
    var HeadShakiness = random_range(-0.6, 0.6);
    
    if (Flashed)
        HeadShakiness *= (11 - (other.Tolerance * 10));
    
    HeadShakiness = round(HeadShakiness);
    image_angle = (other.HeadAngle * -1) + HeadShakiness;
}

with (Arm)
{
    sprite_index = other.SPRITE_Arm;
    image_index = other.HandFrame;
    x = other.BaseX + 100 + other.ArmX;
    y = other.BaseY + other.ArmY;
    image_angle = 0;
}

if (Flashed)
    Tolerance -= (oCamera.FlashlightPower / (FadeoutTime * 60));

Timer -= 0.016666666666666666;

enum UnknownEnum
{
    Value_13 = 13
}
