if (global.AILevels[UnknownEnum.Value_73] <= 0)
{
    audio_sound_gain(sfxMimicGarble, 0, 0);
    exit;
}

if (Possessed)
{
    var OnCam = global.Cam == Camera && global.CamUp && global.MonitorSystem == "Cameras";
    audio_sound_gain(sfxMimicGarble, OnCam * random_range(0, 0.5), 0);
}

enum UnknownEnum
{
    Value_73 = 73
}
