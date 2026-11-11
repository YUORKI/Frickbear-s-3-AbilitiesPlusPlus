ID = UnknownEnum.Value_6;
TFScores = [];

for (var i = 0; i < 16; i++)
    TFScores[i] = timer_based_minigame(i) ? 360 : 0;

Active = true;
BeatenScores = array_create(array_length(TFScores), false);
BeatenAmount = 0;
SPRITE_Cameras = skin_sprite(sCameras_ToyFreddy, UnknownEnum.Value_6, ["sprite_01.png", "sprite_02.png"]);
SOUND_Defeated = skin_sound(voc_ToyFreddy_AwMan, UnknownEnum.Value_6, "voc_defeated");
SOUND_Crying = skin_sound(voc_ToyFreddy_Sobbing, UnknownEnum.Value_6, "voc_crying");
audio_sound_gain(SOUND_Crying, 0, 0);

if (global.Timer > 348)
    instance_destroy();

function jumpscare_at_6AM()
{
    if (instance_exists(oJumpscare))
        return false;
    
    if (Active && global.AILevels[UnknownEnum.Value_6] > 0)
    {
        jumpscare(UnknownEnum.Value_6, 0);
        return true;
    }
    
    return false;
}

enum UnknownEnum
{
    Value_6 = 6
}
