Timer = 60;
BodyY = 256;
HeadY = 256;
ArmX = -64;
ArmY = 256;
BodyAngle = 30;
HeadAngle = 0;
Mode = "Reset";
Tolerance = 1;
Exposure = 0;
BaseX = 1336;
BaseY = 750;
Arm = instance_create_layer(BaseX, BaseY, "Behind_Wall", oOfficeSprite);
Head = instance_create_layer(BaseX, BaseY, "Behind_Wall", oOfficeSprite);
Body = instance_create_layer(BaseX, BaseY, "Behind_Wall", oOfficeSprite);
SPRITE_Head = skin_sprite(sWitheredFoxyHead, UnknownEnum.Value_13, ["sprite_01.png", "sprite_02.png", "sprite_03.png", "sprite_04.png"]);
SPRITE_Body = skin_sprite(sWitheredFoxyBody, UnknownEnum.Value_13, ["sprite_05.png"]);
SPRITE_Arm = skin_sprite(sWitheredFoxyArm, UnknownEnum.Value_13, ["sprite_06.png", "sprite_07.png"]);
SOUND_Creak = skin_sound(sfxEndoCreak, UnknownEnum.Value_13, "sq_creak");
SOUND_Slam = skin_sound(sfxMetalSlam, UnknownEnum.Value_13, "sq_slam");
SOUND_Scare = skin_sound(sfxWindowScare, UnknownEnum.Value_13, "sq_scare");
SOUND_Screech = skin_sound(sfxFreddleScreech_Foxy, UnknownEnum.Value_13, "sq_screech");
SOUND_Ambience = skin_sound(sfxWindowAmbience, UnknownEnum.Value_13, "sq_ambience");
SOUND_Defeated = skin_sound(sfxShortCircuit, UnknownEnum.Value_13, "sq_defeated");

with (Body)
{
    sprite_index = sNOTHING;
    DrawDepth = 1;
}

with (Head)
{
    sprite_index = sNOTHING;
    DrawDepth = 2;
}

with (Arm)
{
    sprite_index = sNOTHING;
    DrawDepth = 3;
}

Screech = sfxNOTHING;

enum UnknownEnum
{
    Value_13 = 13
}
