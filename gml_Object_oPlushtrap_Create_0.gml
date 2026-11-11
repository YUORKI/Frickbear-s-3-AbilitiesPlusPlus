ID = UnknownEnum.Value_21;
OfficeSprite = undefined;
Mode = "Wait";
Timer = 0;
Exposure = 0;
EarL = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
EarR = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
Head = instance_create_layer(0, 0, "Behind_Wall", oOfficeSprite);
_x = 320;
_y = -2000;
_angle = 30;
EarAngle = 30;
Move = false;
XSpeed = -4;
Side = 1;
Anger = 0;
Door = 0;
SPRITE_Head = skin_sprite(sPlushtrapHead, UnknownEnum.Value_21, ["sprite_01.png", "sprite_02.png"]);
SPRITE_Ear = skin_sprite(sPlushtrapEar, UnknownEnum.Value_21, ["sprite_03.png", "sprite_04.png"]);
SOUND_Scrape = skin_sound(sfxPlushtrapScrape, UnknownEnum.Value_21, "sq_scrape");
SOUND_Caught = skin_sound(voc_Plushtrap_ACK, UnknownEnum.Value_21, "voc_caught");
Cooldown = 0;

enum UnknownEnum
{
    Value_21 = 21
}
