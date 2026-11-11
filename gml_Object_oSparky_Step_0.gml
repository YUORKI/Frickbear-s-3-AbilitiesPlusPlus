var AI = global.AILevels[ID];
var SpawnTime = lerp(120, 30, AI / 20) * Randomizer;
var FindTime = lerp(60, 25, AI / 20);
depth = 2;
WaitTime = min(WaitTime, SpawnTime);

if (!Active || ShockTimer > 0)
    LastCam = global.Cam;

if (global.Cam != LastCam)
{
    if (LastCam == 0 || global.Cam == 0)
    {
        LastCam = global.Cam;
    }
    else
    {
        LastCam = global.Cam;
        
        with (oCamButton)
        {
            if (CamNumber == other.CurrentCam)
            {
                other.CurrentCamX = x;
                other.CurrentCamY = y;
            }
            
            if (CamNumber == other.LastCam)
            {
                other.ClickedCamX = x;
                other.ClickedCamY = y;
            }
        }
        
        var BarkVolume = 0.5 + (50 / max(point_distance(CurrentCamX, CurrentCamY, ClickedCamX, ClickedCamY), 25));
        reverb_sound(SOUND_Hint, (CurrentCamX - ClickedCamX) * 10, (CurrentCamY - ClickedCamY) * 10, false, BarkVolume, 1, 1 - (BarkVolume / 3));
        KillTimer -= 1;
    }
}

OffsetSpeed = lerp(OffsetSpeed, ((ShockTimer == 0) - Offset) * 0.5, 0.2);
Offset += OffsetSpeed;
Shake += ShakeSpeed;
ShakeSpeed -= (ShakeSpeed / 25);

if (ShockTimer > 0 && global.Cam == CurrentCam)
{
    Active = false;
    KillTimer = 999;
    
    if (ShockTimer > 2)
    {
        oCameraUI.ZapAlpha = random_range(1.5, 0);
    }
    else
    {
        oCameraUI.ZapAlpha = ShockTimer / 2;
        WaitTime = 360;
    }
}

if (ShockTimer > 0)
{
    ShockTimer -= 0.016666666666666666;
    
    if (ShockTimer == 0)
    {
        Randomizer = random_range(0.8, 1.2);
        WaitTime = SpawnTime * random_range(0.9, 1.1);
    }
}

if (WaitTime > 0 && AI > 0)
{
    WaitTime -= 0.016666666666666666;
    
    if (WaitTime <= 0)
    {
        reverb_sound(SOUND_Appear, 0, -400, false, 2, 1, 0.2);
        Active = true;
        CurrentCam = irandom_range(1, 8);
        
        if (instance_exists(oMangle) && oMangle.CurrentCam == CurrentCam)
            CurrentCam = (CurrentCam % 8) + 1;
        
        LastCam = global.Cam;
        KillTimer = FindTime;
        WaitTime = 0;
    }
}

if (WaitTime == 0)
{
    KillTimer -= 0.016666666666666666;
    
    if (global.CamUp && global.MonitorSystem == "Cameras")
        KillTimer -= 0.016666666666666666;
    
    if (KillTimer <= 0)
        jumpscare(ID, 0);
}
