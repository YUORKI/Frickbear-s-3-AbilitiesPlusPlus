ID = UnknownEnum.Value_9;
WaitForFlip = false;
Exposure = 0;
CamOrder = array_shuffle([1, 2, 3, 4, 5, 6, 7, 8]);

while (CamOrder[0] == 1)
    CamOrder = array_shuffle([1, 2, 3, 4, 5, 6, 7, 8]);

CamNum = 0;
CurrentCam = CamOrder[CamNum];
StickyNote = instance_create_layer(1480, 570, "OnWall", oOfficeSprite);
SPRITE_Cameras = skin_sprite(sCameras_Mangle, UnknownEnum.Value_9, "sprite_01.png");
SPRITE_StickyNote = skin_sprite(sMangleStickyNote, UnknownEnum.Value_9, ["sprite_02.png", "sprite_03.png", "sprite_04.png", "sprite_05.png", "sprite_06.png", "sprite_07.png", "sprite_08.png", "sprite_09.png", "sprite_10.png"]);
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_Mangle, ID, "camradar.png");
SOUND_Garble = skin_sound(sfxMangleGarble, UnknownEnum.Value_9, "sq_garble");

enum UnknownEnum
{
    Value_9 = 9
}
