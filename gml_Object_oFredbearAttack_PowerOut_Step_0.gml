depth = 1;

if (ShockTimer == 3)
    audio_stop_sound(GarbleSound);

var CamFunction = function(arg0, arg1)
{
    return arg0 == global.Cam;
};

if (array_contains(PossibleCams, global.Cam))
    array_delete(PossibleCams, array_find_index(PossibleCams, CamFunction), 1);

if (array_length(PossibleCams) < (8 - CamSwitchesToFind) && CurrentCam == 99 && !PhonyMode)
    CurrentCam = global.Cam;

if (PhonyMode)
{
    if (array_contains(AffectedCams, global.Cam) || ShockTimer > 0)
        CurrentCam = global.Cam;
    else
        CurrentCam = "Wario Camera";
}

if (PoweroutTimer <= 60 && Active)
{
    var Percent = PoweroutTimer / 60;
    global.Brightness = random_range(1.5, lerp(0, 1, Percent));
    
    if (PoweroutTimer == 60)
        global.Brightness = 1;
    
    PoweroutTimer++;
}

if (PoweroutTimer <= 30 && !Active)
{
    if (PoweroutTimer == 0)
        audio_play_sound(sfxPowerOn, 15, false, 0.5);
    
    global.Brightness = random_range(0.5, 2);
    
    if (PoweroutTimer == 30)
        global.Brightness = global.BaseBrightness;
    
    PoweroutTimer++;
}

if (ShockTimer > 0 && global.Cam == CurrentCam)
{
    Active = false;
    
    if (ShockTimer > 2)
        oCameraUI.ZapAlpha = random_range(1.5, 0);
    else
        oCameraUI.ZapAlpha = ShockTimer / 2;
}

if (ShockTimer > 0)
{
    KillTimer = 9999;
    ShockTimer -= 0.016666666666666666;
    
    if (ShockTimer <= 0)
        instance_destroy();
}

if (!global.CamUp)
    audio_sound_gain(GarbleSound, 0.1, 0);
else if (global.Cam == CurrentCam)
    audio_sound_gain(GarbleSound, 1, 0);
else
    audio_sound_gain(GarbleSound, 0.25, 0);

KillTimer -= 0.016666666666666666;

if (KillTimer <= 0)
    jumpscare(PhonyMode ? UnknownEnum.Value_127 : UnknownEnum.Value_126);

VentWarningTimer = (VentWarningTimer + 1) % 60;

enum UnknownEnum
{
    Value_126 = 126,
    Value_127
}
