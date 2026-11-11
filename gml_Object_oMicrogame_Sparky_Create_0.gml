event_inherited();
CurrentCam = 1;
LastCam = 1;
Active = true;
WaitTime = 0.016666666666666666;
KillTimer = 999;
Randomizer = random_range(0.8, 1.2);
var CamOptions = [1, 3, 6];

if (global.MicrogameLevel == 1)
    CamOptions = [1, 3, 4, 5, 6];

if (global.MicrogameLevel == 2)
    CamOptions = [1, 2, 3, 4, 5, 6, 7, 8];

with (oCamButton)
{
    if (!array_contains(CamOptions, CamNumber))
        instance_destroy();
}

CurrentCam = choose_from_array(CamOptions);

with (oCamera)
{
    global.CamUp = true;
    CamAnimation = 1;
}

LastCam = global.Cam;
reverb_sound(sfxSparkyCue, 0, -400, false, 2, 1, 0.2);
global.MicrogameWin = false;
ID = UnknownEnum.Value_43;

enum UnknownEnum
{
    Value_43 = 43
}
