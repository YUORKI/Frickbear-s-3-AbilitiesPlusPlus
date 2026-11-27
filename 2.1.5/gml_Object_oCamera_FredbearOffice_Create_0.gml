application_surface_draw_enable(false);
BossMode = UnknownEnum.Value_0;
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_texrepeat(true);
CameraRotation = 0;
CameraX = x;
CameraY = y;
CameraZ = 256;
CameraXTo = x;
CameraYTo = y - 32;
CameraZTo = 256;
MonitorUp = 0;
FOV = 64;
global.BaseBrightness = 0.5;
global.Brightness = global.BaseBrightness;
global.Doors = [0, 0];
global.Flashlight = false;
global.Timer = 0;
global.Lights = 1;
global.CamUp = 0;
global.Cam = 1;
global.TVCam = [1, 2];
global.SavedCam = 1;
global.MaskDown = 0;
global.Fan = 0;
global.MonitorSystem = "Cameras";
global.Heater = false;
global.TimeOfDeath = 0;
CamAnimation = 0;
MaskAnimation = 0;
CamAlpha = 1;
Usage = 0;
audio_bus_main.effects[0] = undefined;
global.DoorGen = 0;
global.Power = 100;
global.Panic = 0;
global.Tokens = 0;
global.Temperature = 0;
global.CupcakeMeter = 0;
MinTokens = 0;
MinTemperature = 0;
FanSpeed = 1;
FlashlightPower = 1;
InfinitePowerCutoffTime = 0;
Freeze = false;
global.Tools = 
{
    Camera: 0,
    Doors: [0, 0],
    Fan: 0,
    Mask: 0,
    Flashlight: 0,
    AudioLure: [0, 0]
};
Usage = 0;
Freezeframe = undefined;
JawLevel = 0;
ShowMalhare = false;
StareFrames = -180;
ZapAlpha = 0;
Itemless = 2;
OnetimersScheduled = false;
ScreenshotsTaken = 0;
EntranceAlpha = 0;
TokenBoxSpeed = 0;
TokenBoxOffset = 0;
TokenBoxValue = global.Tokens;
HandheldUp = false;
HandheldOffset = 740;
TimeOffset = 0;
Muffler = audio_effect_create(AudioEffectType.LPF2);
Muffler.cutoff = 600;
MaskSprite = sMask_Mike;
MaskImage = 0;
FaceSprites = sNOTHING;
SongID = sfxNOTHING;
Usage = 0;

enum UnknownEnum
{
    Value_0,
    Value_4 = 4
}

enum AudioEffectType
{
    Bitcrusher,
    Delay,
    Gain,
    HPF2,
    LPF2,
    Reverb1,
    Tremolo,
    PeakEQ,
    HiShelf,
    LoShelf,
    EQ,
    Compressor
}
