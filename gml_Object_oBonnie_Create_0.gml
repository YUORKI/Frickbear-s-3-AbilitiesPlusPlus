ID = UnknownEnum.Value_1;
Frame = 0;
Stage = "ShowStage";
WaitTime = 90;
EyeSize = 0;
BaseY = 640;
Side = -1;
Eyes = instance_create_layer(1344 + (Side * 512), BaseY, "Behind_Wall", oOfficeSprite);
RandomValue = random_range(0.75, 1.25);
Growl = undefined;

with (Eyes)
{
    sprite_index = sHallwayEyes;
    image_index = 0;
    image_alpha = other.EyeSize;
    y = (other.BaseY - (other.EyeSize * 16)) + 16;
}

SPRITE_Cameras = skin_sprite(sCameras_Bonnie, ID, ["sprite_01.png", "sprite_02.png", "sprite_03.png"]);
SPRITE_Eyes = skin_sprite(sHallwayEyes, ID, ["sprite_04.png"]);
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_Bonnie, ID, "camradar.png");
SOUND_Steps = skin_sound(sfxSteps, ID, "sq_move");
SOUND_Growl = skin_sound(sfxGrowl, ID, "sq_growl");

enum UnknownEnum
{
    Value_1 = 1
}
