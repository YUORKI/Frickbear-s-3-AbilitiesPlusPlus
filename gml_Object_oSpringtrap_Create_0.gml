ID = UnknownEnum.Value_20;
Frame = 0;
Stage = 0;
WaitTime = 90;
EyeSize = 0;
BaseY = 640;
Side = -1;
RandomValue = random_range(0.75, 1.25);
CurrentCam = 4;
SOUND_Move = skin_sound(sfxSpringtrapMove1, ID, "sq_move");
SOUND_MoveClose = skin_sound(sfxSpringtrapMove2, ID, "sq_moveclose");

function play_move_sound()
{
    fuzz_up(CurrentCam);
    
    switch (Stage)
    {
        case 0:
            simple_sound(SOUND_Move, 0, -200, false, 0.1);
            CurrentCam = UnknownEnum.Value_8;
            break;
        
        case 1:
            simple_sound(SOUND_Move, 0, -200, false, 0.25);
            CurrentCam = UnknownEnum.Value_1;
            break;
        
        case 2:
            simple_sound(SOUND_Move, 0, -200, false, 0.25);
            CurrentCam = UnknownEnum.Value_2;
            break;
        
        case 3:
            simple_sound(SOUND_MoveClose, Side * 200, -32, false, 0.5);
            CurrentCam = UnknownEnum.Value_4;
            break;
        
        case 4:
            simple_sound(SOUND_Move, Side * 300, 0, false, 1);
            CurrentCam = UnknownEnum.Value_4;
            break;
    }
    
    RandomValue = random_range(0.75, 1.25);
    fuzz_up(CurrentCam);
}

SPRITE_Cameras = skin_sprite(sCameras_Springtrap, ID, ["sprite_01.png", "sprite_02.png", "sprite_03.png", "sprite_04.png", "sprite_05.png"]);
SPRITE_CamRadar = skin_sprite(sCamRadarIcon_Springtrap, ID, "camradar.png");
depth = 99;

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_4 = 4,
    Value_8 = 8,
    Value_20 = 20
}
